<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@include file="../includes/header.jsp" %>
<link href="/resources/css/reviewget.css" rel= "stylesheet">
<div id="page-wrapper">
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">board register</h1>
   </div>
                <!-- /.col-lg-12 -->
</div>
   <div class="row">
	<div class="col-lg-12">
	<div class="panel panel-default panel-line">
		<div class="panel-heading">
  			글 수정 페이지
  		</div>
  		<form action="">
                        <!-- /.panel-heading -->
        <div class="panel-body">
			<div >
		          <label>글 번호</label><br>
		          <input class='' name='bdNum' readonly="readonly" value='<c:out value="${board.bdNum}"/>'>
		          <input type="hidden" name='opBdNum'value='${board.opBdNum}'>
		    </div>
			<label>지역 입력</label>
		         <br>
		          <input  class="backCol region" name="bigRegion" value="">
		          <br>
		          <label>상세 장소</label>
		         <br>
		          <input class="backCol region" name="smallRegion">
		          <input type="" name="bdRegion" value="${board.bdRegion}">
		    </div>	    
			<div >
		          <label>한줄평</label>
		         <br>
		          <input class="backCol" name="bdTitle" value='<c:out value="${board.bdTitle}"/>' >
		    </div>
		<div class="">
		         <!--  <label>별점 입력</label> -->
		          <select name="opStar" class="star">
		          <option value="1">★☆☆☆☆</option>
		          <option value="2">★★☆☆☆</option>
		          <option value="3">★★★☆☆</option>
		          <option value="4">★★★★☆</option>
		          <option value="5">★★★★★</option>		          
		          </select>
		    </div>
		    <hr>
			<div class="">
		          <label>작성자</label>
		        <input class="writer" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
		   </div>
		   <div class="">
		      <label>상세리뷰</label>
		      <textarea class="backCol" rows="5" cols="50" name="bdContent" ><c:out value="${board.bdContent}"/></textarea>
		   </div>
		   <button class="btn btn-default" data-oper='modify'>Modify btn</button>
		     <button  class="btn btn-danger" data-oper='remove'>remove btn</button>
		   <button class="btn btn-info" data-oper='list'>List</button>
			<input type='hidden' name='pageNum' value="<c:out value="${cri.pageNum}"/>">
			<input type='hidden' name='amount' value="<c:out value="${cri.amount}"/>">
			<input type='hidden' name='type' value="<c:out value="${cri.type}"/>">
			<input type='hidden' name='keyword' value="<c:out value="${cri.keyword}"/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>
		</div>
		<div class="row">
			<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Files</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>
							
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
			</div>

</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	 var opStarValue = "${board.opStar}";
	  // 해당 값을 가진 <option> 요소를 선택
	  $('select[name="opStar"]').val(opStarValue);
	 
	//원본 지역 문자열
	var originalRegion = "${board.bdRegion}";

	  //공백을 기준으로 지역 문자열을 분리
	var regions = originalRegion.split(' ');

	  //분리된 지역 문자열의 길이 확인
	  if (regions.length >= 2) {
	    // 첫 번째 부분을 대분류(bigRegion) 입력 필드에 설정
	    $('input[name="bigRegion"]').val(regions.slice(0,2).join(' '));

	    // 나머지 부분을 작은 분류(smallRegion) 입력 필드에 설정
	    $('input[name="smallRegion"]').val(regions.slice(2).join(' '));
	  } else {
	    // 부분이 충분히 없을 경우 전체 지역 문자열을 대분류 입력 필드에 설정
	    $('input[name="bigRegion"]').val(originalRegion);
	  }
	  
	//지역창 합해서 bdRegion 만들기
		 $('.region').change(function(){
	  	 	let re1 = $('[name=bigRegion]').val();
	       let re2 = $('[name=smallRegion]').val();
	       let result = re1+" "+re2;
	       console.log(result);
	  		$('[name=bdRegion]').val(result);
	  	})
	  	
	let formObj = $("form");
	
	$('.btn').on("click",function(e){
		e.preventDefault();
		
		
		var operation = $(this).data("oper");
		console.log(operation);
		
		switch(operation){
			case "remove":
				formObj.attr("action","/board/remove").attr("method","post").submit();
				break;
			case "modify":
				 var str="";
				$(".uploadResult ul li").each(function(i,obj){
					var jobj = $(obj);
						
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
						
				})
				
				formObj.append(str).submit(); 
				formObj.attr("action","/board/modify").attr("method","post").submit();
				break;
			case "list":
				//self.location="/board/list";
				formObj.attr("action", "/board/list").submit();
				var pageNumtag = $("input[name='pageNum']").clone();
				var amountag = $("input[name='amount']").clone();
				var keywordtag = $("input[name='keyword']").clone();
				var typetag = $("input[name='type']").clone();
				formObj.empty();
				formObj.append(pageNumtag);
				formObj.append(amountag);
				formObj.append(typetag);
				formObj.append(keywordtag);
				//return;
				break;
		}
		formObj.submit();
		/*if(operation == 'remove'){
			
		}*/
		
	});
	
});
</script>
<script>
$(document).ready(function(){
	(function(){
		var bno='<c:out value="${board.bdNum}"/>';
		
		$.getJSON("/board/getAttachList",{bno:bno},function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, obj){
				//일반첨부파일이면
				if(!obj.fileType){	
					console.log("일반");
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename'"+obj.fileName+"' data-type'"+obj.fileType+"'>"
							+"<div><span>"+ obj.fileName+"</span><br>" 
							+"<button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'>" 
							+"<i class='fa fa-times'></i></button><br>";
					str +=	"<img src='/resources/img/attach.png'></div></li>";
				//이미지파일이면				
				}else{
					console.log("이미지");
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);			
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
					+"<button type='button' class='btn btn-warning btn-circle' data-file=\'"+fileCallPath+"\' data-type='image'>"
					+"<i class='fa fa-times'></i></button><br>"		
					+"<img src='/display?fileName="+fileCallPath+"'></div></li>";
						
				}
				
			});
			
			$(".uploadResult ul").html(str);
		})//end json
		})()//end function
		
		$(".uploadResult").on("click","button",function(){
			if(confirm("remove this file?")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		})
		
		//첨부파일 추가
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize= 5242880;//5mb
	
	function checkExtension(fileName, fileSize){
		if(fileSize >=maxSize){
			alert("file size over");
			
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			
			return false;
		}
		return true;
	}
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i =0 ;i < files.length;i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;	
			}
			formData.append("uploadFile",files[i]);			
			}
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,
			contentType:false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data:formData,
				type:'POST',
				dataType:'json',
				success:function(result){
					console.log(result);
					
					showuploadResult(result);
				}
		})
		
	})
	function showuploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i,obj){
			//일반파일일때
			if(!obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>"
						+"<div><span>"+ obj.fileName+"</span><button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'>" 
						+"<i class='fa fa-times'></i></button><br>";
				str +=	"<img src='/resources/img/attach.png'></div></li>";
			}else{
				
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);

			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>"
					+"<div><span>"+obj.fileName+"</span><button type='button' class='btn btn-warning btn-circle' data-file=\'"+fileCallPath+"\' data-type='image'>"
					+"<i class='fa fa-times'></i></button><br>"
					+"<img src='/display?fileName="+fileCallPath+"'></div></li>";
					
			}
		})
		uploadUL.append(str);
	}
})

</script>
<%@include file="../includes/footer.jsp" %>   
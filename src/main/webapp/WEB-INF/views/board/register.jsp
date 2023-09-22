<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri ="http://www.springframework.org/security/tags" prefix = "sec"%>
<%@include file="../includes/header.jsp" %>
<!-- <link href="/resources/css/register.css" rel= "stylesheet"> -->
<link href="/resources/css/reviewget.css" rel= "stylesheet">
<div id="page-wrapper">
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">작성하기</h1>
   </div>
                <!-- /.col-lg-12 -->
</div>

  <div class="row">
	<div class="col-lg-12">
	<div class="panel panel-default panel-line">
		<div class="panel-heading">
  			글 작성 페이지
  		</div>
                        <!-- /.panel-heading -->
        <div class="panel-body">
			<form action="/board/register" method="post" role="form">
			<div >
		          <label>한줄평 입력</label>
		         <br>
		          <input class="backCol" name="title">
		    </div>
			<div class="">
		         <!--  <label>별점 입력</label> -->
		          <select name="opStar" class="star">
		          <option value="1">★☆☆☆☆</option>
		          <option value="2">★★☆☆☆</option>
		          <option value="3">★★★☆☆</option>
		          <option value="4">★★★★☆</option>
		          <option value="5" selected="selected">★★★★★</option>
		          
		          </select>
		    </div>
		    <hr>
			<div class="">
		          <label>작성자</label>
		          <br>
		        <input class="writer" name="writer" value='<sec:authentication property="principal.username"/>' readonly >
		   </div>
		   <br>
		   <div class="">
		      <label>상세리뷰</label>
		      <br/>
		      <textarea class="backCol" rows="5" cols="50" name="content"></textarea>
		   </div>
		   
		   <button type="submit" class="btn btn-default">submit btn</button>
		   <button type="reset" class="btn btn-default">reset btn</button>
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>
		</div>
	  </div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일 첨부하기</div>
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
<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
		
		 var str="";
		$(".uploadResult ul li").each(function(i,obj){
			var jobj = $(obj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileOriName' value='"+jobj.data("fileOriName")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].filePath' value='"+jobj.data("filePath")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileValid' value='"+jobj.data("fileValid")+"'>";
			
		})
		
		formObj.append(str).submit(); 
		
	})
	
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
				
				str += "<li data-filePath='"+obj.filePath+"' data-fileOriName='"+obj.fileOriName+"' data-filename='"+obj.fileName+"' data-fileValid='"+obj.image+"'>"
						+"<div><span>"+ obj.fileOriName+"</span><button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'>" 
						+"<i class='fa fa-times'></i></button><br>";
				str +=	"<img src='/resources/img/attach.png'></div></li>";
			}else{
				
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.fileName+"_"+obj.fileOriName);

			str += "<li data-filePath='"+obj.filePath+"' data-fileName='"+obj.fileName"' data-fileOriname='"+obj.fileOriName+"' data-fileValid='"+obj.image+"'>"
					+"<div><span>"+obj.fileOriName+"</span><button type='button' class='btn btn-warning btn-circle' data-file=\'"+fileCallPath+"\' data-type='image'>"
					+"<i class='fa fa-times'></i></button><br>"
					+"<img src='/display?fileName="+fileCallPath+"'></div></li>";
					
			}
		})
		uploadUL.append(str);
	}
	//파일 삭제
	$(".uploadResult").on("click", "button",function(){
		//console.log("delete");
		var targetFile = $(this).data("file");
		var type=$(this).data("type");
		var targetLi=$(this).closest("li");
		$.ajax({
			url:'/deleteFile',
		data:{fileName:targetFile, type:type},
		beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		dataType:'text',
		type:'POST',
			success : function(result){
				alert(result);
				targetLi.remove();
			}
		})
	})
	
})
</script>
</body>
</html>
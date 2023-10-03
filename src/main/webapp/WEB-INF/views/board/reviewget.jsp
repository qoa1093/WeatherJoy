<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix = "sec"%>    
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/reviewget.css" rel= "stylesheet">

<div id="page-wrapper">
<div class="row">
   <div class="col-lg-12">
      <h1>리뷰 게시판</h1>
   </div>                
</div>
   <div class="row">
	<div class="col-lg-12">
	<div class="panel panel-default panel-line">
		<div class="panel-heading">
  			상세 리뷰
  		</div>                
        <div class="panel-body">
			<div>
		          <label>글 번호</label>
		          <br>
		          <input  name='bdNum' readonly="readonly" value='<c:out value="${board.bdNum}"/>'>
		    </div>
		    <hr>
		    <div>
		          
		          <c:forEach begin="1" end="${board.opStar}" varStatus="loop">
		          							<span class="star">
											 <c:out value="★"/>
										  	</span>
										  </c:forEach>
										  <c:forEach begin="${board.opStar}" end="4" varStatus="loop">
								          <span class="star">
											 <c:out value="☆"/>
								          </span>
										  </c:forEach>
		    </div>
		    <br>
			<div>
		          <label>한줄 리뷰</label><br>
		          <input  name="title" class="backCol" value='<c:out value="${board.bdTitle}"/>' readonly="readonly">
		    </div>
		<hr>
			<div>
		          <label>작성자</label>
		          <br>
		        <input name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
		   </div>
		   <br>
		   <div>
		      <label>상세리뷰</label><br>
		      <textarea class="backCol" rows="5" cols="50" name="content"  readonly="readonly"><c:out value="${board.bdContent}"/></textarea>
		   </div>
		   
		   <button data-oper="modify" class="btn btn-default"> Modify btn</button>
		   <button data-oper="list" class="btn btn-default">List</button>
		   
		   <form id='operForm' action="/board/modify" method="get">
			<input type='hidden' name='bdNum' value="<c:out value="${board.bdNum}"/>">
			<input type='hidden' name='pageNum' value="<c:out value="${cri.pageNum}"/>">
			<input type='hidden' name='amount' value="<c:out value="${cri.amount}"/>">
			<input type='hidden' name='keyword' value="<c:out value="${cri.keyword}"/>">
			<input type='hidden' name='type' value="<c:out value="${cri.type}"/>">
		   </form>
		</div>			
	</div>		
	
 
		<!--<div class='bigPictureWrapper'>
			<div class='bigPicture'>
			</div>
		</div>
		 <div class="row">
			<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Files</div>
						<div class="panel-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
			</div> -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class= "fa fa-comments fa-fw"></i> reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>new Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<!-- <li class = "left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2023-08-21 16:17</small>
							</div>
							<p>good job!</p>
						</div>
					</li> -->			
				</ul>
			</div>
			<div class = "panel-footer">
			
			</div>		
		</div>
		</div>
 </div>
</div>




<!-- Modal 댓글 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
              aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label>Reply</label> 
              <input class="form-control" name='reply' value='New Reply!!!!'>
            </div>      
            <div class="form-group">
              <label>Replyer</label> 
              <input class="form-control" name='replyer' value='replyer' readonly>
            </div>
            <div class="form-group">
              <label>Reply Date</label> 
              <input class="form-control" name='replydate' value='2018-01-01 13:13'>
            </div>   
         </div>
	 	 <div class="modal-footer">
	        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
	        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
	        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
	        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
	      </div>
		</div>
        <!-- /.modal-content -->
      </div>
    <!-- /.modal-dialog -->
    </div>
<!-- /.modal 댓글 -->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
		var bdNumValue='<c:out value="${board.bdNum}"/>';
		var replyUL = $('.chat');
		showList(1);
		//댓글 리스트를 보여주기
		function showList(page){
			replyService.getList({bdNum:bdNumValue,page:page||1}, function(replyCnt,list){
				console.log("replyCnt-----"+replyCnt);						
				console.log(list);
			
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				if(list==null || list.length == 0){
					replyUL.html("");
					
					return;
				}
				//console.log(list.length);
				for (var i = 0, len = list.length ||0 ; i < len; i++) {
					str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str +="<div><div class='header'><strong class = 'primary-font'>["+list[i].rno+"]"+list[i].replyer+"</strong>";
					str +="<small class = 'pull-right text-mouted'>"+replyService.displayTime(list[i].replydate)+"</small></div>";
					str +="<p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
			})
		}
		//댓글 페이지번호 출력
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) *10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum*10>=replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum * 10<replyCnt){
				next = true;
			}
			var str = "<ul class='pagination pull-right'>";
			
			if(prev){
				str+= "<li class='page-item'><a class='page-link' href='"+ (startNum -1)+"'>Previous</a></li>";
			}
			for (var i = startNum; i <= endNum; i++) {
				var active = pageNum == i? "active": "";
				
				str+= "<li class='page-item "+active+"'><a class='page-link' href='"+ i+"'>"+i+"</a></li>";
			}
			if(next){
				str+= "<li class='page-item'><a class='page-link' href='"+ (endNum +1)+"'>Next</a></li>";
			}
			str+= "</ul></div>";
			replyPageFooter.html(str);
			
		}
		
		replyPageFooter.on("click","li a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		})
		
		var modal = $('#myModal');
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replydate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		//댓글기능에서 시큐리티: replyer로 등록
		var replyer = null;
		<sec:authorize access="isAuthenticated()">
			replyer = '<sec:authentication property="principal.username"/>';
		</sec:authorize>
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$('#modalCloseBtn').on('click',function(e){
			modal.modal('hide');
		})
		//ajax실행시 csrf토큰 자동으로 첨부
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		
		})
		//추가 버튼 클릭 시 새댓글창 열리기 
		//$(document).on("click", "#addReplyBtn", function(e) {
		$('#addReplyBtn').on('click',function(e){
			modal.find("input").val("");
			//모달창에서 댓글작성자 값 보여주기
			modal.find("input[name='replyer']").val(replyer);
			if(modal.find("input[name='replyer']").val() == ""){
				alert("로그인해야 댓글을 달 수 있습니다.");
				return;
			}
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalRegisterBtn.show();
			modal.modal("show");
		})
		//작성버튼 클릭시 작성되기
		$('#modalRegisterBtn').on("click",function(e){
			var reply={
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bdNum : bdNumValue
					
			};
			console.log(reply);
			replyService.add(reply, function(result){
				
				//alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(-1);
			})
		})
		//댓글 클릭 시 수정창 띄우기
		$(".chat").on("click","li",function(e){
			var rno = $(this).data("rno");
			console.log(rno);
			replyService.get(rno, function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replydate)).attr("readonly", "readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				$(".modal").modal("show");
			})
		})
		//댓글을 수정하고 화면을 띄우기
		modalModBtn.on('click',function(e){
			if(!replyer){
				alert("로그인 후 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			var originalReplyer = modalInputReplyer.val();
			if(replyer != originalReplyer){
				alert("자신이 작성한 댓글만 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			var reply = {rno:modal.data("rno"),
						reply : modalInputReply.val(),
						replyer:originalReplyer};
			
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			})
		})
		//댓글을 삭제하고 화면을 띄우기
		modalRemoveBtn.on("click",function(e){
			var rno = modal.data("rno");
			if(!replyer){
				alert("로그인 후 삭제가 가능합니다.");
				modal.modal("hide");
				return;
			}
			var originalReplyer = modalInputReplyer.val();
			if(replyer != originalReplyer){
				alert("자신이 작성한 댓글만 삭제가 가능합니다.");
				modal.modal("hide");
				return;
			}
			replyService.remove(rno, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			})
		})
		
	})
</script>
<script>
	$(document).ready(function(){
		console.log(replyService);
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
					str +=	"<img src='/resources/img/attach.png'></div></li>";
				//이미지파일이면				
				}else{
					console.log("이미지");
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);			
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
						+"<img src='/display?fileName="+fileCallPath+"'></div></li>";
						
				}
				
			});
			
			$(".uploadResult ul").html(str);
		})//end json
		})()//end function
		
		 $('.uploadResult').on("click","li",function(e){
			console.log("view image");
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			//이미지이면
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
				
			}else{
				self.location = "/download?fileName="+path;
			}
		})
		function showImage(fileCallPath){
			alert(fileCallPath);
			$(".bigPictureWrapper").css("display","flex").show();
			$(".bigPicture")
				.html("<img src='/display?fileName="+fileCallPath+"'>")
				.animate({width:'100%', height:'100%'},1000);
			
		}
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'},1000);
			setTimeout(function(){
				$(".bigPictureWrapper").hide();
			},1000);
		})
		
		 
		
		/* replyService.getList({bno:bnoValue,page:1},function(list){
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
		}); */
		
		
		/* replyService.add(
				{reply:"JS TEST", replyer:"Tester", bno:bnoValue},
				function(result){
					alert("result : " + result);
		}); */
		
		/* replyService.remove(24,function(count){
			if(count==="success"){
				alert("remove : ");
			}	
		}, function(err){
			alert('error..');
		}); */
		 /*replyService.update({
			rno: 22,
			bno:bnoValue,
			reply:"수정된 리플"
			}, 
				function(result){
					alert("수정완료");	
			}); 
		  */
		
	});
	
	
</script>
<script>
	$(document).ready(function(){
		var operForm = $('#operForm');
		$("button[data-oper='modify']").on("click",function(e){
			e.preventDefault();
			operForm.attr("action", "/board/modify").submit();
		})
		$("button[data-oper='list']").on("click",function(e){
			e.preventDefault();
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		})
	})

</script>
<%@include file="../includes/footer.jsp" %>   
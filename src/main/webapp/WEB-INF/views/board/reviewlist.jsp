<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">리뷰게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           한줄 리뷰 평점
                        </div>
                        <div class="panel-heading">
                        	<button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>지역명</th>
                                        <th>별점</th>
                                        <th>한줄리뷰</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="board">
                                  <tbody>
                                   	  <tr>
                                          <td>
                                          	<c:out value="${board.bdNum}"/>
                                          </td>
                                          <td>
                                          	<c:out value="${board.bdRegion}"/>
                                          </td>
                                          <td>
                                          <!-- //별 갯수만큼 for문 작성하기 -->
                                         
                                          <c:forEach begin="1" end="${board.opStar}" varStatus="loop">
											 <c:out value="★"/>
										  </c:forEach>
										  <c:forEach begin="${board.opStar}" end="4" varStatus="loop">
											 <c:out value="☆"/>
										  </c:forEach>
										  
                                          	<%-- <c:out value="${board.opStar}"/> --%>
                                          </td>
                                          <td>
                                          <a class="move" href ="<c:out value='${board.bdNum}'/>">
                                          	<c:out value="${board.bdTitle}"/><b>[<c:out value="${board.replyCnt}"/>]</b>
                                          </a>
                                          </td>
                                          <td>
                                          	<c:out value="${board.writer}"/>
                                          </td>
                                          <td>
                                          	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.bdDate}"/> 
                                          </td>
                                          <td>
                                          	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.bdRegdate}"/> 
                                          </td>
                                      </tr>                                       
                                  </tbody>
                                </c:forEach>            
                             </table> 
                             <!-- 검색처리 -->
                             <form id= "searchForm" action="/board/reviewlist" method="get"> 
                             	<select name="type">
                             	<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />> --- </option>
                             	<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />> 제목 </option>
                             	<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />> 내용 </option>
                             	<option value="R" <c:out value="${pageMaker.cri.type eq 'R' ? 'selected' : ''}" />> 지역 </option>
                             	<option value="TR" <c:out value="${pageMaker.cri.type eq 'TR' ? 'selected' : ''}" />> 제목+지역 </option>
                             	<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}" />> 제목+작성자 </option>                                 	
                             	<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}" />>제목+내용+작성자 </option>
                             	</select>
                             <input name = "keyword" value="<c:out value="${pageMaker.cri.keyword}"/>" >
                             <input type = "hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                             <input type = "hidden" name="amount" value="${pageMaker.cri.amount}">
                             
                             <button class= "btn btn-default">Search</button>
                             </form>
                             
                             
                             <div class="pull-right">
								<ul class="pagination">
                             	<c:if test="${pageMaker.prev }">
                             		<li class="paginate_button previous">
                             		<a href="${pageMaker.startPage -1}">
                             			previous
                             		</a>
                             		</li>
                             	</c:if>
                             <c:forEach var= "num" begin = "${pageMaker.startPage}" end="${pageMaker.endPage}">
                             	<li class='paginate_button ${pageMaker.cri.pageNum == num? "active" : ""}'>
                             	<a href="${num}">
                             		${num}
                             	</a>
                             	</li>
                             </c:forEach>
                             
                             <c:if test="${pageMaker.next}">
                             		<li class="paginate_button next">
                             		<a href="${pageMaker.endPage +1}">
                             			next
                             		</a>
                             		</li>
                             	</c:if>
								</ul>                             
                             </div>
                             <form id="actionForm" action="/board/reviewlist" method="get">
                             	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                             	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                             	<input type="hidden" name = "type" value="<c:out value = "${pageMaker.cri.type}"/>">
                             	<input type="hidden" name = "keyword" value="<c:out value = "${pageMaker.cri.keyword}"/>">
                             	                             
                             </form>
                             
                        </div>
                      </div> 
                      </div> 
 ${pageMaker}     
           <div id="myModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
            
         

<script type="text/javascript">
 
$(document).ready(function(){
  
  var result = '<c:out value="${result}"/>';
  
  checkModal(result);
  history.replaceState({},null,null);
  function checkModal(result) {
 
    if (result === ''|| history.state) {
      return;
    }
 	if(result === 'success'){
	$(".modal-body").html("정상적으로 처리되었습니다.");
}
    if (parseInt(result) > 0) {
      $(".modal-body").html(
          "게시글 " + parseInt(result) + " 번이 등록되었습니다.");
    }
       $("#myModal").modal("show");
  }  
  
  $("#regBtn").on("click", function(){
	  self.location = "/board/register";
  })
  
  var actionForm = $('#actionForm');
  $('.paginate_button a').on("click",function(e){
	e.preventDefault();
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
})
$('.move').on('click', function(e){
	e.preventDefault();
	var targetBno = $(this).attr("href");
	console.log(targetBno);
	actionForm.append("<input type='hidden' name='bno' value='"+ targetBno+"'> ");
	actionForm.attr("action", "/board/reviewget");
	actionForm.submit();
	

})

var searchForm = $("#searchForm");
$("#searchForm button").on("click", function(e){
	e.preventDefault();
	//console.log("-------- 확인");
	if(!searchForm.find("option:selected").val()){
		alert("키워드를 입력하세요.")
		}
	if(!searchForm.find("input[name='keyword']").val()){
	alert("키워드를 입력하세요.")
	}
	searchForm.find("input[name='pageNum']").val("1");
	searchForm.submit();
	
})


/*$('.paginate_button a').on('click',function(e){
	e.preventDefault();
	
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	//actionForm.submit();
});*/

  
});
</script>
                                    
    <%@include file="../includes/footer.jsp" %>        
                                

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
    <div class="centerClass">
            <form action="/member/signup" method="post" id="myform" autocomplete="off" role="form" accept-charset="UTF-8">
           <!-- <form id="myform"> -->
                <div class="signup-wrapper">
                	<p>아이디</p>
                    <input type="text" class="weatherSignUp" name="memId" value='<c:out value="${member.memId}"/>' readonly> 
                    <p></p>
                    <input type="hidden" name="memPw" class="weatherSignUp" value='<c:out value="${member.memPw}"/>' readonly>
                    <p>이름</p>                   
                    <input type="text" class="weatherSignUp" name = "memName" value='<c:out value="${member.memName}"/>' readonly>
                    <p>나이</p>
                    <input type="text" class="weatherSignUp" name="memAge" value='<c:out value="${member.memAge}"/>' readonly>
                    <p>연락처</p>
                    <input type="text" class="weatherSignUp" name="memPhone" value='<c:out value="${member.memPhone}"/>' readonly>
                    <p>주소</p>
                    <div class="address">
					<input type="text" class="weatherSignUp" name="memAddr" value='<c:out value="${member.memAddr}"/>' readonly>
					</div>                    
                    <p></p>
		
		
                    <span>관심분야</span>
                    <p id="checkedList">
                    <span class="Lclick hobbyspan">
                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="12">
                    	<i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>관광&nbsp;
                    </span>
                    <span class="Lclick hobbyspan">
	                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="28">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
	                    레저·스포츠&nbsp;
                    </span>
                    <span class="Lclick hobbyspan">
	                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="14">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
	                    문화시설&nbsp;
                    </span>
	                <span class="Lclick hobbyspan">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                    <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
	                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="15">
	                    축제공연행사&nbsp;
                    </span>
                    <br>
                    <span class="Lclick hobbyspan">
	                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="25">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                    <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
	                    여행코스&nbsp;
                    </span>
                    <span class="Lclick hobbyspan">
	                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="32">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
	                    숙박&nbsp;
                    </span>
                    <span class="Lclick hobbyspan">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                    <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                    <input type="checkbox" class="hobby" name="checkboxes" value="38">쇼핑&nbsp;
                    </span>
                    <span class="Lclick hobbyspan">
	                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
	                    <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                    <input type="checkbox" class="hobby" name="checkboxes" value="39">음식점&nbsp;
                    </span>
                    <input id="selectedValues" type="text" name="memHobby" value='<c:out value="${member.memHobby}"/>' readonly>
                    </p>
                    <span>반려동물 여부</span>
					<p class="centerCss">                    
                    <input type="radio" name="memAValid" value="Y">&nbsp;<span>네</span> &nbsp;&nbsp;&nbsp;<input type="radio" name="memAValid" value="N">&nbsp;<span>아니오</span>
                    </p>
					
                    <p></p>
                
                </div>
                
                    <p/>
                    
                    <p></p>
                    <button type="button" class="sign signUp-Btn" id="signUp-Btn">가입하기</button> 
                    <button type="reset" class="sign ">재등록</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
           </form>
           
           
    </div>
</body>
<script>
$(document).ready(function(){
	//console에 form 내용 전체 찍어보는 코드
$(".centerClass").on("click",'#signUp-Btn',function(e) {
var form = document.getElementById('myform');
var formData = new FormData(form);
    for (const [key, value] of formData.entries()) {
    	 console.log(key + ':', value);
    	 if (!value || value.trim() === '') return;
    }
    form.submit();
})
	//체크하면 아이콘 색이 채워지도록 변경
    $(".signup-wrapper").on("click",'.Lclick',function(e) {
        e.stopPropagation();
	    const regularIcon = $(this).find('.fa-regular');
    	const solidIcon = $(this).find('.fa-solid');
        
        if(solidIcon.css('display') ==='none') {
            regularIcon.hide();
            solidIcon.show();
            
        }else{
            regularIcon.show();
            solidIcon.hide();
            
        }
 
    })
var contextPath = '<%=request.getContextPath()%>';
var memberService = (function(){
	function idCheck(contextPath, memId){		
		var flag = false;
		console.log("멤버아이디 :"+ memId)
		$.ajax({
			async: false,
    		type : 'post',
    		url  : contextPath + '/member/idCheck',
    		data : {"memId" : memId},
    		success : function(res){
    			if(res == 'OK'){
    				console.log(res);
    				flag = true;
    			}else{
    				console.log("실패"+res);
    				flag = false;
    			}
    		}
    	})
    	return flag;
	}
	return {
		name : 'memberService',
		idCheck : idCheck 
	}
})();
    
})
$(document).ajaxSend(function(e, xhr, options) {
xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
});
    </script>
    <script>
   /*  $(document).ready(function() {
    	var result = $("#selectedValues").val();
    	$("input[name=checkboxs]").each(function(index,item){
    		result += $(item).attr("value");
    		console.log(result);
    	})
    	
    }) */
            //선택한 체크박스들의 값을 히든 인풋에 넣어주기
            $(document).ready(function() {
                var selectedValues = [];

                $(".signup-wrapper").on("click", '.hobbyspan', function(e) {
                	 e.stopPropagation();
                    var checkbox = $(this).find('input[type="checkbox"]');
                    var value = checkbox.val();
                   	var index = selectedValues.indexOf(value);
                    console.log(value);
                    if(index !== -1){
                    	selectedValues.splice(index, 1);	
                	}else{
                        selectedValues.push(value);
                		
                	}
                    var result = selectedValues.join(',');
                    $("#selectedValues").val(result);
                    console.log(selectedValues);
                    //console.log("결과"+result);
                });
            });
        
    </script>
</html>

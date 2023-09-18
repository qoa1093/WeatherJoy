<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" 
  	integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
    <div class="centerClass">
        <!--  <div class="centerbtn">-->
            <!--  <p id="weatherLogo">날씨조이</p>-->
          <%--   <c:forEach items="${List}" var="list">
            <c:out value="${list.memId}" />
            </c:forEach> --%>
            <form action="/member/signup" method="post" id="myform" autocomplete="off" role="form" accept-charset="UTF-8">
           <!-- <form id="myform"> -->
                <div class="signup-wrapper">
                    <input type="text" class="weatherSignUp" name="memId" id="memId" placeholder="아이디를 입력하세요.">
                    
                    <span class="Lclick duplespan"><input id="dupleID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="dupleIdCheck">아이디 중복 체크</span>
                    </span>
                    <p></p>
                    <input type="password" name="memPw" class="weatherSignUp" id="Pwd" placeholder="비밀번호를 입력하세요.">
                    <p></p>

                    <input type="password" class="weatherSignUp"id="Pwd2" placeholder="비밀번호를 재입력하세요.">


                    <p></p>
                    <input type="text" class="weatherSignUp" name = "memName" id="memName" placeholder="이름을 입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" name="memAge" placeholder="나이를 입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" name="memPhone" placeholder="핸드폰 번호를 -빼고 입력하세요.">
                    <p></p>
                    <div class="address">
					<input type="text" class="weatherSignUp mini" id="postcode" size="3" placeholder="우편번호">
					<button type ="button" id="searchBtn" class="sign">주소 검색</button>
					<p></p>
					<input type="text" class="weatherSignUp" id="address" placeholder="기본주소">
					<p></p>
					<input type="text" class="weatherSignUp" id="detailAddress" name="datailAd" size="8" placeholder="상세주소를 반드시 입력하세요.">
					<input type="hidden" class="weatherSignUp" id="extraAddress" readonly>
					<input type="hidden" class="weatherSignUp" name="memAddr">
					</div>
                    <!-- <input type="text" class="weatherSignUp" name = "memAddr" id="memAddr" placeholder="주소를 입력하세요."> -->
                    <p></p>
		
		
                    <span>관심분야(1개 이상 반드시 선택)</span>
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
                    <input id="selectedValues" type="hidden" name="memHobby">
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

/*
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // 폼의 기본 동작을 막습니다.

        // FormData 객체를 생성하고 폼의 모든 값을 가져옵니다.
        const formData = new FormData(form);

        // FormData 객체의 값을 반복하면서 콘솔에 출력합니다.
        for (const [key, value] of formData.entries()) {
            console.log(key + ':', value);
        }
    }); */
    //아이디 중복 체크
    /* $('.signup-wrapper').on("click",'.duplespan',function(e){
    	//e.preventDefault();
    	var List = ${List};
    	console.log(List);
    	//눌렀을 시 아이디중복체크 화면으로
    	if($(this).find('.fa-solid').css('display') ==='none') {
    	console.log("으악");
    	List.forEach(function(user) {
    	    var prevSibling = $(user).prev();
    	    if (prevSibling.hasClass('duplespan') && prevSibling.find('input').val() === user.memId) {
    	        console.log("똑같다~");
    	    })
    	});
    		
    	}else{
    		console.log("비었다!")
    	}
    	}) */
    	
    	
    	
    	
    	//주소값을 합해서 히든 인풋 창에 넣어서 name속성을 타고 보내기
    $('.address').change(function(){
   	 var ad1 = $('#postcode').val();
        var ad2 = $('#address').val();
        var ad3 = $('#detailAddress').val();
        var ad4 = $('#extraAddress').val();
        var address = '('+ ad1 + ')' + ad2 +' '+ ad3 + ad4;
        console.log(address);
   	$('[name=memAddr]').val(address);
   })
   //주소검색 버튼을 누르면 주소검색창이 열림
   $('#searchBtn').click(function(){
		//sample6_execDaumPostcode();
		addressService.addressSearch('[name=memAddr]');
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
    //id중복검사
    $('.signup-wrapper').on("click",'.duplespan',function(e){
    	
       	var memId = $('#memId').val();
       	console.log(memId);
       	if(memId == null || memId == ''){
   			alert('아이디를 입력하세요.');
   			$(this).find('.fa-solid').hide();
       		$(this).find('.fa-regular').show();
   			return;
   		}
       	/* var idRegex = /^[a-z0-9_-]{5,20}$/;
       	if(!idRegex.test(memId))
       		return; */
       	var res = memberService.idCheck(contextPath, memId);
       	console.log(res);
       	//console.log(res);
       	if(res)
       		alert('사용 가능한 아이디입니다.')
       	else{
       		console.log(res);
       		alert('이미 가입된 아이디입니다.')
       		$(this).find('.fa-solid').hide();
       		$(this).find('.fa-regular').show();
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

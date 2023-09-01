<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
    <div class="centerClass">
        <!--  <div class="centerbtn">-->
            <!--  <p id="weatherLogo">날씨조이</p>-->
            <form action="/user/signupPost" method="post" autocomplete="off">
                <div class="signup-wrapper">
                    <input type="text" class="weatherSignUp" id="memId" placeholder="아이디를 입력하세요.">
                    <span class="Lclick duplespan"><input id="dupleID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="dupleIdCheck">아이디 중복 체크</span>
                    </span>
                    <p></p>
                    <input type="password" name="memPW" class="weatherSignUp"id="Pwd" placeholder="비밀번호를 입력하세요.">
                    <p></p>
                    <input type="password" name="memPw" class="weatherSignUp"id="Pwd2" placeholder="비밀번호를 재입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memName" placeholder="이름을 입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memAge" placeholder="나이를 입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memPhone" placeholder="핸드폰 번호를 -빼고 입력하세요.">
                    <span class="duplespan"><input id="selfID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="selfIdCheck">본인인증</span>
                    </span>
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memAddr" placeholder="주소를 입력하세요.">
                    <p></p>
                    
                    <span>관심분야(여러개 가능)</span>
                    <p id="checkedList">
                    <span class="Lclick duplespan">
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
                    <input id="selectedValues" type="" name="memHobby">
                    </p>
                    <span>반려동물 여부</span>
					<p class="centerCss">                    
                    <input type="radio" name="memAValid">&nbsp;<span>네</span> &nbsp;&nbsp;&nbsp;<input type="radio" name="memAValid">&nbsp;<span>아니오</span>
                    </p>
					
                    <p></p>
                
                </div>
                
                    <p/>
                    
                    <p></p>
                    <button type="submit"  class="sign signUp-Btn" id="signUp-Btn">가입하기</button> 
                    <button type="reset" class="sign "><a href="">재등록</a></button>
                    </form>
                </div>
            </div>
</body>
<script>
$(document).ready(function(){
	
    var loginAlert = document.getElementById('signUp-Btn');
    loginAlert.addEventListener('click', function() {
        alert('회원가입 되었습니다.');
        window.location.href="/home";
    })
    
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
})
    </script>
    <script>
   /*  $(document).ready(function() {
    	var result = $("#selectedValues").val();
    	$("input[name=checkboxs]").each(function(index,item){
    		result += $(item).attr("value");
    		console.log(result);
    	})
    	
    }) */
    
     /*     $(document).ready(function() {
                var selectedValues = [];
                $(".signup-wrapper").on("click",'.Lclick',function(e) {
                console.log($(this).find('input[type="checkbox"]').val());
                
                selectedValues.push($(this).find('input[type="checkbox"]').val());
                console.log(selectedValues);
                    
                });
                var result = selectedValues.join(', ');
                console.log("결과:"+result);
                $("#selectedValues").text(result);
            });  */
            
            $(document).ready(function() {
                var selectedValues = [];

                $(".signup-wrapper").on("click", '.Lclick', function (e) {
                    var checkbox = $(this).find('input[type="checkbox"]');
                    var value = checkbox.val();
                   	var index = selectedValues.indexOf(value);
                    console.log(value);
                    if(index !== -1){
                    	selectedValues.splice(index, 1);	
                	}else{
                        selectedValues.push(value);
                		
                	}
                    var result = selectedValues.join(', ');
                    $("#selectedValues").text(result);
                    console.log(selectedValues);
                });
            });
        
    </script>
</html>
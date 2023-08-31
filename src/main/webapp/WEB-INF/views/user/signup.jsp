<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
    <div class="centerClass">
        <!--  <div class="centerbtn">-->
            <!--  <p id="weatherLogo">날씨조이</p>-->
            <form action="" method="post" autocomplete="off">
                <div class="">
                    <input type="text" class="weatherSignUp" id="memId" placeholder="아이디를 입력하세요.">
                    <label class="Lclick dupleLabel"><input id="dupleID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="dupleIdCheck">아이디 중복 체크</span>
                    </label>
                    <p></p>
                    <input type="password" name="memPW" class="weatherSignUp"id="weatherPwd" placeholder="비밀번호를 입력하세요.">
                    <p></p>
                    <input type="password" name="memPw" class="weatherSignUp"id="weatherPwd" placeholder="비밀번호를 재입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memName" placeholder="이름을 입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memAge" placeholder="나이를 입력하세요.">
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memPhone" placeholder="핸드폰 번호를 -빼고 입력하세요.">
                    <label class="dupleLabel"><input id="selfID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="selfIdCheck">본인인증</span>
                    </label>
                    <p></p>
                    <input type="text" class="weatherSignUp" id="memAddr" placeholder="주소를 입력하세요.">
                    <p></p>
                    
                    <span>관심분야(여러개 가능)</span><p/>
                    <label class="Lclick dupleLabel">
                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="12">
                    	<i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>관광&nbsp;
                    </label>
                    <label class="Lclick hobbyLabel">
                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="28">
                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                    레저·스포츠&nbsp;
                    </label>
                    <label class="Lclick hobbyLabel">
                    <input type="checkbox" class="hobbyBox" name="checkboxes" value="28">
                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                    <input type="checkbox" class="hobby" name="checkboxes" value="14">문화시설&nbsp;
                    </label>
                    <input type="checkbox" class="hobby" name="checkboxes" value="15">축제공연행사&nbsp;
                    <input type="checkbox" class="hobby" name="checkboxes" value="25">여행코스&nbsp;
                    <input type="checkbox" class="hobby" name="checkboxes" value="32">숙박&nbsp;
                    <input type="checkbox" class="hobby" name="checkboxes" value="38">쇼핑&nbsp;
                    <input type="checkbox" class="hobby" name="checkboxes" value="39">음식점&nbsp;
                    </label>
                    <p>반려동물이 있는지 여부</p>
                    <input type="radio" name="memAValid">네 &nbsp;<input type="radio" name="memAValid">아니오
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
    })
    var labelF = true;
    $('.Lclick').on("click", function () {
        //alert('본인인증되었습니다.');
        if(labelF){
        $('.fa-regular').hide();
        $('.fa-solid').show();
        labelF = false;
        }else{
        	$('.fa-regular').show();
            $('.fa-solid').hide();
            labelF = true;
        }
    })
})
    </script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
    <div class="centerClass">
        <div class="centerbtn">
            <p id="weatherLogo">날씨술잔</p>
            <form action="" method="post" autocomplete="off">
                <div class="">
                    <input type="text" class="weatherSignUp" id="weatherId" placeholder="아이디를 입력하세요.">
                    <label class="dupleLabel"><input id="dupleID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="dupleIdCheck">아이디 중복 체크</span>
                    </label>
                    <p></p>
                    <input type="password" name="" class="weatherSignUp"id="weatherPwd" placeholder="비밀번호를 입력하세요.">
                    <p/>
                    <input type="password" name="" class="weatherSignUp"id="weatherPwd" placeholder="비밀번호를 재입력하세요.">
                    <p/>
                    <input type="text" class="weatherSignUp" id="weatherName" placeholder="이름을 입력하세요.">
                    <p/>
                    <input type="text" class="weatherSignUp" id="weatherPN" placeholder="핸드폰 번호를 -빼고 입력하세요.">
                    <label class="selfLabel"><input id="selfID" type="checkbox">
                        <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                        <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                        <span class="selfIdCheck">본인인증</span>
                    </label>
                
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
    var loginAlert = document.getElementById('signUp-Btn');
    loginAlert.addEventListener('click', function() {
        alert('회원가입 되었습니다.');
    })
    $('.selfLabel').on("click", function () {
        alert('본인인증되었습니다.');
    })
    </script>
</html>
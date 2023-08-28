<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>
    <script src="https://kit.fontawesome.com/e8200549ff.js" crossorigin="anonymous"></script>
    <style>
       #weatherLogo{
        font-size: 40px;
        position: absolute; top: 260px;
       }
       a {
        text-decoration: none; color: rgb(59, 0, 0); font-weight: 40% ; 
            margin: 10px; font-size: small;
       }
       button:hover{
        cursor: pointer;
       }
       
        input[type="checkbox"]:checked {
         border-radius: 50%; appearance: none;
        }
        .fa-solid.fa-circle-check{
            appearance: none; display: none;
        }
        .autoLabel:hover{
            cursor: pointer;
        }
        #autoLogin {
            border: none;  border-style: hidden; color: rgb(255, 255, 255);
            width: 20px;
            height: 20px;
            border-radius: 0;
            appearance: none;
            /*appearance: none; naver에서는 보이지 않게 처리하고 label :before 형식으로 처리함*/

        }
        .centerClass{
            /*position:  relative; width: 80%; height: 100%; opacity: 40%;*/
            display: flex; height: 800px;
            background-color: bisque;
            justify-content: center;
            align-items: center;
            
        }
        .centerbtn{
            padding-top: 240px;
        }
        .weatherIdPwd{
            height: 20px; width:  200px; border-style: hidden;
        }
        .weatherIdPwd:focus{
            outline: none; color: burlywood;
        }
        .sign{
            position: relative; float: left; margin-left: 5px; margin-right: 5px;
            border-radius: 1dvh; width: 90px; background-color: white; 
            color:#ffbd80;
            border-style: none;
        }
        .sign.signUpBtn{
            color:#ffbd80;
        }
    
    </style>
</head>
<body>
    <div class="centerClass">
        <p id="weatherLogo">날씨술잔</p>
        <div class="centerbtn">
            <form action="" method="post" autocomplete="off">
                <div class="">
                    <input type="text" class="weatherIdPwd" id="weatherId">
                    <p></p>
                    <input type="password" name="" class="weatherIdPwd"id="weatherPwd">
                </div>
                <label class="autoLabel"><input id="autoLogin" type="checkbox">
                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                    <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                    자동로그인
                </label>
                    <p/>
                    <a href=""> 비밀번호찾기 </a> <a href=""> 아이디찾기 </a>
                    <p></p>
                    <button type="submit"  class="sign signInBtn" id="signInBtn">로그인</button> 
                    <button class="sign signUpBtn"><a href="">회원가입</a></button>
                    </form>
                </div>
            </div>
</body>
<script>
    var loginAlert = document.getElementById('signInBtn');
    loginAlert.addEventListener('click', function() {
        alert('로그인 되었습니다.');
    })
 
    </script>
</html>
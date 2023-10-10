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
   <%--  <link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet"> --%>
  	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" 
  		integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
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
        .fa-solid{
             display: none;
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
            align-items: center;flex-direction: column;
            
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
        .Logologin{
         cursor: pointer;
        } 
        .weatherLogo img{
         position: absolute; top:180px; text-align: center;
         height:200px; width:200px; cursor: pointer;
        }
        
      
    
    </style>
</head>
<body>
    <div class="centerClass">
        <div class="centerbtn">
    	<a class="weatherLogo" href="/"><img src="${pageContext.request.contextPath}/resources/image/tourlogo.png" alt="로고 이미지" style="margin-top:0"></a>
	       <!--  <p id="weatherLogo">날씨조이</p> -->
	       <!--action=""  method="post"  -->
            <form  autocomplete="off" role="form">
                <div class="">
                    <input type="text" class="weatherIdPwd" id="weatherId" name="username">
                    <!-- <input type="hidden" name="memId"> -->
                    <p></p>
                    <input type="password" name="password" class="weatherIdPwd"id="weatherPwd">
                </div>
                <span class="autoLabel"><input id="autoLogin" name= "remember-me" type="checkbox">
                    <i class="fa-regular fa-circle-check" style="color: #ffbd80;"></i>
                    <i class="fa-solid fa-circle-check" style="color: #fbcb46;"></i>
                    자동로그인
                </span>
                    <p/>
                    <a href="javascript:void(0);" onclick="newWindow('findPw', '비밀번호찾기', 440, 400);">비밀번호찾기</a> <a href="javascript:void(0);" onclick="newWindow('findId', '아이디찾기', 440, 400);"> 아이디찾기 </a>
                    <p></p>
                    <button type="submit"  class="sign signInBtn" id="signInBtn">로그인</button> 
                    <button type="button" class="sign signUpBtn">회원가입</button>                  
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
                    </form>
                </div>
                    <p class="Logologin kakao"><img src="${pageContext.request.contextPath}/resources/image/kakao_login.png" alt="kakao" style="margin-right:0"></p>
            </div>
</body>
<script>
$(document).ready(function(){
    var loginAlert = document.getElementById('signInBtn');
    let formObj = $("form");
    loginAlert.addEventListener('click', function() {
        //alert('로그인 되었습니다.');
    	formObj.attr("action","/login").attr("method","post").submit();
        
    })
    
 		Kakao.init('9f52d1abb56bf20aa9452032fd446672');
		Kakao.isInitialized();
		console.log(Kakao.isInitialized());
    	$(".centerClass").on("click",'.kakao',function(e){
    		//Kakao.Auth.authorize()
    		//console.log("눌렸다");
    		
    		doKakaoLogin()    		
    	}) 
    	function doKakaoLogin() {
    		       const url = 'https://kauth.kakao.com/oauth/authorize?client_id=' +
    		      '9f52d1abb56bf20aa9452032fd446672' +
    		          '&redirect_uri=http://127.0.0.1:8080/oauth/kakao' +
    		          '&response_type=code&'+
    		          'scope=account_email'  
    		          
    		       window.location.href = url;
    		       
    		       
    		       
    		       socialService.getKaKao({code:code},function(code){
    		    	   alert("YS");
    		    	   console.log(kakaoLogin);
    		    	   window.location.href = "/";
    		       });
    		      
    		       
    		}
})
var socialService = (function(){
	function getKaKao(param, callback, error){
		
		 $.ajax({
			 	type:'post',
			 	url:'/oauth/kakao',
			 	data:JSON.stringify(param),
			 	contentType:"application/json; charset=utf-8",
			 	success : function(result, status, xhr){
			 		if(callback){
			 			callback(result);
			 		}
			 	},
			 	error: function(xhr, status, er){
			 		if(error){
			 			error(er);
			 		}
			 	} 
			 })
		/* 
		
		$.getJSON("/oauth/kakao/",
			function(param){
				if(callback){
					
					callback(data);
					
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
		}); */
	}
	return {
	 getKaKao : getKaKao
	};
})();

    </script>
 <script type="text/javascript">
    $(document).ready(function(){
    	$('.signUpBtn').on("click",function(){
    	window.location.href = <%-- '<%=request.getContextPath()%>'+ --%>"/member/signup"; 
    	})
    	
    	//체크하면 아이콘 색이 채워지도록 변경
	    $(".centerbtn").on("click",'.autoLabel',function(e) {
	        e.stopPropagation();
		    const regularIcon = $(this).find('.fa-regular');
		    console.log(regularIcon);
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
     <!-- 아이디찾기/비밀번호재설정 새 창 띄우기-->
        function newWindow(url, name, width, height) {
            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;
            var options = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
            window.open(url, name, options);
        }
    </script> 
</html>
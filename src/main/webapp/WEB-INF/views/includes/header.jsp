<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>날씨조이</title>
    <script src="https://kit.fontawesome.com/e8200549ff.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>    
  	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
            <div class="navbar-header">
                <a  href="/" style="margin:0">
                	<img src="${pageContext.request.contextPath}/resources/image/tourlogo.png" alt="로고 이미지" width="100" height="100" style="margin-top:0; cursor: pointer;">
                </a>
                <sec:authorize access="isAuthenticated()" >
                	<p class="helloMent"> <sec:authentication property="principal.username"/>님 환영합니다.</p>
                	<div class="navbar-atag">
                		<a href="/member/signout">로그아웃</a>
                		<input type="hidden" id="username" value="<sec:authentication property="principal.username" />">
                		<a href="/board/reviewlist">리뷰게시판</a>
                	</div>
                </sec:authorize>
                
                <sec:authorize access="isAnonymous()" >
                 	<p class="helloMent"> 로그인하면 더욱 다양한 혜택이!</p>
                 	<div class="navbar-atag">                
		                <a href="/member/signin">로그인</a>
		                <a href="/member/signup">회원가입</a>
		                
		            </div>
                </sec:authorize>
                
                
                <a  id="menu" href="#" style="margin:0">
                	<img src="${pageContext.request.contextPath}/resources/image/menu.png" alt="menu" width="100" height="100" style="margin-right:0">
                </a>
                
            </div>
            <!-- /.navbar-header -->    
</div>
<script type="text/javascript">
$(document).ready(function(){      
	var menubar = "<nav class='menuBarOpen'><ul>"
					+"<sec:authorize access="isAuthenticated()" ><li class='menubarblock'>"
					+"<a id='mypage' href =''>마이페이지</a></li></sec:authorize>"
					+"<li class='menubarblock'><a href='/board/reviewlist'>한줄리뷰게시판</a></li>"+"<li class='menubarblock'>이미지게시판</li></ul></nav>";
	$('#menu').append(menubar);
	$(".menuBarOpen").hide();
	$("#menu").on("click", function(e) {
	
			e.stopPropagation();
	       $(".menuBarOpen").slideToggle();
	
	 })
	 $('.menubarblock').on("click",function(e){
			e.stopPropagation();
		
	 })
	 $('#mypage').on('click', function(e){
		e.preventDefault();
		var memID = $('#username').val();
		console.log(memID);
		 var redirectUrl = "/member/mypage?memId=" + memID;
	    // 페이지 리다이렉션 수행
	    window.location.href = redirectUrl;
	 }) 
	
})

</script>
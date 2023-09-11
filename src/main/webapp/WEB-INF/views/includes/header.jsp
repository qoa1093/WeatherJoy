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
  	<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
            <div class="navbar-header">
                <a  href="/" style="margin:0">
                	<img src="${pageContext.request.contextPath}/resources/image/tourlogo.png" alt="로고 이미지" width="100" height="100" style="margin-top:0; cursor: pointer;">
                </a>
                <c:if test="${user != null}">
                	<p class="helloMent"> ${user}님 환영합니다.</p>
                </c:if>
                
                <c:if test="${user == null}">
                 	<p class="helloMent"> 로그인하면 더욱 다양한 혜택이!</p>
                </c:if>
                <div class="navbar-atag">
                <c:if test="${user == null}">
                <a href="/member/signin">로그인</a>
                <a href="/member/signup">회원가입</a>
                </c:if>
                <c:if test="${user != null}">
                <a href="/member/signiout">로그아웃</a>
                <a href="/member/reviewBoard">리뷰게시판</a>
                </c:if>                
                </div>
                
                <a  id="menu" href="#" style="margin:0">
                	<img src="${pageContext.request.contextPath}/resources/image/menu.png" alt="menu" width="100" height="100" style="margin-right:0">
                </a>
                
            </div>
            <!-- /.navbar-header -->    
</div>

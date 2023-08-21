<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>날씨데이터</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://kit.fontawesome.com/e8200549ff.js" crossorigin="anonymous"></script>
  	<link href="/resources/css/home.css" rel="stylesheet">
	<script src="/resources/js/home.js"></script>
</head>
<body>
    <div class="box2">
        <input type="text" name="txtYear" id="txtYear" size="6">년
        <select name="" id="selMon">
            
        </select>
        <select id="selDay">
            
        </select>
        <input type="button" value="확인" id="bt1">
    </div>
    <form action="" name="myform">
        <container class="fullcardBasket">
            <i class="fa-solid fa-circle-chevron-left"></i>
            <div id="case1"class="cardBasket cb1">                
                <!--<div class="recommendCard transed cardNo1 fullset1">
                    <i class="fa-solid fa-temperature-low"></i>
                    관광지 이름
                    관광지 날씨                    
                </div>    
                <div class="recommendCard transed cardNo2 fullset1">
                    <i class="fa-solid fa-mountain-sun"></i>
                    <i class="fa-solid fa-hotel"></i>
                    추천관광지 실내/실외
                </div>-->
            </div>
            <div class="cb2">

            </div>
            <i class="fa-solid fa-circle-chevron-right"></i>
            </container>
    </form>
</body>
</html>

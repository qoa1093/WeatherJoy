<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@include file="./includes/header.jsp" %>

<div id = "mainHome">
    <div class="box2">
        <input type="text" name="txtYear" id="txtYear" size="6">년
        <select name="" id="selMon">
            
        </select>
        <select id="selDay">
            
        </select>
        <input type="button" value="확인" id="bt1" class="btn">
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
</div>
    <script src="/resources/js/home.js"></script>
    <%@include file="./includes/footer.jsp" %>
</body>
</html>

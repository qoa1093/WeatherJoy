<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@include file="./includes/header.jsp" %>

<h1 style="text-align:center">${reCityName}</h1>
 <div class="cb2">               
 </div>

 
 <script>
 $(document).ready(function() {
	 console.log(${selectedValue});
	 var selectedValue = ${selectedValue};
	 var reCityName = "${reCityName}";
	 var contentId;
	 show(selectedValue, reCityName); 
	 function show(selectedValue,reCityName){
         var url = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=ibNDydv%2BVD1XxdnbSBCwRIZ4nfiYnptFv6FveU0wGfu4yRPisWSg%2F1gRJgdgRxOvOm6DlzNjTEJrjZkDyxNwbw%3D%3D";
         url = url + '&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=A&keyword='+reCityName+'&contentTypeId='+selectedValue;
         $(".cb2").text("");
         console.log("----: "+url);
         $.ajax({
                 type : "GET",
                 url : url,
                 dataType:"xml",
                 success:function(data){
                     console.log(data);
                     var str = "";
                     $(data).find("item").each(function(){
                         str = str+ "<container id='containerCase'>"+
                         "<div class='caseNumber'><h1><a class='titleId'>"+$(this).find("title").text()+"</a></h1>";
                     str = str+ "<h2>컨텐츠타입 : "+switchContent(selectedValue)+/*+$(this).find("contenttypeid").text()+*/"</h2>";
                     str = str + "<p>" + $(this).find("addr1").text()+"</p>"
                     	+"<button id='getAnimal' class='btn'>반려동물여부</button><button class='btn' id='getDetails'>상세정보조회</button><button class='btn' id='getOpenTime'>개장시간조회</button><br/>";
                     str = str +"<image src="+$(this).find("firstimage").text()+" width='400px'>"
                     str = str +"<input type='hidden' value="+$(this).find("contentid").text()+">"
                     		+"</div>"
                     		+"</container>";
                     
                     });
                         
                     $(".cb2").append(str);
                 }, error : function(){
                     alert("error");
                 }})
     }
	 //12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점
	 function switchContent(selectedValue){
		 switch(selectedValue){
		 case 12:return "관광지";break;
		 case 14:return "문화시설";break;
		 case 15:return "축제공연행사";break;
		 case 25:return "여행코스";break;
		 case 28:return "레포츠";break;
		 case 32:return "숙박";break;
		 case 38:return "쇼핑";break;
		 case 39:return "음식점";break;
		 }
	 }
	 $(".cb2").on("click",".caseNumber",function(e){
    	 console.log("인풋정보 : " +$(this).find("input").val());
     })
      $(".cb2").on("click","#getAnimal",function(e){
    	  contentId=$(this).closest('.caseNumber').find('input').val();
    	 showAnimal(contentId);
     })
     $(".cb2").on("click","#getDetails",function(e){
    	 contentId=$(this).closest('.caseNumber').find('input').val();
    	console.log(contentId+" "+selectedValue);
    	 showDetails(contentId,selectedValue);
     })
     $(".cb2").on("click","#getOpenTime",function(e){
    	 contentId=$(this).closest('.caseNumber').find('input').val();
    	console.log(contentId+" "+selectedValue);
    	getOpenTime(contentId,selectedValue);
     })
         
     let titleId; 
     $('.titleId').on('click',function(){
    	 titleId = $(this).find("contentid").text();
     })
     function showAnimal(contentId){
         var url = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=ibNDydv%2BVD1XxdnbSBCwRIZ4nfiYnptFv6FveU0wGfu4yRPisWSg%2F1gRJgdgRxOvOm6DlzNjTEJrjZkDyxNwbw%3D%3D";
         url = url + '&pageNo=1&numOfRows=10&MobileOS=ETC&MobileApp=AppTest&contentId='+contentId+'&_type=xml';
         $(".cb2").text("");
         console.log("----: "+url);
         $.ajax({
                 type : "GET",
                 url : url,
                 dataType:"xml",
                 success:function(data){
                     console.log(data);
                     var str = "";
                     $(data).find("item").each(function(){
                         str = str+ "<container id='containerCase'>"+
                         "<div class='caseNumber'><h1><a class=''>"+$(this).find("title").text()+"</a></h1>";
                     str = str+ "<h2>컨텐츠타입 : "+switchContent(selectedValue)+"</h2>";
                     str = str + "<p>동반여부" + $(this).find("acmpyTypeCd").text()+"</p>";
                     str = str + "<p>제한사항 : "+$(this).find("relaAcdntRiskMtr").text()+"</p>" 
		                     +"<p>요구사항 : "+$(this).find("acmpyNeedMtr").text()+"</p>"
		                     +"<p>상세설명 : "+$(this).find("etcAcmpyInfo").text()+"</p>"
                     		+"<input type='' value="+$(this).find("contentid").text()+"> </div>"+
                     		"</container>";
                     
                     });
                         
                     $(".cb2").append(str);
                 }, error : function(){
                     alert("error");
                    
                 }
        })
        if($(".cb2").text() == ''){
			 $(".cb2").append("<container id='containerCase'>"+
             "<div class='caseNumber'><p>관련된 내용이 존재하지 않습니다.</p></div></container>");
		}
     }
     function showDetails(contentId,selectedValue){
         var url = "https://apis.data.go.kr/B551011/KorService1/detailCommon1?serviceKey=ibNDydv%2BVD1XxdnbSBCwRIZ4nfiYnptFv6FveU0wGfu4yRPisWSg%2F1gRJgdgRxOvOm6DlzNjTEJrjZkDyxNwbw%3D%3D";
         url = url + '&MobileOS=ETC&MobileApp=AppTest&_type=xml&contentId='+contentId+'&contentTypeId='+selectedValue+'&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1';
         $(".cb2").text("");
         console.log("----: "+url);
         $.ajax({
                 type : "GET",
                 url : url,
                 dataType:"xml",
                 success:function(data){
                     console.log(data);
                     var str = "";
                     $(data).find("item").each(function(){
                         str = str+ "<container id='containerCase'>"+
                         "<div class='caseNumber'><h1><a class=''>"+$(this).find("title").text()+"</a></h1>";
                     str = str+ "<image src="+$(this).find('firstimage').text()+" width='400px'>";
                     str = str + "<p>연락처" + $(this).find("tel").text()+"</p>";
                     str = str + "<p>홈페이지주소 : "+$(this).find("homepage").text()+"</p>" 
		                     +"<p>상세주소 : "+$(this).find("addr1").text()+"<br/>"+$(this).find("addr2").text()+"</p>"
		                     +"<p>상세설명 : "+$(this).find("overview").text()+"</p>"
                     		+"<input type='hidden' value="+$(this).find("contentid").text()+"> </div>"+
                     		"</container>";
                  
                     });
                         
                     $(".cb2").append(str);
                     if($(".cb2").text() == ''){
            			 $(".cb2").append("<container id='containerCase'>"+
                         "<div class='caseNumber'><p>관련된 내용이 존재하지 않습니다.</p></div></container>");
            		}
                 }, error : function(){
                     alert("error");
                    
                 }
        })
        
     }
     function getOpenTime(contentId,selectedValue){
    	 var url = "https://apis.data.go.kr/B551011/KorService1/detailIntro1?serviceKey=ibNDydv%2BVD1XxdnbSBCwRIZ4nfiYnptFv6FveU0wGfu4yRPisWSg%2F1gRJgdgRxOvOm6DlzNjTEJrjZkDyxNwbw%3D%3D";
         url = url + '&MobileOS=ETC&MobileApp=AppTest&_type=xml&contentId='+contentId+'&contentTypeId='+selectedValue+'&numOfRows=10&pageNo=1';
         $(".cb2").text("");
         console.log("----: "+url);
         $.ajax({
                 type : "GET",
                 url : url,
                 dataType:"xml",
                 success:function(data){
                     console.log(data);
                     var str = "";
                     $(data).find("item").each(function(){
                         str = str+ "<container id='containerCase'>"+
                         "<div class='caseNumber'><h1>"+$(this).find("eventplace").text()+"</h1>";              
                     str = str + "<p>개장날짜:"+$(this).find("eventstartdate").text() + "~"+$(this).find("eventenddate").text()+"</p>";
                     str = str + "<p>개장시간 : "+$(this).find("playtime").text()+"</p>" 
		                     +"<p>연락처 : "+$(this).find("sponsor1tel").text()+"<br/>"+"입장료:"+$(this).find("usetimefestival").text()+"</p>"
		                     +"<p>주관처 : "+$(this).find("sponsor2").text()+"</p>"
                     		+"<input type='hidden' value="+$(this).find("contentid").text()+"> </div>"+
                     		"</container>";
                  
                     });
                         
                     $(".cb2").append(str);
                     if($(".cb2").text() == ''){
            			 $(".cb2").append("<container id='containerCase'>"+
                         "<div class='caseNumber'><p>관련된 내용이 존재하지 않습니다.</p></div></container>");
            		}
                 }, error : function(){
                     alert("error");
                    
                 }
        })
     }
 });

 </script>
 <%@include file="./includes/footer.jsp" %>
</body>
</html>
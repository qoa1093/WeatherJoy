<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
    <div class="centerClass">
            
          <div>
                <div class="signup-wrapper">
                	<p>아이디</p>
                    <input type="text" class="weatherSignUp" name="memId" value='<c:out value="${member.memId}"/>' readonly > 
                    <p></p>
                    <input type="hidden" name="memPw" class="weatherSignUp" value='<c:out value="${member.memPw}"/>' readonly>
                    <p>이름</p>                   
                    <input type="text" class="weatherSignUp" name = "memName" value='<c:out value="${member.memName}"/>' readonly>
                    <p>나이</p>
                    <input type="text" class="weatherSignUp" name="memAge" value='<c:out value="${member.memAge}"/>' readonly>
                    <p>연락처</p>
                    <input type="text" class="weatherSignUp" name="memPhone" value='<c:out value="${member.memPhone}"/>' readonly>
                    <p>주소</p>
                    <div class="address">
					<input type="text" class="weatherSignUp" name="memAddr" value='<c:out value="${member.memAddr}"/>' readonly>
					</div>                    
                    <p></p>
		
		
                    <span>관심분야</span>
                    <p id="checkedList">
                    <span class="Lclick hobbyspan">
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
                    <input id="selectedValues" type="hidden" name="memHobby" value='<c:out value="${member.memHobby}"/>' readonly>
                    </p>
                    <span>반려동물 여부</span>
					<p class="centerCss">                    
                    <input type="radio" name="memAValid" value="Y" disabled>&nbsp;<span>네</span> &nbsp;&nbsp;&nbsp;<input type="radio" name="memAValid" value="N" disabled>&nbsp;<span>아니오</span>
                    </p>
					
                    <p></p>
                
                </div>
                
                    <p/>
                    
                    <p></p>
                    <button data-oper="modify" type="button" class="sign " id="infoModifyBtn">수정하기</button> 
                    <button data-oper="termination" type="button" class="sign signUp-Btn" id="terminationBtn">회원탈퇴</button>
                    </div>
          <form id='operForm' method="get">
			<input type='hidden' name='memId' value="<c:out value="${member.memId}"/>">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">			
		   </form>
           
           
    </div>
</body>
<script>
$(document).ready(function(){
	var hobbyString = "${member.memHobby}";
	var list = hobbyString.split(',');
	CheckboxList(list)
	Animalvalid("${memAValid}")
	
	
	//실행시 히든 인풋창에 있는 관심분야를 체크한 상태로 보이게 하는 코드
	function CheckboxList(list){
		for(var checkboxitem of list){
			checkClicked(checkboxitem)
			/* switch(checkbox){
			case 12:
				관광 28 레저스포츠 14문화시설 15축제공연행사 25여행코스 32 숙박 38 쇼핑 39 음식점
			} */
		}
	}
	//체크하면 아이콘 색이 채워지도록 변경
	function checkClicked(checkboxitem){
		var checkbox = $('input[value="'+checkboxitem+'"]');
		const regularIcon = checkbox.siblings('.fa-regular');
		const solidIcon = checkbox.siblings('.fa-solid');
		    
		        regularIcon.hide();
		        solidIcon.show();
		
	}
	function Animalvalid(valid){
		if(valid ==='Y'){
			$('input[value="Y"]').prop('checked', true);
		}else{
			$('input[value="N"]').prop('checked', true);
		}
	}
	$(document).ajaxSend(function(e, xhr, options) {
	xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	});
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
            //선택한 체크박스들의 값을 히든 인풋에 넣어주기
            $(document).ready(function() {
                var selectedValues = [];

                $(".signup-wrapper").on("click", '.hobbyspan', function(e) {
                	 e.stopPropagation();
                    var checkbox = $(this).find('input[type="checkbox"]');
                    var value = checkbox.val();
                   	var index = selectedValues.indexOf(value);
                    console.log(value);
                    if(index !== -1){
                    	selectedValues.splice(index, 1);	
                	}else{
                        selectedValues.push(value);
                		
                	}
                    var result = selectedValues.join(',');
                    $("#selectedValues").val(result);
                    console.log(selectedValues);
                    //console.log("결과"+result);
                });
            });

$(document).ready(function(){
  var operForm = $('#operForm');
  $("button[data-oper='modify']").on("click",function(e){
       e.preventDefault();
       operForm.attr("action", "/member/modify").submit();
  })
  $("button[data-oper='termination']").on("click",function(e){
       e.preventDefault();
       
       operForm.attr("action", "/member/termination").submit();
  })
})
    </script>
</html>

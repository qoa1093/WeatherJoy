<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
 <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>
 <form action="/member/mailCheck" type="get">
 	<input name = "memId" placeholder="아이디를 입력하세요.">
 	<button id="findPwSubmit">전송</button>
 </form>
 <div id="result"></div>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $('#findPwSubmit').click(function(e) {
        e.preventDefault();
        var memId = $('input[name="memId"]').val();
        $.get('/mailCheck', { memId: memId }, function(data) {
        	$('#result').text(data); // 성공 또는 실패 메시지를 알림창으로 보여줍니다.
        });
    });
});
		
		
		
		
		
		
		
})

</script>
</html>

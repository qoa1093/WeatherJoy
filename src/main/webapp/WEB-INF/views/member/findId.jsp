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
 <form action="/member/IDCheck" type="get">
 	<input name = "memName" placeholder="이름을 입력하세요.">
 	<input name = "memEmail" placeholder="이메일을 입력하세요.">
 	<button id="findIdSubmit">전송</button>
 </form>
 <div id="result"></div>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $('#findIdSubmit').click(function(e) {
        e.preventDefault();
        var memName = $('input[name="memName"]').val();
        var memEmail = $('input[name="memEmail"]').val();
        $.get('/IDCheck', { memName: memName, memEmail:memEmail }, function(data) {
        	$('#result').text(data); // 성공 또는 실패 메시지를 알림창으로 보여줍니다.
        });
    });
});
		
		
		
		
		
		
		
})

</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String kakao_id = request.getParameter("k");
		String gender = request.getParameter("g");
		
	%>
	<form action="JoinCon.do" method="post">
		닉네임을 입력해주세요 ^^ 
		<br>
		<input type="text" name="nick" id="nick" value="">
		<input type="hidden" name="gender" id="gender" value="<%=gender%>">
		<input type="hidden" name="kakao_id" id="kakao_id" value="<%=kakao_id%>">
		
		<br>
		<input type="submit" value="가입하기">
	</form>
	
</body>
</html>
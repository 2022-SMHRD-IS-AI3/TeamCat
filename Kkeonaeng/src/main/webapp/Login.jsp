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
		// 주연 - 로그인시 쿠키 저장하고 가져오는 코드 작성해야함 
		Cookie[] cookies = request.getCookies();
		
	%>
	<form action="LoginCon.do" method="post">
        <input type="hidden" name="kakao_id" value="swertyu3@naver.com">
        <input type="submit" value="카카오로 로그인"></td>
    </form>
    <a href="Join.html">회원가입</a>
</body>
</html>
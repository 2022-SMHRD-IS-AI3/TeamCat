<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메인페이지입니다</h2>
	<% 
		UserDTO info = (UserDTO)session.getAttribute("info");
	%>
	
	<% 
		if(info != null){
			
			out.print(info.getNick() + "님 환영합니다");
			out.print("<a href=\"My_page.jsp\">마이페이지</a>");
			out.print("<a href=\"LogoutCon.do\">로그아웃</a>");
		}else{
			out.print("<a href=\"Login.jsp\">로그인</a>");
		}
	%>
    
</body>
</html>
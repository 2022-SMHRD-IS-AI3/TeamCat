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
	UserDTO info = (UserDTO) session.getAttribute("info");
	%>
	<div>
		<%
		if (info != null) {

			out.print(info.getNick() + "님 환영합니다");
			out.print("<a href=\"my_page/\">마이페이지 </a>");
			out.print("<a href=\"LogoutCon.do\">로그아웃</a>");
		} else {
			out.print("<a href=\"./Login/\">로그인</a>");
		}
		%>
	</div>

	<div>
		<a href="Product/Write/">
			<button>대여물품 등록</button>
		</a>
	</div>
</body>
</html>
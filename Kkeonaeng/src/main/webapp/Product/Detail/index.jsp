<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시글 세부내용 조회 기능 -->	
	<%
	
	int p_idx = Integer.parseInt(request.getParameter("p_idx")); 
			ProductDAO dao = new ProductDAO();
			ProductDTO ProductDetail = dao.ProductDetail(p_idx);
	%>
			
			<div id = "Product">
				<table id="list">
					<tr>
						<td>물품명</td>
						<td><%=ProductDetail.getP_name() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=ProductDetail.getUser_idx() %></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><%=ProductDetail.getPrice() %></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<%=ProductDetail.getP_contents() %>
							<img alt="이미지" src="./file/">
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="../"><button>뒤로가기</button></a></td>
					</tr>
				</table>
</body>
</html>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<th>물건 순번</th>
				<th>회원 순번(등록자)</th>
				<th>물품명</th>
				<th>분류코드</th>
				<th>거래위치주소</th>
				<th>거래위치좌표</th>
				<th>대여가격</th>
				<th>물건설명</th>
				<th>물건등록일시</th>
			</tr>
			
			<% 
			List<ProductDTO> product_list = new ProductDAO().ProductAll();
			for (int i=0; i<product_list.size(); i++) {
				ProductDTO product = product_list.get(i);
			} %>
			<tr>
				<td><%=prodcut.getP_idx()%></td>
				
				<td>
					<button></button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
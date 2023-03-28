<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
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
	String search = "요"; 
	ProductDAO dao = new ProductDAO();
	List<ProductDTO> search_list = dao.ProductSearch(search);
	
	System.out.println(search_list.size());
	%>
	
</body>
</html>
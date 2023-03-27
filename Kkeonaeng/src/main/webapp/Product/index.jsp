<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
		ProductDAO dao = new ProductDAO();
		List<ProductDTO> product_list = dao.ProductAll();
		
		
	%>
	<div id="Product">
		<form action="ProductWriteCon.do" method="post" name="formData" enctype="multipart/form-data">
			<table id="list" border=1>
				<%for(int i=0; i<product_list.size(); i++) {
					String contact_addr = product_list.get(i).getContact_addr();
					if(contact_addr==null){
						contact_addr = "";
					}
				
				%>
				
				<tr>
					<td> <a href="./Detail/?p_idx=<%=product_list.get(i).getP_idx() %>"><%=product_list.get(i).getP_name() %></a></td><td><%=contact_addr %></td><td><%=product_list.get(i).getPrice() %></td>
				
				
				</tr>
				
				
					
				
				
				
				
				<%  } %>
			</table>
		</form>
	</div>
	
	

	
	
</body>
</html>
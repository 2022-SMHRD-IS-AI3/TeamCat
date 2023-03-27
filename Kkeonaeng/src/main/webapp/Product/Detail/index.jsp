<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	ProductDTO productDetail = dao.ProductDetail(p_idx);
	String file = new FileDAO().fileSelect(new FileDTO(0,"product",p_idx));
			
	UserDTO info = (UserDTO)session.getAttribute("info");
	%>
			
			<div id = "ProductDetail">
				<table id="list">
					<tr>
						<td>물품명</td>
						<td><%=productDetail.getP_name() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><%=productDetail.getPrice() %></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<%=productDetail.getP_contents() %>
							<img alt="이미지" src="/Kkeonaeng/file/<%=file%>">
						</td>
					</tr>
					<tr>
					<!-- 만약에 작성자 index와 접속한 info가 같으면 수정하기 버튼 생성
					else 안보이게 한다 -->
					
						<%if(info != null && info.getUser_idx() == productDetail.getUser_idx() ) {%>
						<td><a href="/Kkeonaeng/Product/Write/?p_idx=<%=p_idx %>"><button>수정하기</button></a></td>
						<td><a href="/Kkeonaeng/src/main/java/com/smhrd/controller/ProductDeleteCon?p_idx=<%=p_idx %>"><button>삭제하기</button></td>
						<% } %>
						<td><a href="../"><button>뒤로가기</button></a></td>
					</tr>
				</table>
</body>
</html>
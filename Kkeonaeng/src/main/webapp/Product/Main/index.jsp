<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="board">
				<table id = "list">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>시간</td>
						<td>삭제</td>
					</tr>
					
					<% for(int i=0; i < board_list.size(); i++) {%>
						<tr>
							<td><%=i+1 %></td>
							<td><a href="./Detail=<%=board_list.get(i).getNum() %>"><%=board_list.get(i).getTitle() %></a></td>
							<td><%=board_list.get(i).getWriter() %></td>
							<td><%=board_list.get(i).getB_date() %></td>
							<td><a href="BoardDelete" <%=board_list.get(i).getNum()%>">글 삭제</a></td>
						</tr>
					<%} %>
				
				</table>
				
				<a href="Main.jsp"><button id="writer">홈으로가기</button></a>
				<a href="BoardWrite.jsp"><button id="writer">작성하러가기</button></a>
			</div>
</body>
</html>
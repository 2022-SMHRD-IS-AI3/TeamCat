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
<% 
		UserDTO info = (UserDTO)session.getAttribute("info");
	%>
<div id = "board">
				<form action="BoardWriteCon.do" method="post"
					enctype="multipart/form-data">
				<table id="list">
					<tr>
						<td>작성자</td>
						<input type="hidden" name="user_idx" value="27"> 
						<td><%-- <%=info.getNick()%> --%></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select name="c_idx">
                        		<option value="1">디지털기기</option>
                        		<option value="2">생활가전</option>
                        		<option value="3">가구/인테리어</option>
                        		<option value="4">생활/주방</option>
                        		<option value="5">유/아동</option>
                        		<option value="6">여성의류/잡화</option>
                        		<option value="7">뷰티/미용</option>
                        		<option value="8">스포츠/레저</option>
                        		<option value="9">취미/게임/음반</option>
                        		<option value="10">도서</option>
                        		<option value="11">반려동물용품</option>
                        		<option value="12">기타</option>
                    		</select>
                    	</td>
					</tr>
					<tr>
						<td>물품명</td>
						<td><input type="text" name="p_name"></td>
					</tr>
					
					<tr>
						<td>가격</td>
						<td><input type="text" name="price"></td>
					</tr>
					<tr>
						<td>거래위치주소</td>
						<td><input type="text" name="contact_addr"></td>
					</tr>
					<tr>
						<td>거래위치좌표</td>
						<td><input type="text" name="contact_gps"></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="filename" type="file" style="float: right;">
							<textarea name="p_contents" rows="10" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="reset" value="초기화">
							<input type="submit" value="작성하기">
						</td>
					</tr>
				</table>
				</form>
			</div>
</body>
</html>
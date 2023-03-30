<%@page import="com.smhrd.model.UserDAO"%>
<%@page import="java.util.List"%>
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
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<div>
    	<table border="1">
       		<tr>
            	<th>회원순번(user_idx)</th>
                <th>닉네임</th> 
                <th>성별</th> 
                <th>카카오계정</th> 
                <th>등록일</th> 
                <th>회원상태</th> 
          	</tr>
	<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	List<UserDTO> user_list = new UserDAO().userAll();
	
	for (int i=0; i<user_list.size(); i++) { 
		UserDTO user = user_list.get(i);
	%>
		
		
                <tr>
                    <td><%=user.getUser_idx() %></td>
                    <td><%=user.getNick() %></td>
                    <td><%=user.getGender() %></td>
                    <td><%=user.getKakao_id() %></td>
                    <td><%=user.getReg_date() %></td>
                    <td><%=user.getUser_flag() %></td>
                    <td></td>
                </tr>
               
    <%} %>
            </table>
        </div>
</body>
</html>
</body>
</html>
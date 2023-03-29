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
	<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	List<UserDTO> user_list = new UserDAO().userAll();
	
	for (int i=0; i<user_list.size(); i++) { 
		userDTO user = user_list.get(i);
	%>
		
		
                <tr>
                    <th>user_idx</th>
                    <th>닉네임</th> 
                    <th>카카오 아이디</th> 
                    <th></th> 
                    <th>nick</th> 
                    <th>nick</th> 
                </tr>
                <tr>
                    <td>nick</td>
                    <td><%=user.get %></td> 
                </tr>
                <tr>
                    <td>gender</td>
                    <td><%=info.getGender(i) %></td> 
                </tr>
                <tr>
                    <td>kakao_id</td>
                    <td><%=info.getKakao_id(i) %></td> 
                </tr>
                <tr>
                    <td>reg_date</td>
                    <td><%=info.getReg_date(i) %></td> 
                </tr>
                <tr>
                    <td>user_flag</td>
                    <td><%=info.getUser_flag(i) %></td> 
                </tr>
    <%} %>
            </table>
        </div>
</body>
</html>
</body>
</html>
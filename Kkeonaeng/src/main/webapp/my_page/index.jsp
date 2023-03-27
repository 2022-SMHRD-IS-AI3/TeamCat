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
		if(info == null) {
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
	%>
	<h2>마이페이지</h2>
	
    <div style="border:1px solid black;">
        <%
	    		if(info.getFile_name() == null) {%>
	    	        <img id="profile_img" src="../file/unknown.png" alt="" width="50px" height="50px">
	    	<%	}else{ %>
	    			<img id="profile_img" src="../file/<%=info.getFile_name() %>" alt="" width="50px" height="50px">
	    	<%  }%>
        <span id="nick"><%=info.getNick()%></span>
        <a href="./info/"><button>정보 수정</button></a>
    </div>
    <h4>나의거래</h4>
    <div style="border:1px solid black;">
        <ul>
            <li>
                <a href="./wish/">관심목록</a>
            </li>
            <li>
                <a href="./rent/">대여목록</a>
            </li>
            <li>
                <a href="./reservation/">예약내역</a>
            </li>
        </ul>
    </div>
    <h4>기타</h4>
    <div style="border:1px solid black;">
        <ul>
            <li>
                <a href="./review/">내가받은리뷰보기</a>
            </li>
        </ul>
    </div>
    <%} %>
    
</body>
</html>
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
			response.sendRedirect("../../Login.jsp");
		}
	%>
	<form action="UpdateCon.do" method="post">
		<div>
	        <a href="../"><</a>
	        <span>정보수정</span>
	        <input type="hidden" name="user_idx" value="<%=info.getUser_idx()%>">
	        <input type="submit" value="완료">
	    </div>
	    <div>
	        <input type="file" name="profile_img" id="profile_img" value="">
	    </div>
	    
	    <div>
	        <img id="profile_img" src="/images/포켓몬37.jpg" alt="" width="50px" height="50px">
	    </div>
	
	    <div>
	        <input type="text" name="kakao_id" value="swertyu@naver.com" readonly style="background-color: rgb(216, 216, 216);">
	    </div>
	    <div>
	        <input type="text" name="nick" value="<%=info.getNick()%>">
	    </div>
    </form>
 
    <div>
        <span onclick="DeleteUser('1')">회원탈퇴</span>
    </div>

	   <script type="text/javascript">
    
    	console.log('123')
    	
    	<%-- function DeleteUser(idx){
    		 if(confirm('삭제시 복구 불가 진짜삭제?')){
                 location.href = "DeleteCon.do?idx="<%=info.getUser_idx()%>
             }
    	} --%>
       const DeleteUser = (idx) => {
            if(confirm('삭제시 복구 불가 진짜삭제?')){
               location.href = "DeleteCon.do?user_idx="+<%=info.getUser_idx()%>
            }
        } 
    </script>
</body>
</html>
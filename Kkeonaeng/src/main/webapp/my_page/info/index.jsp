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
		System.out.println(info.getFile_name());
		if(info == null) {
			response.sendRedirect("../../Login.jsp");
		}
	%>
	<form action="UpdateCon.do" method="post" enctype="multipart/form-data">
		<div>
	        <a href="../"><</a>
	        <span>정보수정</span>
	        <input type="hidden" name="user_idx" value="<%=info.getUser_idx()%>">
	        <input type="submit" value="완료">
	    </div>
	    <div>
	        <input type="text" name="fileExt" id="fileExt" value="">
	        <input type="text" name="filesize" id="filesize" value="">
	        <input type="file" name="filename" id="filename" onchange="fileSize(this)" value="">
	        <input type="hidden" name="post_idx" value="">
	    </div>
	    
	    <div>
	        <img id="profile_img" src="../../file/<%=info.getFile_name() %>" alt="" width="50px" height="50px">
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
       
       const fileSize = ($target) => {
    	    // 유저가 선택한 파일 가져오기
    	    var file = $target.files[0];
    	    
    	    document.getElementById('fileExt').value = (file.name).split('.')[1];
    	    document.getElementById('filesize').value = file.size;
       }
       
    </script>
</body>
</html>
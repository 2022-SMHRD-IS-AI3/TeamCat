<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		if(info == null) {
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
	%>
	<div  style="height:250px;">
	
		<form action="UpdateCon.do" method="post" enctype="multipart/form-data">
			<div>
		        <a href="../"></a>
		        <span>정보수정</span>
		        <input type="hidden" name="user_idx" value="<%=info.getUser_idx()%>">
		        <input type="submit" value="완료">
		    </div>
		    <div>
		        <input type="hidden" name="fileExt" id="fileExt" value="">
		        <input type="hidden" name="filesize" id="filesize" value="">
		        <input type="file" name="filename" id="filename" onchange="fileSize(this)" value="">
		    </div>
		    
		    <div>
		    	<%
		    		if(info.getFile_name() == null) {%>
		    	        <img id="profile_img" src="../../file/unknown.png" alt="" width="50px" height="50px">
		        		<input type="hidden" name="post_idx" value="">
		    	<%	}else{ %>
		    			<img id="profile_img" src="../../file/<%=info.getFile_name() %>" alt="" width="50px" height="50px">
		        		<input type="hidden" name="post_idx" value="1">
		    	<%  }%>
		        
		    </div>
		
		    <div>
		        <input type="text" name="kakao_id" value="<%=info.getKakao_id() %>" readonly style="background-color: rgb(216, 216, 216);">
		    </div>
		    <div>
		        <input type="text" name="nick" id="nick" value="<%=info.getNick()%>"><br>
		        <p id="nickChk"></p>
		        
		    </div>
	    </form>
	</div>
 
    <div>
        <span onclick="DeleteUser('1')">회원탈퇴</span>
    </div>
	   <script type="text/javascript">
	   
	   let urlSearch = new URLSearchParams(location.search);
       let result = urlSearch.get('result');
	   if(result.length >= 0){
		   if(result == "200") {
			   alert("정보 수정이 완료되었습니다");
		   }else{
			   document.getElementById("nickChk").innerText = "닉네임이 이미 존재합니다";
			   document.getElementById("nick").value = urlSearch.get('nick');
			   
		   }
		   
	   }
    	
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
    	    var reader = new FileReader();
    	    	console.log(reader);
    	    reader.onload = function(e) {
    	      	document.getElementById('profile_img').src = e.target.result;
    	    };
    	    reader.readAsDataURL(file);
    	    
    	    
       }
       
    </script>
<%} %>
</body>
</html>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>꺼냉</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/Kkeonaeng/css/joinStyles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c108db6a29.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
#endBtn {
	border: none;
	background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
	float: right;
	margin-right: 10px;
}

#endBtn:hover {
	color: #527fef;
}


.filebox .upload-display {  /* 이미지가 표시될 지역 */
  margin-bottom: 5px;
}

@media(min-width: 768px) { 
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}

.filebox .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
  display: inline-block;
  width: 54px;
  padding: 2px;
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
}

.filebox .upload-display img {  /* 추가될 이미지 */
  display: block;
  max-width: 100%;
  width: auto;
  height: auto;
}

</style>
</head>
<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");

	if (info == null) {
		response.sendRedirect("/Kkeonaeng/Login/");
	} else {
	%>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<form action="UpdateCon.do" method="post"
				enctype="multipart/form-data">
				<a href="/Kkeonaeng/MyPage/index.jsp"
					style="text-decoration-line: none;"> <i
					class="fa-solid fa-chevron-left"
					style="padding: 0px 10px 10px; color: black;"></i>
				</a> <span class="navbar-brand">내 정보 수정</span> <input type="submit"
					value="완료" id="endBtn">
		</div>
	</nav>

	<!-- main contents -->
	<div class="container">
		<div class="text-center mt-5">

			<div>
				<input type="hidden" name="user_idx" value="<%=info.getUser_idx()%>">
			</div>


			<div>
				<%
				if (info.getFile_name() == null) {
				%>
				<img id="profile_img" src="../../file/unknown.png" alt=""
					width="50px" height="50px"> <input type="hidden"
					name="post_idx" value="">
				<%
				} else {
				%>
				<img id="profile_img" src="../../file/<%=info.getFile_name()%>"
					alt="" width="50px" height="50px"> <input type="hidden"
					name="post_idx" value="1">
				<%
				}
				%>

				<div class="fileBox">
					<input type="hidden" name="fileExt" id="fileExt" value="">
					<input type="hidden" name="filesize" id="filesize" value="">
					<label for="filename">
					<i class="fa-solid fa-images"></i></label>
					<input type="file" name="filename" id="filename"
						onchange="fileSize(this)" value=""
						accept="image/png,image/jpg, image/jpeg" style="display: none;">
				</div>

			</div>

			<div>
				<input type="text" name="kakao_id" value="<%=info.getKakao_id()%>"
					readonly style="background-color: rgb(216, 216, 216);">
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
	</div>
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
       
       $(document).ready(function(){
    	   var fileTarget = $('.filebox .upload-hidden');

    	   fileTarget.on('change', function(){  // 값이 변경되면
    	     if(window.FileReader){  // modern browser
    	       var filename = $(this)[0].files[0].name;
    	     } 
    	     else {  // old IE
    	       var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
    	     }
    	     
    	     // 추출한 파일명 삽입
    	     $(this).siblings('.upload-name').val(filename);
    	   });
    	 }); 
       
    </script>
	<%
	}
	%>
</body>
</html>
<%@page import="com.smhrd.model.RegionDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.RegionDAO"%>
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
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/Kkeonaeng/css/joinStyles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c108db6a29.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="./css/btncss.css" rel="stylesheet" />

<style>
button {
    line-height: 30px!important;
    font-size: 13px!important;
    display: inline-block;
    padding: 0 10px;
    line-height: 48px;
    background-color: #fff;
    font-size: 15px;
    text-align: center;
    color: #161616;
    font-weight: bold;
    border-radius: 4px;
    border: 1px solid #b9b9b9;
    vertical-align: middle;
        }
        
        button:active {
  box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  position: relative;
  top:2px;
}
        
        li {
			list-style: none;
			width: 100%;
			display: flex;
    justify-content: space-between;
    align-items: center;
        }
        
	#endBtn {
	border: none;
	background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
	float: right;
	 padding: 0 10px;
  cursor: pointer;
  outline: none;
 
}

	#endBtn:active {
	color: #527fef;
	border: 1px solid #527fef;
	border-radius: 4px;
	font-weight: bold;
	vertical-align: middle;
	
	
}


	

@media(min-width: 768px) { 
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}



.profileBox{
position:relative;
overflow: hidden;
}


        
        
       .profileBox label {
    overflow: hidden;
    position: relative;
    display: block;
    text-align: center;
    height: 100%;}
    
   
    
    label.profileBtn {
    display: inline-block;
    width: 28px;
    height: 28px;
    background: #ced4da;
    text-align: center;
    position: absolute;
    right: 0;
    bottom: 0;
    z-index: 1;
    border-radius: 14px;
    margin-right: 8rem;
}
        
        img {
    border: 0;
    vertical-align: top;
    border-radius: 70px; }
    
  
    
.uplist{
    width: 30%;
    
}

.uplistp{
    width: 70%;
    
}
input{
border: none;
margin-top: 15px;
text-align: right;
}

select {
	width: 100px;
	
	
}

ul{
padding:15px;
margin-bottom: 0;
}

#profile_img{
	object-fit : cover;
}

select {
  max-height: 100px;
  word-wrap: normal;
  border: none;
  background: #a3a3a340;
  border-radius: 25px;
  padding: 7px;
  margin-bottom: 5px!important;
}
</style>
</head>
<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	List<RegionDTO> regionList = null;
	if (info == null) {
		response.sendRedirect("/Kkeonaeng/Login/");
	} else {
		regionList = new RegionDAO().regionAll();
		
		int gu_code = 0;
        
        for(int i = 0; i < regionList.size();i++){ 
        	
        	String selected = "";
        	if(regionList.get(i).getRg_idx() == info.getRg_idx()) {
        		selected = "selected";
        		gu_code = regionList.get(i).getGu_code();
        	}
        	
        }
	%>
	<!-- 내 정보 변경 페이지 -->
	
	
	<!-- navbar -->
	<form action="UpdateCon.do" method="post"
				enctype="multipart/form-data">
	<nav class="navbar navbar-expand-lg" style="backgroud-color:#fff;">
		<div class="container">
			
				<a href="/Kkeonaeng/MyPage/index.jsp"
					style="text-decoration-line: none;"> <i
					class="fa-solid fa-chevron-left"
					style="padding: 0px 10px 10px; color: black;"></i>
				</a> 
				<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold">내 정보 수정</strong>
				<input type="submit"
					value="완료" id="endBtn" style="margin: 0;">
		</div>
	</nav>

	<!-- main contents -->
	<div class="container">
		<div class="text-center mt-5">
			<div class="profileBox">
			<label for="filename">
				<%
				if (info.getFile_name() == null) {
				%>
				<img id="profile_img" src="../../file/unknown.png" alt=""
					width="100px" height="100px" style="object-fit: cover;"> <input type="hidden"
					name="post_idx" value="">
				<%
				} else {
				%>
				<img id="profile_img" src="../../file/<%=info.getFile_name()%>"
					alt="" width="100px" height="100px"> <input type="hidden"
					name="post_idx" value="1">
				<%
				}
				%>
				<input type="file" name="filename" id="filename"
						onchange="fileSize(this)" value=""
						accept="image/png,image/jpg, image/jpeg" style="display: none;">
				</label>
				<label for="filename" class="profileBtn">
					<i class="fa-solid fa-camera"></i>
					</label>
					
			</div>

			<div style="width: 100%; margin-top:10px;">
			<ul class="titleList">
			<li>
			<span class="uplist">닉네임</span>
			<p class="uplistp"><input type="text" name="nick" id="nick" value="<%=info.getNick()%>"><br>
				<p id="nickChk"></p></p>
					</li>
			<li>
			<span class="uplist">이메일</span>
			<p class="uplistp"><input type="text" name="kakao_id" value="<%=info.getKakao_id()%>"
					readonly></p>
			</li>
			<li style="height: 20px; margin-top: 20px">
			<span class="uplist">내 동네</span>
			<select name="gu_code_select" id="gu_code_select" onchange="setObjDong()">
                <option value="">-- 행정구 --</option>
                <option value="1">동구</option>
                <option value="2">서구</option>
                <option value="3">남구</option>
                <option value="4">북구</option>
                <option value="5">광산구</option>
                
            </select>
            <select name="rg_idx" id="rg_idx">
                <option value="" >-- 행정동 --</option>
            </select>
						<input type="hidden" name="gu_code" id="gu_code" value="<%=gu_code%>">
			</li>
			</ul>
			<input type="hidden" name="user_idx" value="<%=info.getUser_idx()%>">
			<input type="hidden" name="fileExt" id="fileExt" value="">
			<input type="hidden" name="filesize" id="filesize" value="">
			
			</div>
			</div>
	</div>
	
			</form>
			
		<div class="text-center" style="margin-top: 10rem;">
		<input type="hidden" name="user_idx" value="<%=info.getUser_idx()%>">
		<button onclick="DeleteUser('1')">회원탈퇴</button>
		</div>

		
		
	
	
	<script type="text/javascript">
	   
	   let urlSearch = new URLSearchParams(location.search);
       let result = urlSearch.get('result');
	   if(result != null && result.length > 0){
		   if(result == "200") {
			   alert("정보 수정이 완료되었습니다.");
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
            if(confirm('탈퇴시 계정의 복구가 불가합니다. 정말로 삭제하시겠습니까?')){
               location.href = "DeleteCon.do?user_idx="+<%=info.getUser_idx()%>
            }
       }
       
       const fileSize = ($target) => {
    	    // 유저가 선택한 파일 가져오기
    	    var file = $target.files[0];
    	    
    	    document.getElementById('fileExt').value = (file.name).split('.')[1];
    	    document.getElementById('filesize').value = file.size;
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
    	      	document.getElementById('profile_img').src = e.target.result;
    	    };
    	    reader.readAsDataURL(file);
    	    
    	    
       }
       
       
       // 페이지 열리면 동 모든 동 정보 담기
       let dongList = [];
       let dongListData = [];
       function objDong(){
    	   
    	   <%for(RegionDTO r : regionList){%>
    	   dongList.push({gu:<%=r.getGu_code()%>,idx:<%=r.getRg_idx()%>,dong:'<%=r.getRegion()%>'});
    	   <%}%>
       }
       objDong();
       
       // 페이지 열리면 구 정보 맞춰서 체크하기
       function changeRegion(){
    	   let gu_code_select = document.getElementById('gu_code_select');
       	   let gu_code = document.getElementById('gu_code').value;
    	   gu_code_select.value = gu_code;
    	   setObjDong();
    	   let rg_idx = document.getElementById('rg_idx').value = <%=info.getRg_idx()%>;
    	   
       }
       changeRegion()
       // 보여줄 동 새로만들기
       function setObjDong(){
    	   dongListData = [];
    	   
    	   for(var i = 0; i < dongList.length;i++){
    		   var dong = dongList[i];
    		   let gu_code = document.getElementById('gu_code_select').value;
    		   if(dong.gu == gu_code) {
    			   dongListData.push(dong);
    		   }
    	   }
    	   
    	   dongPrint();
       }
       
       
       function dongPrint() {
    	   
    	   var dongHtml = '<option value="">-- 행정동 --</option>';
    	   for(var i = 0; i < dongListData.length;i++){
    		   var dongData = dongListData[i];
    		   let gu_code = document.getElementById('gu_code').value;
    		   dongHtml += `<option value="${dongData.idx}">${dongData.dong}</option>`;
    	   }
    	   
    	   document.getElementById('rg_idx').innerHTML = dongHtml;
    	   
    	   
    	   
       };
       
       
       
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
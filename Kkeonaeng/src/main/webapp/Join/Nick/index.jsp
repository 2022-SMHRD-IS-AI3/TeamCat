<%@page import="com.smhrd.model.RegionDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.RegionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}



table {
	width: 100%;
	border: 1px solid #444444;
}

input {
	height: 40px;
	width: 100%;
	margin: 20px auto;
	border-left: none;
	border-right: none;
	border-top: none;
	padding-left: 5px;
	font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
}

button {
	height: 40px;
	width: 100%;
	border-radius: 4px;
	margin-top: 30px;
	margin-bottom: 20px;
	border: none;
	background-color: #cccccc;
	color: #ffffff;
	font-family: sans-serif;
	font-weight: 700;
	font-size: 14pt;
}

button:hover {
	background-color: #527fef;
	transition-duration: 0.3s;
}

form {
	width: 90%;
	margin: 40px auto;
	text-align: center;
}

input:focus {
	outline: none
}

.userInput {
	margin-bottom: 20px;
}


.myform {
	width: 40%;
	margin: auto;
}

::-webkit-input-placeholder {
	/* Chrome/Opera/Safari */
	color: #cccccc;
}

.fa-cloud-upload {
	font-size: 90px;
}

.logo {
	color: white;
	font-family: sans-serif;
	font-size: 15pt;
	font-weight: 600;
	text-align: center;
	padding-top: 20px
}

::-moz-placeholder {
	/* Firefox 19+ */
	color: #cccccc;
}

:-ms-input-placeholder {
	/* IE 10+ */
	color: #cccccc;
}

:-moz-placeholder {
	/* Firefox 18- */
	color: #cccccc;
}

@media screen and (max-width:500px) {
	.myform {
		width: 80%;
	}
}

@media screen and (max-width:800px) {
	.myform {
		width: 60%;
	}
}

select{
	word-wrap: normal;
    border: none;
    background: #a3a3a340;
    border-radius: 25px;
    padding: 7px;
    margin-bottom: 5px!important;
}
</style>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<meta charset="UTF-8">
<title>꺼냉</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/Kkeonaeng/css/joinStyles.css" rel="stylesheet" />

<!-- Pheasant Buttons -->
<!-- Pheasant Demure Buttons Reset: Optional -->
<!-- Pheasant Demure Buttons Layout: Optional -->
<!-- Pheasant Demure Buttons: Required -->

<script src="https://kit.fontawesome.com/c108db6a29.js"
	crossorigin="anonymous"></script>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<%
	String kakao_id = request.getParameter("k");
	String gender = request.getParameter("g");
	List<RegionDTO> regionList = new RegionDAO().regionAll();
	int rg_idx = Integer.parseInt(request.getParameter("rg_idx"));
    int gu_code = 0;
    for(int i = 0; i < regionList.size();i++){ 
    	
    	String selected = "";
    	if(regionList.get(i).getRg_idx() == rg_idx) {
    		selected = "selected";
    		gu_code = regionList.get(i).getGu_code();
    	}
    	
   }
	%>
	
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a href="../../Login/" style="text-decoration-line: none;"> <i
				class="fa-solid fa-chevron-left"
				style="padding: 0px 10px 10px; color: black;"></i>
			</a> <span style="font-size: 15px; color: black;">
				회원가입</span>
		</div>
	</nav>

	<!-- Page content-->
	<!-- join plus form -->
	<div class="container">
		<div class="text-center mt-5">
			<div class="myform">
				<div class="logo">
					<img src="/Kkeonaeng/file/unknown.png" alt="프로필 사진" style="width: 100px; height: 100px;border-radius: 50%;">
				</div>
				<form action="JoinCon.do" method="post">
					<p style="text-align: left;">닉네임</p>
					<input class="userInput" type="text" name="nick"
						placeholder="닉네임을 적어주세요."> 
					<p style="text-align: left;">주소</p>	
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
					<input type="hidden" name="gender" id="gender" value="<%=gender%>">
					<input type="hidden" name="kakao_id" id="kakao_id" value="<%=kakao_id%>">
					<br>
					<span id="nickChk"></span>

					<button type="submit">회원가입</button>
	
				</form>
			</div>
		</div>
	</div>
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- <script src="js/scripts.js"></script> -->
	<script>
		document.querySelector("form").addEventListener("submit", function(e) {
			if (document.getElementsByClassName("nickInput").value == '') {
				e.preventDefault()
				alert("닉네임을 입력하세요.")
			}
		});
	
		let urlSearch = new URLSearchParams(location.search);
		let result = urlSearch.get('result');
		if (result != null && result.length >= 0) {
			if (result == "300") {
				document.getElementById("nickChk").innerHTML = "계정이나 닉네임이<br> 이미 존재합니다";
				document.getElementById("nick").value = urlSearch.get('nick');

			}

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
	    	   document.getElementById('rg_idx').value = <%=rg_idx%>;
	    	   
	       }
	       
	       let rg_idx = urlSearch.get('rg_idx');
		   if (rg_idx != null) {
	           if (result == "300") {
	        	   changeRegion()
	           }

		   }
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
		
	</script>

</body>
</html>
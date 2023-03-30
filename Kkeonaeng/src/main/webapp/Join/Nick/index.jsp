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
<link rel="stylesheet"
	href="./dist/css/pheasant-demure-buttons-reset.css" type="text/css"
	media="all" />
<!-- Pheasant Demure Buttons Layout: Optional -->
<link rel="stylesheet"
	href="./dist/css/pheasant-demure-buttons-layout.css" type="text/css"
	media="all" />
<!-- Pheasant Demure Buttons: Required -->
<link rel="stylesheet" href="./dist/css/pheasant-demure-buttons.css"
	type="text/css" media="all" />

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
					<select style="margin-bottom: 10px;">
			<option value="행정구">행정구</option>
                <option value="">행정구 넣어주세요</option>
            </select>
            <select style="margin-bottom: 10px;">
			<option value="행정동">행정동</option>
                <option value="">행정동 넣어주세요</option>
                
            </select>
						<input type="hidden" name="gender"
						id="gender" value="<%=gender%>"> <input type="hidden"
						name="kakao_id" id="kakao_id" value="<%=kakao_id%>"> <br>
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
	<script src="js/scripts.js"></script>
	<script>
		document.querySelector("form").addEventListener("submit", function(e) {
			if (document.getElementsByClassName("nickInput").value == '') {
				e.preventDefault()
				alert("닉네임을 입력하세요.")
			}
		});
	</script>


	<script type="text/javascript">
		let urlSearch = new URLSearchParams(location.search);
		let result = urlSearch.get('result');
		if (result.length >= 0) {
			if (result == "300") {
				document.getElementById("nickChk").innerHTML = "계정이나 닉네임이<br> 이미 존재합니다";
				document.getElementById("nick").value = urlSearch.get('nick');

			}

		}
	</script>

</body>
</html>
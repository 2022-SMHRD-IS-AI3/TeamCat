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
<link href="../css/styles.css" rel="stylesheet" />
<style >
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

.title {
	background: rgb(2, 0, 36);
	background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%,
		rgba(82, 127, 239, 1) 35%, rgba(0, 212, 255, 1) 100%);
	-webkit-text-fill-color: transparent;
	-webkit-background-clip: text;
	font-family: 'TheJamsil5Bold';
}
</style>
<script src="https://kit.fontawesome.com/c108db6a29.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a href="../Main.jsp" style="text-decoration-line: none;"> <i
				class="fa-solid fa-chevron-left"
				style="padding: 0px 10px 10px; color: black;"></i>
			</a> <span class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold"">로그인</span>
		</div>
	</nav>

	<!-- 제목 -->
	<h1 class="title"
		style="text-align: center; margin-top: 30px; font-size: 35px; font-weight: bold; color: #527fef;">꺼냉</h1>

	<!-- Page content-->
	<div class="container">
		<div class="text-center mt-5">
			<p class="lead">
				<a onclick="kakaoLogin()" id="kakao_login_btn"><img src="../img/kakao_login_medium_wide.png" alt="카카오로 로그인하기">
				</a>
			</p>
			<span
				style="font-size: 13px; font-weight: bold; padding-right: 10px;">꺼냉이
				처음이신가요?</span> <a href="../Join/index.html" style="font-size: 13px;">회원가입</a>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
  
  Kakao.init('bf715548461cb6d295d31774eda4c2bc'); //발급받은 키 중 javascript키를 사용해준다.
  console.log(Kakao.isInitialized()); // sdk초기화여부판단
  //카카오로그인
  function kakaoLogin() {
      Kakao.Auth.login({
        success: function (response) {
          Kakao.API.request({
            url: '/v2/user/me',
            success: function (response) {
              console.log(response)
              location.href = "LoginCon.do?kakao_id=" + response.kakao_account.email;
            },
            fail: function (error) {
              console.log(error)
            },
          })
        },
        fail: function (error) {
          console.log(error)
        },
      })
    }
  //카카오로그아웃  
  function kakaoLogout() {
      if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
            console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
        Kakao.Auth.setAccessToken(undefined)
      }
    }  
  </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a onclick="kakaoLogin()" id="kakao_login_btn">
				<img height="50px" src="kakao_login_button.png"/></a>
				<br>
	<!-- <form action="LoginCon.do" method="post">
		<a onclick="kakaoLogin()" id="kakao_login_btn">
				<img height="50px" src="kakao_login_button.png"/></a>
        <input type="text" name="kakao_id" value="" id="kakao_id">
        <input type="submit" value="카카오로 로그인"></td>
    </form> -->
    <a href="Join.html">회원가입</a>
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
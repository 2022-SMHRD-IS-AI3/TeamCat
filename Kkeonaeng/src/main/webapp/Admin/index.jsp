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

	<style type="text/css">
	
		
		.imgWrap {
  width: 200px;
  height: 150px;
  overflow: hidden; /* 넘치는 이미지를 가린다 */
  
}
 
	.imgWrap> img {
  position: absolute;
  width: 100%;
  top: 50%; 
  left: 50%;
  transform: translate(-50%, -50%);
	}
	
	.wrap{
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px 20px;
	}

		 li {
			list-style: none;
			text-align: left;
        }
         
         a {
         	text-decoration: none;
         	box-sizing: border-box;
         	color: black;
         	margin-left: auto;
         }
         

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
        
         .QuickMenuMobile{
        position: fixed;
        bottom: 0;
        z-index: 111;
        flex-direction: row;
        display: flex !important;
        width: 100%;
        background: white;
        box-shadow: 0 -1.5px 0 0 rgba(0, 0, 0, 0.1);
        min-height: 50px;
        padding-inline: 12px;
     }
     .QuickMenuMobile .menu-items{
        display: flex;
        align-items: center;
        flex: 1;
     }
     .QuickMenuMobile .menu{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 8px 0;
     }
     .fl-1{
        flex: 1;
     }
     
     
     
	</style>

</head>
<body>

	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		if(info == null) {
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
	%>
	 
	
    <div class="container">
       
    <strong style="margin-top: 20px;">어드민 권한</strong>
    <div class="wrap" style="height: 120px; width:100%; padding:5px;">
    <ul>
    <li>
    <a href="./UserList/">- 전체회원관리(회원 강제 삭제)</a></li>
            
    <li>
    <a href="./Product/">- 전체글관리(물건글 삭제)</a></li>
            
    <li>
    <a href="./Review/">- 리뷰글관리(리뷰글 삭제)</a></li>
            </ul>
            </div>     
    
    
    
    </div>
    <%} %>
    
    
</body>
</html>
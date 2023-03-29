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
	 
	<nav class="navbar navbar-expand-lg">
		<div class="container">
				<span class="navbar-brand">마이페이지</span>
		</div>
	</nav>
	
    <div class="container">
        <div class="wrap" style="height: 120px; width:100%; padding:5px; margin-top: 20px;">
            <span id="imgWrap" style="height: 100%; width: 35%;"><%
	    		if(info.getFile_name() == null) {%>
	    	        <img id="profile_img" src="../file/unknown.png" alt="" width="100px" height="100px">
	    	<%	}else{ %>
	    			<img id="profile_img" src="../file/<%=info.getFile_name() %>" alt="" width="100px" height="100px">
	    	<%  }%>
	    	</span>
	    	
	    	<strong id="nick"><%=info.getNick()%></strong>
        	<a href="./info/"><button>정보수정</button></a>
	    	
	    	</div>
    <p style="margin-top: 20px;">어드민 권한</p>
    <div class="wrap" style="height: 120px; width:100%; padding:5px;">
    <ul>
    <li><i class="fa-solid fa-heart fa-xl"></i>
    <a href="./UserList/">전체회원관리(회원 강제 삭제)</a></li>
            
    <li><i class="fa-solid fa-box-archive fa-xl"></i>
    <a href="/Kkeonaeng/Product/">전체글관리(물건글 삭제)</a></li>
            
    <li><i class="fa-solid fa-check fa-xl"></i>
    <a href="./Review/">리뷰글관리(리뷰글 삭제)</a></li>
            </ul>
            </div>     
    <p style="margin-top: 20px;">기타</p>
    <div  class="wrap" style="height: 120px; width:100%; padding:5px;">
        <ul>
            <li>
                <i class="fa-solid fa-clipboard-list fa-xl"></i><a href="./Review/">내가 받은 리뷰 보기</a>
            </li>
        </ul>
        </div>
    
    
    </div>
    <%} %>
    <div class="QuickMenuMobile">
                <div class="menu-items">
                    <div class="menu fl-1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4.00074 11V20C4.00074 20.5522 4.44845 21 5.00074 21H10.0007C10.553 21 11.0007 20.5522 11.0007 20V14H13.0007V20C13.0007 20.5522 13.4485 21 14.0007 21H19.0007C19.553 21 20.0007 20.5522 20.0007 20V11H21.8159C22.284 11 22.4954 10.4143 22.1353 10.1153L13.2784 2.76087C12.5377 2.14579 11.4638 2.14579 10.7231 2.76087L1.86615 10.1153C1.50603 10.4143 1.71748 11 2.18557 11H4.00074ZM15.0007 14V19H18.0007L18.0007 9.2817L12.0007 4.29956L6.00073 9.28171V10.9955L6.00074 11V19H9.00074L9.00073 13C9.00073 12.4477 9.44845 12 10.0007 12H14.0007C14.553 12 15.0007 12.4477 15.0007 13V13.9956L15.0007 14Z" fill="black"/>
                            </svg>
                            
                        <div class="title active">홈</div>
                    </div>
                </div>
                <div class="menu-items">
                    <div class="menu fl-1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M14.0009 14C14.0009 14.5523 13.5532 15 13.0009 15L9.00092 15C8.44863 15 8.00092 14.5523 8.00092 14C8.00092 13.4477 8.44863 13 9.00092 13H13.0009C13.5532 13 14.0009 13.4477 14.0009 14Z" fill="black"/>
                            <path d="M16.0009 9.99999C16.0009 10.5523 15.5532 11 15.0009 11L9.00092 11C8.44863 11 8.00092 10.5523 8.00092 9.99999C8.00092 9.4477 8.44863 8.99999 9.00092 8.99999H15.0009C15.5532 8.99999 16.0009 9.4477 16.0009 9.99999Z" fill="black"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M19.4151 6.4142C19.7902 6.78927 20.0009 7.29798 20.0009 7.82841L20.0009 20C20.0009 21.1046 19.1055 22 18.0009 22H6.00092C4.89635 22 4.00092 21.1046 4.00092 20L4.00092 3.99998C4.00092 2.89541 4.89635 1.99998 6.00092 1.99998L14.1725 1.99998C14.7029 1.99998 15.2116 2.21069 15.5867 2.58576L19.4151 6.4142ZM18.0009 7.82841L18.0009 20H6.00092L6.00092 3.99998L14.1725 3.99998L18.0009 7.82841Z" fill="black"/>
                            </svg>
                            
                            
                        <div class="title active">게시판</div>
                    </div>
                </div>
                <div class="menu-items">
                    <div class="menu fl-1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M0 9C0 10.5545 0.498805 12.0055 1.36191 13.2333L0.494498 16.2693C0.278969 17.0236 0.976393 17.721 1.73074 17.5055L5.58545 16.4042C6.06733 16.5799 6.57016 16.7196 7.08969 16.8194C7.08972 16.8195 7.08966 16.8194 7.08969 16.8194C7.70526 16.9377 8.34435 17.0001 8.99972 17.0001C9.1675 17.0001 9.33421 16.996 9.49973 16.9879C9.49954 16.9879 9.49991 16.9879 9.49973 16.9879C14.2381 16.7577 18 13.2694 18 9C18 4.58172 13.9706 1 9 1C4.02944 1 0 4.58172 0 9ZM3.28496 13.7828C3.45089 13.202 3.34547 12.5773 2.99811 12.0832C2.35542 11.1689 2 10.1153 2 9C2 5.90124 4.90604 3 9 3C13.094 3 16 5.90124 16 9C16 12.0988 13.094 15 9 15C8.02549 15 7.10445 14.8293 6.27081 14.5253C5.87419 14.3806 5.44195 14.3651 5.03601 14.4811L2.91204 15.088L3.28496 13.7828Z" fill="black"/>
                            <path d="M19.5337 6.08789C19.8167 6.94292 19.9783 7.85289 19.9977 8.80484C21.2586 9.92076 21.9997 11.4352 21.9997 13.0001C21.9997 14.1154 21.6443 15.169 21.0016 16.0832C20.6543 16.5774 20.5488 17.2021 20.7148 17.7828L21.0877 19.088L18.9637 18.4812C18.5578 18.3652 18.1255 18.3806 17.7289 18.5253C16.8953 18.8294 15.9742 19.0001 14.9997 19.0001C14.0209 19.0001 13.1101 18.8342 12.2906 18.5395C11.2558 18.8357 10.1641 18.9956 9.0465 19C10.6331 20.2448 12.7172 21.0001 14.9997 21.0001C16.2083 21.0001 17.3613 20.7883 18.4143 20.4042L22.269 21.5056C23.0233 21.7211 23.7208 21.0237 23.5052 20.2693L22.6378 17.2334C23.5009 16.0055 23.9997 14.5546 23.9997 13.0001C23.9997 10.0514 22.2051 7.47537 19.5337 6.08789Z" fill="black"/>
                            </svg>
                            
                        <div class="title active">나의 채팅</div>
                    </div>
                </div>
                <div class="menu-items">
                    <div class="menu fl-1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7ZM14 7C14 8.10457 13.1046 9 12 9C10.8954 9 10 8.10457 10 7C10 5.89543 10.8954 5 12 5C13.1046 5 14 5.89543 14 7Z" fill="black"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M20 17.1666C20 16.7333 19.8642 16.3074 19.5815 15.979C17.7477 13.8488 15.0313 12.5 12 12.5C8.96866 12.5 6.25235 13.8488 4.41847 15.979C4.13576 16.3074 4 16.7333 4 17.1666V19C4 20.1046 4.89543 21 6 21H18C19.1046 21 20 20.1046 20 19V17.1666ZM18 17.2083C16.5313 15.5445 14.3887 14.5 12 14.5C9.61132 14.5 7.46872 15.5445 6 17.2083V19H18V17.2083ZM6.00017 17.1622C6.00017 17.1622 6.00018 17.1622 6.00017 17.1623C6.00016 17.1624 6.00015 17.1625 6.00012 17.1627C6.00014 17.1625 6.00016 17.1623 6.00017 17.1622Z" fill="black"/>
                            </svg>
                            
                        <div class="title active">마이페이지</div>
                    </div>
                </div>
             
            </div>
    
</body>
</html>
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
	
		
		#imgWrap {
  width: 150px;
  height: 150px;
  overflow: hidden; /* 넘치는 이미지를 가린다 */
  
}
 
	#imgWrap> img {
  border: 0;
    vertical-align: top;
    border-radius: 70px;
	}
	
	.wrap{
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px 20px;
	}

	ul {
	padding:0!important;
	}
		 li {
			list-style: none;
			
			display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #e5e5e5;
    height: 2rem;
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
     .fl-1 {
	flex: 1;
}

.QuickMenuMobile .title {
	font-size: 11px;
	margin-top: 3px;
}

.col-lg-8 {
	display: flex;
}

.card-text {
	font-size: small;
}

.pp {
	font-size: large;
}

.btn {
	margin-left: 200px;
}

.more {
	margin-left: 280px;
	margin-bottom: 15px;
	font-size: 15px;
}

.more1 {
	padding-bottom: 3%;
}

.pop {
	position: fixed;
	font-size: 19px;
	padding-bottom: 5%;
	font-weight: bold;
}
.log{
	position: absolute;
    top: 15px;
    right: 15px;
}

     
hr {
  width : 100%;
  height : 10px!important;
  background-color : #e5e5e5;
  border : 0;

}
i{
padding-left:10px;
}

#profile_img{
	object-fit : cover;
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
				<p class="navbar-brand" style="font-weight: bold; font-size:18px; padding-left:10px;">마이페이지</p>
		</div>
	</nav>
	
	
    <div class="container">
        <div class="wrap" style="height: 120px; width:100%; padding:5px; margin-top: 20px;  margin-bottom: 20px;">
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
	    	</div>
	    	<hr>
	<div class="container">  	
    <p style="margin-top: 20px; margin-bottom: 10px; padding-left:10px; font-weight: bold;">나의 거래</p>
    <div style="height: 120px; width:100%; padding:5px;">
    <ul>
    <li>
    <span><i class="fa-solid fa-heart fa-xl"></i>
    </span>
    <span style="padding-right:10px;"><a href="./Wishlist/">관심목록</a></span>
    </li>
            
    <li>
    <span><i class="fa-solid fa-box-archive fa-xl"></i>
   </span>
    <span style="padding-right:10px;"> <a href="/Kkeonaeng/Rent/">대여목록</a></span>
    </li>
            
    <li>
    <span><i class="fa-solid fa-check fa-xl"></i>
    
    </span>
    <span style="padding-right:10px;"><a href="/Kkeonaeng/Reservation/">예약내역</a></span>
    </li>
            </ul>
            </div> 
            </div>
            <hr>
            <div class="container">    
    <p style="margin-top: 20px; margin-bottom: 10px; padding-left:10px; font-weight: bold;">기타</p>
    <div  style="height: 120px; width:100%; padding:5px;">
        <ul>
            <li>
            <span><i class="fa-solid fa-clipboard-list fa-xl"></i></span>
                <span style="padding-right:10px;"><a href="./Review/">내가 받은 리뷰 보기</a></span>
            </li>
        </ul>
        </div>
    
    
    </div>
    <%} %>

    <div class="QuickMenuMobile">

        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Main.jsp')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M4.00074 11V20C4.00074 20.5522 4.44845 21 5.00074 21H10.0007C10.553 21 11.0007 20.5522 11.0007 20V14H13.0007V20C13.0007 20.5522 13.4485 21 14.0007 21H19.0007C19.553 21 20.0007 20.5522 20.0007 20V11H21.8159C22.284 11 22.4954 10.4143 22.1353 10.1153L13.2784 2.76087C12.5377 2.14579 11.4638 2.14579 10.7231 2.76087L1.86615 10.1153C1.50603 10.4143 1.71748 11 2.18557 11H4.00074ZM15.0007 14V19H18.0007L18.0007 9.2817L12.0007 4.29956L6.00073 9.28171V10.9955L6.00074 11V19H9.00074L9.00073 13C9.00073 12.4477 9.44845 12 10.0007 12H14.0007C14.553 12 15.0007 12.4477 15.0007 13V13.9956L15.0007 14Z"
                        fill="black" />
                </svg>

                <div class="title active">홈</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Product/')">
            <div class="menu fl-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-box-seam" viewBox="0 0 16 16">
                    <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                  </svg>
                    
                <div class="title active">빌려드림</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Reservation/')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20.5 12C20.5 16.6944 16.6945 20.5 12 20.5C7.63658 20.5 4.04105 17.2121 3.55575 12.9786C3.50944 12.5746 3.18006 12.25 2.77339 12.25C2.35106 12.25 2.00879 12.5991 2.05133 13.0193C2.56197 18.0634 6.82128 22 12 22C17.5229 22 22 17.5228 22 12C22 6.47715 17.5229 2 12 2C8.34254 2 5.14365 3.96356 3.40003 6.89402V4.25C3.40003 3.83579 3.06424 3.5 2.65003 3.5C2.23581 3.5 1.90002 3.83579 1.90002 4.25V8.5C1.90002 8.69891 1.97904 8.88968 2.11969 9.03033C2.26035 9.17098 2.45111 9.25 2.65003 9.25L6.90003 9.25C7.31425 9.25 7.65003 8.91421 7.65003 8.5C7.65003 8.08579 7.31424 7.75 6.90003 7.75L4.63718 7.75C6.10687 5.20934 8.85383 3.5 12 3.5C16.6945 3.5 20.5 7.30558 20.5 12Z" fill="black"/>
                    <path d="M12 7.5C11.5858 7.5 11.25 7.83579 11.25 8.25V12C11.25 12.268 11.393 12.5155 11.625 12.6495L15.3056 14.7745C15.6644 14.9816 16.1231 14.8587 16.3302 14.5C16.5373 14.1413 16.4144 13.6826 16.0556 13.4755L12.75 11.567V8.25C12.75 7.83579 12.4143 7.5 12 7.5Z" fill="black"/>
                    </svg>
                <div class="title active">나의 예약</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/MyPage/')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7ZM14 7C14 8.10457 13.1046 9 12 9C10.8954 9 10 8.10457 10 7C10 5.89543 10.8954 5 12 5C13.1046 5 14 5.89543 14 7Z"
                        fill="black" />
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M20 17.1666C20 16.7333 19.8642 16.3074 19.5815 15.979C17.7477 13.8488 15.0313 12.5 12 12.5C8.96866 12.5 6.25235 13.8488 4.41847 15.979C4.13576 16.3074 4 16.7333 4 17.1666V19C4 20.1046 4.89543 21 6 21H18C19.1046 21 20 20.1046 20 19V17.1666ZM18 17.2083C16.5313 15.5445 14.3887 14.5 12 14.5C9.61132 14.5 7.46872 15.5445 6 17.2083V19H18V17.2083ZM6.00017 17.1622C6.00017 17.1622 6.00018 17.1622 6.00017 17.1623C6.00016 17.1624 6.00015 17.1625 6.00012 17.1627C6.00014 17.1625 6.00016 17.1623 6.00017 17.1622Z"
                        fill="black" />
                </svg>

                <div class="title active">마이페이지</div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
    const moveUrl = (url) => {
		location.href = url;
	}
    </script>
</body>
</html>
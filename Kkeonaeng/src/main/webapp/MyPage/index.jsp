<%@page import="com.smhrd.model.UserDAO"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
    padding: 5px;
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
  background-color : #cccccc;
  border : 0;

}
i{
padding-left:10px;
color:  #343a40;
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
			int login_idx = info.getUser_idx();
			int user_idx = Integer.parseInt(request.getParameter("user_idx"));
			
			if(login_idx == user_idx) {
			
	%>
	 
	 
	 <!-- 마이페이지 -->
	<nav class="navbar navbar-expand-lg">
		<div class="container">
				<p class="navbar-brand" style="font-weight: bold; font-size:18px; padding-left:10px;">
				마이페이지</p>
		</div>
	</nav>
	
	
    <div class="container">
        <div class="wrap" style="height: 120px; width:100%; padding:5px; margin-top: 20px;  margin-bottom: 20px;">
            <span id="imgWrap" style="height: 100%; width: 35%;"><%
	    		if(info.getFile_name() == null) {%>
	    	        <img id="profile_img" src="../img/unknown.png" alt="" width="100px" height="100px">
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
    <span><i class="fa-regular fa-heart fa-lg"></i>
    <a href="./Wishlist/">나의 관심 목록</a>
    </span>
    <span></span>
    </li>
            
    <li>
    <span><i class="fa-solid fa-box-archive fa-lg"></i>
    <a href="/Kkeonaeng/Rent/?user_idx=<%=info.getUser_idx()%>">내가 쓴 대여글 목록</a>
   </span>
    <span> </span>
    </li>
            
    <li>
    <span><i class="fa-solid fa-clock-rotate-left fa-lg"></i>
    <a href="/Kkeonaeng/Reservation/">나의 예약 목록</a>
    </span>
    <span></span>
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
            <span><i class="fa-regular fa-comment-dots fa-lg"></i>
            <a href="./Review/?user_idx=<%=info.getUser_idx()%>">내가 받은 리뷰</a>
            </span>
                <span></span>
            </li>
            <li>
            <span><i class="fa-regular fa-paper-plane fa-lg"></i>
            <a href="/Kkeonaeng/Message/">내가 받은 메세지</a>
            </span>
                <span></span>
            </li>
            <li>
            <span><i class="fa fa-book fa-lg" style="margin-left: 2px;"></i>
            <a href="/Kkeonaeng/Manual/">꺼냉 사용법</a>
            </span>
                <span></span>
            </li>
        </ul>
        </div>
    
    </div>
   		 <%}else{
   			UserDTO user = new UserDAO().userInfo(user_idx);
   		 
   		 
   		 %>
   		 	
   		  <!-- 마이페이지 -->
	<nav class="navbar navbar-expand-lg">
		<div class="container">
		<a onclick="moveBack()"
					style="text-decoration-line: none;"> <i
					class="fa-solid fa-chevron-left"
					style="padding: 0px 10px 10px; color: black;"></i>
				</a> 
				<strong class="navbar-brand" style="font-size:17px;">
				프로필</strong>
		</div>
	</nav>
	
	
    <div class="container">
        <div class="wrap" style="height: 120px; width:100%; padding:5px; margin-top: 20px;  margin-bottom: 20px;justify-content: flex-start;">
            <span id="imgWrap" style="height: 100%; width: 35%;"><%
	    		if(user.getFile_name() == null) {%>
	    	        <img id="profile_img" src="../img/unknown.png" alt="" width="100px" height="100px">
	    	<%	}else{ %>
	    			<img id="profile_img" src="../file/<%=user.getFile_name() %>" alt="" width="100px" height="100px">
	    	<%  }%>
	    	</span>
	    	
	    	<strong id="nick"><%=user.getNick()%></strong>
	    	</div>
	    	</div>
	    	<hr>
	<div class="container">  	
    <p style="margin-top: 20px; margin-bottom: 10px; padding-left:10px; font-weight: bold;">나의 거래</p>
    <div style="height: 120px; width:100%; padding:5px;">
    <ul>
            
    <li>
    <span><i class="fa-solid fa-box-archive fa-lg"></i>
    <a href="/Kkeonaeng/Rent/?user_idx=<%=user_idx%>">대여글 목록</a>
   </span>
    <span> </span>
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
            <span><i class="fa-regular fa-comment-dots fa-lg"></i>
            <a href="./Review/?user_idx=<%=user_idx%>">받은 리뷰</a>
            </span>
                <span></span>
            </li>
            
        </ul>
        </div>
    
    </div>
   		 <%} %>
   		 
    <%} %>

    <div class="QuickMenuMobile">
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Main.jsp')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M4.00074 11V20C4.00074 20.5522 4.44845 21 5.00074 21H10.0007C10.553 21 11.0007 20.5522 11.0007 20V14H13.0007V20C13.0007 20.5522 13.4485 21 14.0007 21H19.0007C19.553 21 20.0007 20.5522 20.0007 20V11H21.8159C22.284 11 22.4954 10.4143 22.1353 10.1153L13.2784 2.76087C12.5377 2.14579 11.4638 2.14579 10.7231 2.76087L1.86615 10.1153C1.50603 10.4143 1.71748 11 2.18557 11H4.00074ZM15.0007 14V19H18.0007L18.0007 9.2817L12.0007 4.29956L6.00073 9.28171V10.9955L6.00074 11V19H9.00074L9.00073 13C9.00073 12.4477 9.44845 12 10.0007 12H14.0007C14.553 12 15.0007 12.4477 15.0007 13V13.9956L15.0007 14Z" fill="black"/>
</svg>

                </svg>

                <div class="title active">홈</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Product/')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M3.99944 6.2225C3.38096 6.57985 3 7.23993 3 7.95423V16.0457C3 16.76 3.38095 17.4201 3.99944 17.7774L10.9994 21.8219C11.6185 22.1796 12.3815 22.1796 13.0006 21.8219L20.0006 17.7774C20.619 17.4201 21 16.76 21 16.0457V7.95423C21 7.23993 20.619 6.57985 20.0006 6.2225L13.0006 2.17806C12.3815 1.82037 11.6185 1.82037 10.9994 2.17806L3.99944 6.2225ZM12 3.90979L18.0017 7.37742L16 8.53393L9.99834 5.06631L12 3.90979ZM7.99945 6.22122L14.0011 9.68885L12 10.845L5.99834 7.37742L7.99945 6.22122ZM5 9.11043L11 12.5771V19.5124L5 16.0457L5 9.11043ZM19 9.11043V16.0457L13 19.5124V12.5771L19 9.11043Z" fill="black"/>
</svg>

                <div class="title active">빌려드림</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Message/')">
            <div class="menu fl-1">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M21.9977 13L4.24501 21.8775C3.43645 22.2818 2.54902 21.4909 2.85796 20.6414L5.87599 12.3418C5.95627 12.121 5.95627 11.879 5.87599 11.6583L2.85783 3.35833C2.54891 2.50879 3.43624 1.71791 4.24479 2.12214L22.2114 11.1043C22.9484 11.4727 22.9485 12.5246 22.2115 12.8931L22.0003 12.9987V13H21.9977ZM5.59498 5.03316L17.5303 11H7.76462C7.76165 10.9916 7.75863 10.9832 7.75558 10.9748L5.59498 5.03316ZM7.76462 13C7.76165 13.0084 7.75863 13.0169 7.75558 13.0253L5.59524 18.9662L17.526 13H7.76462Z" fill="black"/>
</svg>

                <div class="title active">나의 메시지</div>
            </div>
        </div>
        <%if(info!=null){%>
        
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/MyPage/?user_idx=<%=info.getUser_idx()%>')">
        <%}else{ %>
        
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/MyPage/?user_idx=0')">
        <%} %>
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
    
    const moveBack = () =>{
		window.history.back();
	}
    </script>
</body>
</html>
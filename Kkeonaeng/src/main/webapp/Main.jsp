<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>꺼냉</title>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/Kkeonaeng/css/styles.css" rel="stylesheet" />
    <link href="./css/btncss.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c6d32e9c83.js" crossorigin="anonymous"></script>
    

<style>
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

h1.title {
	background: rgb(2, 0, 36);
	background: linear-gradient(90deg, rgb(88 85 148) 0%,
		rgba(82, 127, 239, 1) 35%, rgb(91, 218, 243) 100%);
	-webkit-text-fill-color: transparent;
	-webkit-background-clip: text;
	font-family: 'TheJamsil5Bold';
}

.QuickMenuMobile {
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

.QuickMenuMobile .menu-items {
	display: flex;
	align-items: center;
	flex: 1;
}

.QuickMenuMobile .menu {
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

.log {
	position: absolute;
	top: 15px;
	right: 15px;
}

#writeBtn {
	display: inline-block;
	background-color: #5598f0;
	height: 40px;
	text-align: center;
	border-radius: 25px;
	position: fixed;
	bottom: 75px;
	right: 15px;
	transition: background-color .3s, opacity .5s, visibility .5s;
	opacity: 1;
	z-index: 1000;
	font-size: 1.1rem;
	font-weight: 900;
	color: white;
	padding-left: 0.9rem;
	padding-right: 0.7rem;
	text-decoration-line: none;
	line-height: 1.2;
	box-shadow: 1px 1px 2px 1px #cdcdcd85;
}

#writeBtn:hover {
	cursor: pointer;
	background-color: #1d64c1;
}

#writeBtn:active {
	background-color: #555;
}

#writeBtn.show {
	opacity: 50;
	visibility: visible;
}

#writeBtn>span {
	font-size: 1.67rem;
}

.card-body {
	padding: 2px;
}
.container {
    margin-bottom: 0.8rem;
}

.card-text {
	font-size: small;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.card-text {
    font-size: small;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    height: 39px;
    text-align: center;
}

.card-img-top {
	height: 100px;
	object-fit: cover;
}
</style>
</head>
<body>
	
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	List<ProductDTO> productWishList = new ProductDAO().ProductWishRank();
	List<ProductDTO> productNewList = new ProductDAO().ProductNewAll();
	
	
	%>
	<header class="py-1 bg-light border-bottom mb-4">
		<div class="container text-center" >
			<div class="text-center my-3">
				<h1 class="title fw-bolder mb-3" style="color: #527fef;">꺼냉</h1>
					
					<% if (info != null) {%>
						<a class="log" href="LogoutCon.do"><button class="btn" style="margin-left: 0px;">로그아웃</button></a>
					<%} else {%>
						<a class="log" href="./Login/"><button class="btn" style="margin-left: 0px;">로그인</button></a>
					<%}	%>

				
	
			</div>


			<div  onclick="moveUrl('./search/')" style="text-align: center;padding-bottom: 0.6rem;padding-top: 0.3rem;">
                <input type="text" placeholder="검색어를 입력하세요" style="width:90%;border-radius: 25px;padding: 0.5rem 1rem;border: 0px; box-shadow: 0 0 1px 1px #81818152; font-size: 0.9rem;" readonly >
            </div>
		</div>

	</header>
	

	<!-- Page content-->
    <div class="container">
        <div class="more1">
            <span class="pop">찜 인기 목록</span>
            <span class="more" onclick="moveUrl('./Product/?order=wish')">더보기 <a style="color : black"><i class="fa-sharp fa-solid fa-chevron-right"></i></a></span>
        </div>
        <div class="row">
            <!-- Blog entries-->
			<%for(ProductDTO dto : productWishList) { 
				String file = new FileDAO().fileSelect(new FileDTO(0,"product",dto.getP_idx()));
			%>
            <div class="col-4">
                <div class="card" style="width: 100%;" onclick="moveUrl('./Product/Detail/?p_idx=<%=dto.getP_idx()%>')">

                    <img src="/Kkeonaeng/file/<%=file %>"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text"><%=dto.getP_name() %></p>
                    </div>
                </div>
            </div>
            
            <%}%>
        </div>
    </div>


    <div class="container" style="margin-top: 1.5rem;">
        <div class="more1">
            <span class="pop">최신 대여 목록</span>
            <span class="more" onclick="moveUrl('./Product/?order=wish')">더보기 <a style="color : black"><i class="fa-sharp fa-solid fa-chevron-right"></i></a></span>
        </div>
        <div class="row">
            <!-- Blog entries-->

            <%for(ProductDTO dto : productNewList) { 
				String file = new FileDAO().fileSelect(new FileDTO(0,"product",dto.getP_idx()));
			%>
            <div class="col-4">
                <div class="card" style="width: 100%;" onclick="moveUrl('./Product/Detail/?p_idx=<%=dto.getP_idx()%>')">

                    <img src="/Kkeonaeng/file/<%=file %>"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text"><%=dto.getP_name() %></p>
                    </div>
                </div>
            </div>
            
            <%}%>
        </div>
    </div>
    
    <a href="./Product/Write/" id="writeBtn">글쓰기<span>+</span></a>
    
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
	
	</script>
</body>
</html>
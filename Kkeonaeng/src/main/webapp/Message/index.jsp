<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="com.smhrd.model.MessageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c108db6a29.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
   <link href="/Kkeonaeng/css/joinStyles.css" rel="stylesheet" />
    
    <title>꺼냉</title>
    <style>
.KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile
	{
	background-color: rgba(33, 33, 33, 0.46);
}

.KmongDialog {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	z-index: 10000;
}

.KmongDialog--fullscreen .KmongDialog__container {
	margin: 0;
	width: 100%;
	max-width: 100%;
	height: 100%;
	max-height: 100%;
}

.KmongDialog__container {
	text-align: left;
	display: inline-block;
	position: relative;
	vertical-align: middle;
}

.KmongDialog--fullscreen.KmongDialog__content {
	border-radius: 0;
}

.KmongDialog__content {
	height: 100%;
	position: relative;
	background-color: #ffffff;
	display: flex;
	flex-direction: column;
	overflow-y: auto;
	padding: 0;
}

.SearchFormModal {
	flex: 1;
	display: flex;
	flex-direction: column;
}

.SearchFormModal__header {
	border-bottom: 1px solid #e4e5ed;
	margin-top: 8px;
	padding-bottom: 8px;
}

.SearchFormModal__close {
	background-color: transparent;
	border: none;
	vertical-align: middle;
	margin-top: 2px;
}

.SearchFormModal__close-button {
	flex-shrink: 0;
	flex-basis: 15%;
	background-color: transparent;
	border: none;
	outline: none;
	width: 46px;
	height: 46px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	padding: 0;
}

.input, button, select, textarea {
	font-family: inherit;
	line-height: inherit;
}

.button, html input[type="button"], input[type="reset"], input[type="submit"]
	{
	cursor: pointer;
}

.button, select {
	text-transform: none;
}

.profile {
	margin-left: 0.8rem;
	padding-bottom: 15px;
	border-bottom: solid 1px #9595952e;
	margin-right: 0.8rem;
	padding-top: 15px;
}

.profile .nickname {
	font-size: 0.8rem;
	font-weight: bolder;
	line-height: 1.5;
	letter-spacing: -0.6px;
	color: #212529;
	margin-bottom: 5px;
	width:65%;
}

.profile .region-name {
	font-size: 0.8rem;
    line-height: 1.46;
    letter-spacing: -0.6px;
    color: grey;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    height: 39px;
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

.profileWrap{
	width: 100%;
	display: flex;
}

.msdate{
	width:35%;
	text-align : right;
	font-size: 0.76rem;
    color: grey;
	
}

.p_name{
	font-weight:600
}


    </style>
</head>

<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	if(info == null) {
		response.sendRedirect("/Kkeonaeng/Login/");
	}else{
		List<MessageDTO> messageList = new MessageDAO().myMessageList(info.getUser_idx());
		
	
	%> 
    <div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal" style="margin-bottom: 3.6rem;">
                    <nav class="navbar navbar-expand-lg" style="backgroud-color:#fff;">
						<div class="container">
			
							<a onclick="moveBack()"
								style="text-decoration-line: none;"> <i
								class="fa-solid fa-chevron-left"
								style="padding: 0px 10px 10px; color: black;"></i>
							</a> 
							<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold">내가 받은 메시지</strong>
						</div>
					</nav>
                    
                    <% for(MessageDTO message : messageList){ 
						List<MessageDTO> message_con = new MessageDAO().myMessageListNew(new MessageDTO(message.getP_idx(), info.getUser_idx(), message.getSend_idx()));
                    	String date = message.getMs_reg_date().substring(0,16);
                    %>
                    <div class="profile" onclick="moveUrl('./Detail/?p_idx=<%=message.getP_idx()%>')">
                    	<div class="p_name">
                    		<%=message.getMr_nick() %>
                    	</div>
                    	<div class="profileWrap">
                    		<div class="nickname"><%=message.getMs_nick() %></div>
                    		<div class="msdate" ><%=date %></div>
                    	</div>
                        <div class="region-name"><%=message_con.get(0).getMessage_con() %></div>
                        
                    </div>
                    <%} %>
                    
                    <div class="QuickMenuMobile">
                        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Main.jsp')">
                            <div class="menu fl-1">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                        d="M4.00074 11V20C4.00074 20.5522 4.44845 21 5.00074 21H10.0007C10.553 21 11.0007 20.5522 11.0007 20V14H13.0007V20C13.0007 20.5522 13.4485 21 14.0007 21H19.0007C19.553 21 20.0007 20.5522 20.0007 20V11H21.8159C22.284 11 22.4954 10.4143 22.1353 10.1153L13.2784 2.76087C12.5377 2.14579 11.4638 2.14579 10.7231 2.76087L1.86615 10.1153C1.50603 10.4143 1.71748 11 2.18557 11H4.00074ZM15.0007 14V19H18.0007L18.0007 9.2817L12.0007 4.29956L6.00073 9.28171V10.9955L6.00074 11V19H9.00074L9.00073 13C9.00073 12.4477 9.44845 12 10.0007 12H14.0007C14.553 12 15.0007 12.4477 15.0007 13V13.9956L15.0007 14Z"
                                        fill="black" />
                                </svg>
                                </svg>

                                <div class="title active">홈</div>
                            </div>
                        </div>
                        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Product/')">
                            <div class="menu fl-1">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                        d="M3.99944 6.2225C3.38096 6.57985 3 7.23993 3 7.95423V16.0457C3 16.76 3.38095 17.4201 3.99944 17.7774L10.9994 21.8219C11.6185 22.1796 12.3815 22.1796 13.0006 21.8219L20.0006 17.7774C20.619 17.4201 21 16.76 21 16.0457V7.95423C21 7.23993 20.619 6.57985 20.0006 6.2225L13.0006 2.17806C12.3815 1.82037 11.6185 1.82037 10.9994 2.17806L3.99944 6.2225ZM12 3.90979L18.0017 7.37742L16 8.53393L9.99834 5.06631L12 3.90979ZM7.99945 6.22122L14.0011 9.68885L12 10.845L5.99834 7.37742L7.99945 6.22122ZM5 9.11043L11 12.5771V19.5124L5 16.0457L5 9.11043ZM19 9.11043V16.0457L13 19.5124V12.5771L19 9.11043Z"
                                        fill="black" />
                                </svg>

                                <div class="title active">빌려드림</div>
                            </div>
                        </div>
                        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Message/')">
                            <div class="menu fl-1">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                        d="M21.9977 13L4.24501 21.8775C3.43645 22.2818 2.54902 21.4909 2.85796 20.6414L5.87599 12.3418C5.95627 12.121 5.95627 11.879 5.87599 11.6583L2.85783 3.35833C2.54891 2.50879 3.43624 1.71791 4.24479 2.12214L22.2114 11.1043C22.9484 11.4727 22.9485 12.5246 22.2115 12.8931L22.0003 12.9987V13H21.9977ZM5.59498 5.03316L17.5303 11H7.76462C7.76165 10.9916 7.75863 10.9832 7.75558 10.9748L5.59498 5.03316ZM7.76462 13C7.76165 13.0084 7.75863 13.0169 7.75558 13.0253L5.59524 18.9662L17.526 13H7.76462Z"
                                        fill="black" />
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
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
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
                </div>

            </div>
        </div>
	<%} %>
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
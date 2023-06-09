<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="com.smhrd.model.RentDAO"%>
<%@page import="com.smhrd.model.RentDTO"%>
<%@page import="com.smhrd.model.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	overflow-x: hidden;
	overflow-y: auto;
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
	/* height: 100%; */
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

.button {
	overflow: visible;
}

.content {
	font-size: 15px;
	margin-left: 10px;
}

.zzzz {
	padding-bottom: 15px;
	border-bottom: 1px solid #C0C0C0;
}

.notbad {
	padding-left: 20px;
	padding-right: 20px;
}

.bbttnn {
	width: 105px;
    height: 35px;
    background-color: #cbcbcb4d;
    border-radius: 5px;
    font-weight: bold;
    border: 0px solid #C0C0C0;
    box-shadow: 0 0 3px -1px;
}

.bbttnn:focus {
	color: #527fef;
	border-color: #527fef;
	background-color: white;
	border: 2px solid;
}

.good {
	padding-left: 20px;
}

.date {
	padding-right: 17px;
	color: #808080;
}

.cancelBtn {
	position: absolute;
    right: 20px;
    background: #ff0000b3;
    color: white;
}

.returnBtn {
	position: absolute;
    left: 135px;
}

.noneBtn {
	color: white!important;
    background: #b5b5b5!important;;
}
</style>
</head>
<body>
	<%
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		List<ReservationDTO> rvList = new ReservationDAO().reservationUserList(p_idx);
		int user_idx = 0;
		String nick = "";
		UserDTO info = (UserDTO) session.getAttribute("info");
		if(info != null){
			user_idx = info.getUser_idx();
			nick = info.getNick();
		}
		
	
	%>

	<div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <nav class="navbar navbar-expand-lg" style="backgroud-color:#fff;">
		<div class="container">
			
				<a onclick="moveBack()"
					style="text-decoration-line: none;"> <i
					class="fa-solid fa-chevron-left"
					style="padding: 0px 10px 10px; color: black;"></i>
				</a> 
				<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold">예약자 목록</strong>
		</div>
	</nav>

                    
                    </div>
                </div>
                <%
                for(ReservationDTO rv : rvList){
                	String[] startData = rv.getRv_start_date().split(" ");
                	String[] endData = rv.getRv_end_date().split(" ");
                	
                	RentDTO rtdto = new RentDAO().renterStatuesInfo(new RentDTO(p_idx,rv.getUser_idx()));%>
                	<!--  대여시작,예약취소 활성화 r_idx == 0 -->
                	
                <div class="zzzz">
                    <div class="bad">
                        <p class="good">
                            <span class="date">일정</span>
                            <span class="content"><%=startData[0] %>~<%=endData[0] %></span>
                        </p>
                        <p class="good">
                            <span class="date1" style="color: #808080;">예약자</span>
                            <span class="content"><%=rv.getNick() %></span>
                        </p>
                    </div>
                    <div class="notbad">
                    	<% if(rtdto == null){
                    	
                    	%>
                    	
	                	<button onclick="rentStart(<%=rv.getRv_idx()%>)" class="bbttnn" type="button">대여시작</button>
	                    <button class="bbttnn returnBtn noneBtn" type="button">반납완료</button>
	                    <button onclick="reservationCancel(<%=rv.getRv_idx()%>)" class="bbttnn cancelBtn" type="button">예약취소</button>
	                	<!-- 반납완료 활성화 return_chk == Y -->
	                	<% }else if(rtdto.getReturn_chk().equals("Y")){
	                	System.out.println(rtdto.toString());%>
	                	<button class="bbttnn noneBtn" type="button">대여중</button>
	                    <button onclick="returnFinish(<%=rv.getUser_idx()%>,'<%=rv.getNick()%>',<%=p_idx%>,<%=user_idx%>,'<%=nick%>')" class="bbttnn returnBtn" type="button">반납완료</button>
	                    <button class="bbttnn cancelBtn noneBtn" type="button">예약취소</button>
	                	<!-- 전부 다 비활성화 대여시작=> 대여중 -->
	                	<% }else{
	                	
	                	System.out.println(rtdto.toString());
	                	%>
	                	<button class="bbttnn noneBtn noneBtn" type="button">대여중</button>
	                    <button class="bbttnn returnBtn noneBtn" type="button">반납완료</button>
	                    <button class="bbttnn cancelBtn noneBtn" type="button">예약취소</button>
	                <% }%>
                    </div>
                </div>
                <%} %>

            </div>
        </div>
    </div>
	<script type="text/javascript">
	
	const moveBack = () =>{
		window.history.back();
	}
	// 예약취소
	function reservationCancel(rv_idx){
		if(confirm('예약을 취소하시겠습니까?')){
			location.href = 'ReservationDeleteCon.do?p_idx=<%=p_idx%>&rv_idx='+rv_idx;
		}
		
	}
	
	// 대여시작
	function rentStart(rv_idx){
		if(confirm('대여를 시작하시겠습니까?')){
			location.href = 'RentStartCon.do?rv_idx='+rv_idx+'&p_idx='+<%=p_idx%>;
		}
		
	}
	
	// 대여시작
	function returnFinish(user_idx,user_nick,p_idx,rp_idx,rp_nick){
		location.href = `/Kkeonaeng/Rent_finish/?user_idx=${user_idx}&user_nick=${user_nick}&p_idx=${p_idx}&rp_idx=${rp_idx}&rp_nick=${rp_nick}`;
	}
	
	</script>
</body>
</html>
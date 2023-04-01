<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./css/styles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c6d32e9c83.js"
	crossorigin="anonymous"></script>
<style>
div#calAndTable {
	display: flex;
	margin: 0 auto;
}

div#calWrapper {
	width: 370px;
	height: 640px;
	margin: 0 auto;
}

div#upper_menu {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid black;
	display: flex;
	justify-content: space-evenly;
}

div#period {
	border: 1px solid black;
	width: 100px;
	height: 25px;
	text-align: right;
	background-color: rgb(223, 219, 219);
	margin-top: 12.5px;
}

input[type="date"] {
	width: 123px;
	margin-top: 10px;
	margin-left: 10px;
	margin-bottom: 5px;
	border: none;
	background: #c5c5c557;
	padding: 7px;
	border-radius: 25px;
	font-size: 15px;
	margin-right: 9px;
}

div#betweenDate {
	margin-top: 12.5px;
}

button#searchButton {
	width: 70px;
	height: 25px;
	margin-top: 12.5px;
	border-radius: 5px;
	font-size: 0.92em;
}

button {
	border: 0;
	box-shadow: 1px 1px 5px 1px #9f9f9f80;
}

div#dateTitle {
	font-size: 1.5rem;
	font-weight: 550;
	text-align: center;
	margin-top: 20px;
}

div#betweenDate {
	margin-left: -20px;
	margin-right: -20px;
}

div#calendar {
	width: 90%;
	height: 350px;
	margin: 0 auto;
	margin-top: 20px;
}

div#pnButtonWrapper {
	width: 500px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

div#pnButtonWrapper button {
	width: 70px;
	height: 30px;
}

div#selectedDateWrapper {
	text-align: center;
}

div#submitButtonWrapper {
	display: flex;
	flex-direction: row-reverse;
}

#submitButtonWrapper button {
	width: 106px;
	height: 38px;
	font-size: 1.1rem;
	font-weight: 550;
	margin-right: 53px;
	margin-top: 6px;
	color: white;
	background-color: rgb(82, 127, 239);
	border-radius: 0.5em;
	border-width: 1px;
}

td {
	width: calc(100%/ 7);
	font-weight: 2000;
	height: 45px;
}

td.sun {
	color: red;
}

td.sat {
	color: blue;
}

table {
	width: 100%;
	height: 100%;
	text-align: center;
}

tr {
	border: 3;
}

tr:first-child {
	height: 45px;
	background-color: whitesmoke;
}

div#tableWrapper {
	margin: 0 auto;
	width: 400px;
	height: 700px;
	overflow: auto;
}

div.table {
	display: flex;
}

div.table div {
	width: calc(100%/ 3);
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-bottom: 1px solid white;
}

div.table div:nth-child(2) {
	border-left: 3px solid white;
	border-right: 3px solid white;
}

div.table:nth-child(2n) div {
	background-color: rgb(159, 206, 206);
}

div.table:nth-child(2n+1) div {
	background-color: rgb(228, 240, 240);
}

div.table:first-child div {
	background-color: rgb(66, 139, 168);
	color: white;
}

div.table:first-child div {
	height: 50px;
	line-height: 50px;
	font-size: 1.1rem;
}

h1 {
	text-align: center;
	margin-top: 20px;
}

img {
	width: 40px;
	height: 40px;
}

div#iconWrapper {
	width: 200px;
	margin: 0 auto;
	margin-bottom: 20px;
}

.caret {
	position: absolute;
	inline-size: 50%;
	padding-bottom: 1%;
}

.caret1 {
	position: absolute;
	inline-size: 145%;
	padding-bottom: 1%;
}
</style>
</head>
<body>
	<%
	String user_idx = request.getParameter("user_idx");
	String p_idx = request.getParameter("p_idx");

	if (user_idx.equals("0")) {
		response.sendRedirect("/Kkeonaeng/Login/");
	}
	%>
	<form name="formData" action="ReservationCon.do" method="post">
		<input type="hidden" name="user_idx" id="user_idx"
			value="<%=user_idx%>"> <input type="hidden" name="p_idx"
			id="p_idx" value="<%=p_idx%>"> <input type="hidden"
			name="rv_start_date" id="rv_start_date"> <input type="hidden"
			name="rv_end_date" id="rv_end_date">

	</form>
	<div id="iconWrapper"></div>
	<div id="calAndTable">
		<!-- 캘린더 전체 Wrapper -->
		<div id="calWrapper">

			<!-- 상단 날짜 조회 메뉴 -->
			<div id="upper_menu">

				<input type="date" id="firstDate" value="">
				<div id="betweenDate">~</div>
				<input type="date" id="secondDate" value="">
				<button id="searchButton">조회</button>
			</div>

			<!-- 달력 상단 년, 월 -->
			<div class="container">
				<img class="caret" src="small-caret-left.svg" alt=""> <img
					class="caret1" src="small-caret-right.svg" alt="">
				<div id="dateTitle"></div>


			</div>


			<!-- 달력 -->
			<div id="calendar">
				<table>
					<tr>
						<td class="sun">일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td class="sat">토</td>
					</tr>
					<tr>
						<td class="sun"></td>
						<td class="mon"></td>
						<td class="tue"></td>
						<td class="wed"></td>
						<td class="thu"></td>
						<td class="fri"></td>
						<td class="sat"></td>
					</tr>
					<tr>
						<td class="sun"></td>
						<td class="mon"></td>
						<td class="tue"></td>
						<td class="wed"></td>
						<td class="thu"></td>
						<td class="fri"></td>
						<td class="sat"></td>
					</tr>
					<tr>
						<td class="sun"></td>
						<td class="mon"></td>
						<td class="tue"></td>
						<td class="wed"></td>
						<td class="thu"></td>
						<td class="fri"></td>
						<td class="sat"></td>
					</tr>
					<tr>
						<td class="sun"></td>
						<td class="mon"></td>
						<td class="tue"></td>
						<td class="wed"></td>
						<td class="thu"></td>
						<td class="fri"></td>
						<td class="sat"></td>
					</tr>
					<tr>
						<td class="sun"></td>
						<td class="mon"></td>
						<td class="tue"></td>
						<td class="wed"></td>
						<td class="thu"></td>
						<td class="fri"></td>
						<td class="sat"></td>
					</tr>
					<tr>
						<td class="sun"></td>
						<td class="mon"></td>
						<td class="tue"></td>
						<td class="wed"></td>
						<td class="thu"></td>
						<td class="fri"></td>
						<td class="sat"></td>
					</tr>
				</table>
			</div>



			<!-- 선택된 날짜를 표기하는 부분 -->
			<div id="selectedDateWrapper">
				<div>선택된 일자</div>
				<div>
					<span id="yearspan"></span>년 <span id="monthspan"></span>월 <span
						id="datespan"></span>일 <span id="dayspan"></span>요일
				</div>
				<div>선택된 일자</div>
				<div>
					<span id="yearspan2"></span>년 <span id="monthspan2"></span>월 <span
						id="datespan2"></span>일 <span id="dayspan2"></span>요일
				</div>
			</div>

			<!-- 적용 버튼 -->
			<div id="submitButtonWrapper">
				<button id="submit" onclick="reservation()">예약하기</button>
				<a href="../Detail/?p_idx=<%=p_idx%>"><button id="returnBtn"
						onclick="()" style="background-color: rgb(139, 139, 139);">나가기</button></a>
			</div>

		</div>
	</div>

	<script src="./callender.js"></script>
	<script type="text/javascript">
	
		const reservation = () => {
			
			var rv_start_date = document.getElementById("rv_start_date").value;	
	        var rv_end_date = document.getElementById("rv_end_date").value;
	          
	        	if (rv_start_date == "") {
	            	alert("시작 날짜를 입력해주세요.");
	            	return;
	   			}
	          	if (rv_end_date == "") {
	             	alert("끝나는 날짜를 입력해주세요.");
	              	return;
	           	}
		
			alert("예약이 완료되었습니다.");
			
			let formData = document.formData;
			formData.submit();
		}	
		</script>
</body>
</html>
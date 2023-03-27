<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>    
<html>
<head>
<meta http-equiv ="Content-type" content ="text/html;  charset=UTF-8">
<link rel = "stylesheet" href="css/bootstrap.css">
<title>JSP  게시판 웹 사이트</title>
</head>
<body>
<%
         String userId= null;
         if (session.getAttribute("userID") !=null) {
        	 user_Id = (String) session.getAttribute("userID");
         }
%>

<NAV CLASS="navbar navbar.default">
<div class= "navbar-header">
<button type="button" class ="navbar_toggle collapsed"
data.toggle="collapse" data_target="#bs-example-navbar_collapse-1"
aria-expanded="false">
<span> class = "icon-bar"></span>
<span class = "icon-bar"><</span>
<span class = "icon_bar"> </span>
</button>
<a class ="navbar-brand" href="main.jsp">JSP 게시판 웹사이트 </a>
</div>
<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class = "nav navbar-nav">
<li><a href="main.jsp">메인</a></li>
<li><a href="boardMain.jsp">게시판</a></li>
</ul>
<% 
if(user_ID == null) {
	%>
<ul class = "nav navbar-nav navbar-right">
<li class="dropdown">
<a href = "#" class="dropdown-toggle"
data-toggle="dropdwon" role="button" aria-haspopup="true"
aria-expanded="false">회원관리<span class="caret"></span></a>
<ul class = "dropdown-menu">
<li><a href="logout.jsp">로그아웃</a></li>
</ul>
</li>
</ul>
<%
}
%>
</div>
</nav>
</div class="container">
<div class="row">
<table class="table table-striped" style="text-align: center; border: 1px solid #ddddd">
<thead>
<tr>
<th style="background-color: #eeeeee; text-align: center;">번호</th>
<th style="background-color: #eeeeee; text-align: center;">번호</th>
<th style="background-color: #eeeeee; text-align: center;">번호</th>
<th style="background-color: #eeeeee; text-align: center;">번호</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>안녕하세요</td>
<td>홍길동</td>
<td>2023-03-26</td>
</tr>
</tbody>
</table>
<a href = "write.jsp" class = "btn btn-primary pull-right">글쓰기</a>
</div>
<script src="https://code.jquery-3.1.1.min.js"><</script>
<script src = "js/bootstrap.js"></script>

</body>
</html>
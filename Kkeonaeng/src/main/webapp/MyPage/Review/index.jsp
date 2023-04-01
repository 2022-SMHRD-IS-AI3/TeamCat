<%@page import="com.smhrd.model.UserDAO"%>
<%@page import="com.smhrd.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>꺼냉</title>
    <script src="https://kit.fontawesome.com/c108db6a29.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
   <link href="/Kkeonaeng/css/joinStyles.css" rel="stylesheet" />
    <style>
        .KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile {
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
            /* box-shadow: 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 6px 16px 0 rgba(0, 0, 0, 0.08), 0 9px 28px 8px rgba(0, 0, 0, 0.05); */
            display: flex;
            flex-direction: column;
            /* overflow-y: auto; */
            padding: 0;
        }

        .SearchFormModal {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .SearchFormModal__header {
            /* flex-shrink: 0;
            height: 47px; */
            /* border-bottom: 1px solid #e4e5ed; */
            /* display: flex; */
            margin-top: 20px;
            padding-bottom: 15px;
        }

        .SearchFormModal__close {
            background-color: transparent;
            border: none;
            vertical-align: middle;
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

        .input,
        button,
        select,
        textarea {
            font-family: inherit;
            line-height: inherit;
        }

        .button,
        html input[type="button"],
        input[type="reset"],
        input[type="submit"] {

            cursor: pointer;
        }

        .button,
        select {
            text-transform: none;
        }

        .button {
            overflow: visible;
        }

        .review {
            width: 121px;
            border-bottom: 1px solid #9595952e;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .review1 {
            width: 121px;

            border-bottom: 1px solid #9595952e;
            text-align: center;
            display: inline-block;
            font-size: 14px;
        }

        .review2 {
            width: 121px;

            border-bottom: 1px solid #9595952e;
            text-align: center;
            display: inline-block;
            font-size: 14px;
        }

        .sos {
            width: 124px;
            height: 45px;
            border: none;
            background-color: transparent;
            color: gray;
        }

        .sos:focus {
            border-bottom: 3px solid gray;
            box-sizing: border-box;
            color: black;
            font-size: 15px;
            font-weight: bold;
        }

       
        .profile{
            margin-left: 0.8rem;
            padding-bottom: 5px;
            border-bottom: solid 1px #9595952e;
            margin-right: 0.8rem;
            padding-top: 10px;
        }

        .profile .nickname {
        	padding-left: 0.6rem;
            font-size: 1rem;
            font-weight: bolder;
            line-height: 1.5;
            letter-spacing: -0.6px;
            color: #212529;
            margin-bottom: 5px;
        }

        .profile .region-name {
            font-size: 0.8rem;
            line-height: 1.46;
            letter-spacing: -0.6px;
            color: grey;
        }
        .comment{
            font-size: 18px; 
            margin-right: 2px;
        }
        
        .selection {
            padding: 11px;
		    background: #f5f5f5;
		    border-radius: 9px;	
		    font-size: 0.82rem;
        }
    </style>
</head>

<body>

	<%
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		UserDTO info = new UserDAO().userInfo(user_idx);
		
		if(info == null){
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
			List<ReviewDTO> review_list =	new ReviewDAO().myReviewList(info.getUser_idx());
		
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
				<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold">거래 후기</strong>
		</div>
	</nav>
                     
                    
                    </div>
                    
                    
                    <div>
                        <div class="review">
                            <button onclick="changeFlag('all')" class="sos" type="button">전체후기</button>
                        </div>
                        <div class="review1">
                            <button onclick="changeFlag('G')" class="sos" type="button">좋아요</button>
                        </div>
                        <div class="review2">
                            <button onclick="changeFlag('B')" class="sos" type="button">별로에요</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="review-cnt" style="padding-bottom: 5px; margin-left: 0.8rem;">
                        <p style="font-size: 17px; font-weight: bold;">후기 <%=review_list.size() %>개</p>
                    </div>
                    <div id="reviewList"></div>
                </div>
            </div>
        </div>
    </div>
    
    <input onchange="reviewListSet()" name="thumbsChk" id="thumbsChk" type="text" value="all">
	<script type="text/javascript">
		
		let reviewHtml = '';
		let reviewlistData = [];
		const HtmlPrint = () => {
			reviewHtml = '';
			for(let i=0; i < reviewlistData.length;i++){
				reviewHtml += `
					<div class="profile">
		                <div class="nickname">${reviewlistData[i].nick}</div>
		                <div class="plan_filter">
		                    <div class="selection">
								${reviewlistData[i].review}
		                    </div>
		                </div>
		            </div>
		        `;
			}
			document.getElementById('reviewList').innerHTML = reviewHtml;
		}
		let reviewlist = [];
		<% for(ReviewDTO rv : review_list){	%>
			reviewlist.push({nick:"<%=rv.getRp_nick()%>",flag:"<%=rv.getThumbs_flag()%>",review:"<%=rv.getRv_contents()%>"});
	
		<% }%>
		
		const reviewListSet = () =>{
			reviewlistData = [];
			let thumbsChk = document.getElementById('thumbsChk').value;
			for(let i=0; i < reviewlist.length;i++){
				
				if(thumbsChk == 'all'){
					reviewlistData = reviewlist;
				}else{
					if(reviewlist[i].flag == thumbsChk){
						reviewlistData.push(reviewlist[i]);
					}
				}
			}
			HtmlPrint();
		}
		reviewListSet();
		
		function changeFlag(v) {
			document.getElementById('thumbsChk').value = v;
			reviewListSet();
		}
		
		const moveBack = () =>{
    		window.history.back();
    	}
		
		
	</script>
	<% }%>

</body>
</html>
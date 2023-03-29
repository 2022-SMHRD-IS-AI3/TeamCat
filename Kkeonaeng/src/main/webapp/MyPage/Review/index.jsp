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
    <title>Document</title>
    <script src="https://kit.fontawesome.com/c108db6a29.js" crossorigin="anonymous"></script>
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

       
        #profile{
            margin-left: 0.8rem;
            padding-bottom: 5px;
            border-bottom: solid 1px #9595952e;
            margin-right: 0.8rem;
            padding-top: 10px;
        }

        #profile #nickname {
            font-size: 1rem;
            font-weight: bolder;
            line-height: 1.5;
            letter-spacing: -0.6px;
            color: #212529;
            margin-bottom: 5px;
        }

        #profile #region-name {
            font-size: 0.8rem;
            line-height: 1.46;
            letter-spacing: -0.6px;
            color: grey;
        }
        .comment{
            font-size: 18px; 
            margin-right: 2px;
        }
    </style>
</head>

<body>

	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		if(info == null){
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
			List<ReviewDTO> review_list =	new ReviewDAO().myReviewList(info.getUser_idx());
		
	%>
    <div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">
                        <button type="button" class="SearchFormModal__close">
                            <img src="small-caret-left.svg" alt="" style="width: 30px;">
                        </button>
                        <span style="font-size: 18px; font-weight: bold;">
                            거래 후기
                        </span>
                    </div>
                    <div>
                        <div class="review">
                            <button class="sos" type="button">전체후기</button>
                        </div>
                        <div class="review1">
                            <button class="sos" type="button">좋아요</button>
                        </div>
                        <div class="review2">
                            <button class="sos" type="button">별로에요</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="aaaa" style="padding-bottom: 5px; margin-left: 0.8rem;">
                        <p style="font-size: 17px; font-weight: bold;">후기 3개</p>
                    </div>
                    <div id="profile">
                        <div id="nickname">꺼냉좋아</div>
                        <div id="region-name">광주광역시 동구 동명동</div>
                        <div "plan_filter">
                            <div class="selection">
                               <p class="comment">좋은 물품 대여해주셔서감사합니다</p>
                            </div>
                        </div>
                    </div>
                    <div id="profile">
                        <div id="nickname">화가많은사람</div>
                        <div id="region-name">광주광역시 동구 금남로5가</div>
                        <div "plan_filter">
                            <div class="selection">
                               <p style="font-size: 18px;">덕분에 컴퓨터 잘 부쉈습니다</p>
                            </div>
                        </div>
                    </div>
                    <div id="profile">
                        <div id="nickname">프로젝트하다미친사람</div>
                        <div id="region-name">광주광역시 동구 대인동</div>
                        <div "plan_filter">
                            <div class="selection">
                               <p style="font-size: 18px;">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
		let reviewlist = [];
		<% for(ReviewDTO rv : review_list){	%>
			reviewlist.push({nick:"<%=rv.getRp_nick()%>",flag:"<%=rv.getThumbs_flag()%>",review:"<%=rv.getThumbs_flag()%>"});
	
		<% }%>
		
		console.log(reviewlist)
	</script>
	<% }%>

</body>
</html>
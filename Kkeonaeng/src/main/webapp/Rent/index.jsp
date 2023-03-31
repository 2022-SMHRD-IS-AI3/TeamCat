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

        .SearchFormModal__input {
            flex: 1;
            height: 46px;
            line-height: 1.44;
            font-size: 17px;

            outline: none;
            color: #303441;
            width: 325px;
        }

        .SearchFormModal__clear-button {
            position: absolute;
            right: 2%;
            background-color: transparent;
            border: none;
            height: 52px;
        }

        ._4a1tzy0 {
            /* margin: 0 -1rem; */
            position: relative;
            height: 607px;
        }

        ._4a1tzy1 {
            display: flex;
            flex-wrap: wrap;
        }

        .korcsc5 {
            list-style: none;
            padding: 0;
            margin: 0;
            padding-left: 25px;
            padding-right: 25px;
        }

        ._4a1tzy2 {
            width: 100%;
            box-sizing: border-box;
        }

        ._1o1a6ke0 {
            transition: background-color .15s;
            width: 100%;
            background-color: var(--seed-semantic-color-paper-default);

            box-sizing: border-box;
            display: flex;
            align-items: flex-start;
            overflow: hidden;
            text-decoration: none;
            cursor: pointer;
            border-bottom: 1px solid #9595952e;
            padding-left: 0;
            padding-right: 0;
            padding-top: 20px;
        }

        ._1o1a6ke2 {
            margin-right: 1rem;
        }

        ._1o1a6ke1 {
            width: 4rem;
            height: 4rem;
            border-radius: 6.25rem;
            overflow: hidden;
        }

        .qudd1g9 {
            opacity: 1;
            transition: .2s;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .qudd1g0 {
            position: relative;
        }

        .qudd1g0::before {
            content: "";
            position: absolute;
            border: .0625rem solid var(--seed-scale-color-gray-alpha-50);
            border-radius: inherit;
            z-index: 1;
        }

        ._1o1a6ke3,
        ._1o1a6ke4 {
            overflow: hidden;
            display: flex;
        }

        ._1o1a6ke3 {
            flex: 1 1;
            flex-direction: column;
            align-items: flex-start;
        }

        ._1o1a6ke4 {
            align-items: center;
            white-space: nowrap;
            width: 100%;
        }

        ._1o1a6ke5 {
            font-weight: 700;
            line-height: 1.36;
            font-size: 1rem;
            color: var(--seed-scale-color-gray-900);
            overflow: hidden;
            text-overflow: ellipsis;
            color: #212124;
        }

        ._1o1a6ke6 {
            line-height: 1.5;
            font-size: .813rem;
            margin-left: 0.25rem;
            color: #868B94;
        }

        ._1o1a6ke7 {
            line-height: 1.4;
            font-size: .875rem;
            color: var(--seed-scale-color-gray-900);
            margin: 0.125rem 0 0;
            overflow: hidden;
            text-overflow: ellipsis;
            word-break: break-all;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            color: #868B94;
        }

        ._1o1a6ke8 {
            line-height: 1.3;
            margin: 0.25rem 0 0;
            color: #212124;
            font-weight: 700;
        }

        .row>* {
            flex-shrink: 0;
            max-width: 100%;
            padding-right: calc(var(--bs-gutter-x) * 0.5);
            padding-left: calc(var(--bs-gutter-x) * 0.5);
            margin-top: var(--bs-gutter-y);
        }

        .wish {
            align-self: self-end;
        }
    </style>
</head>

<body>
    <div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <nav class="navbar navbar-expand-lg" style="backgroud-color:#fff;">
		<div class="container">
			
				<a href="/Kkeonaeng/MyPage/index.jsp"
					style="text-decoration-line: none;"> <i
					class="fa-solid fa-chevron-left"
					style="padding: 0px 10px 10px; color: black;"></i>
				</a> 
				<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold">대여 목록</strong>
		</div>
	</nav>


                    <div class="_4a1tzy0">
                        <ul class="_4a1tzy1 korcsc5">
                            <li class="_4a1tzy2">
                                <a class="smb-list-item _1o1a6ke0 korcsc4" href="">
                                    <div class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
                                        <div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">

                                            <img class="thumbnail-image qudd1g9"
                                                src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202201%2F2db4ee69075c401b523dc8612bfb1fcdac0634428e7e2d078cf66608386fb2b7.webp%3Fq%3D95%26s%3D1440x1440%26t%3Dinside&type=a340"
                                                alt="">
                                        </div>
                                    </div>

                                    <div class="smb-list-item-content _1o1a6ke3">
                                        <div class="smb-list-item-name-wrapper _1o1a6ke4">
                                            <span class="smb-list-item-name _1o1a6ke5">우산 대여 해드려요</span>
                                        </div>
                                        <span class="smb-list-item-description _1o1a6ke7">광주광역시 동구 금남로5가</span>
                                        <span class="smb-list-item-infos _1o1a6ke8">3,000원(일)</span>
                                        <span class="wish">
                                            <img src="heart.svg" alt="">
                                            <span style="vertical-align: top; font-weight: 600;">132</span>
                                        </span>
                                    </div>
                                </a>

                            </li>

                            <li class="_4a1tzy2">
                                <a class="smb-list-item _1o1a6ke0 korcsc4" href="">
                                    <div class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
                                        <div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">

                                            <img class="thumbnail-image qudd1g9"
                                                src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20230110_201%2F16733487937734NFOe_JPEG%2F651477601108258_977278658.jpg&type=a340"
                                                alt="">
                                        </div>
                                    </div>

                                    <div class="smb-list-item-content _1o1a6ke3">
                                        <div class="smb-list-item-name-wrapper _1o1a6ke4">
                                            <span class="smb-list-item-name _1o1a6ke5">텐트 대여 해드립니당</span>

                                        </div>
                                        <span class="smb-list-item-description _1o1a6ke7">광주광역시 남구 금호동</span>
                                        <span class="smb-list-item-infos _1o1a6ke8">10,000원(일) </span>
                                        <span class="wish">
                                            <img src="heart.svg" alt="">
                                            <span style="vertical-align: top; font-weight: 600;">132</span>
                                        </span>
                                    </div>
                                </a>

                            </li>

                            <li class="_4a1tzy2">
                                <a class="smb-list-item _1o1a6ke0 korcsc4" href="">
                                    <div class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
                                        <div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">

                                            <img class="thumbnail-image qudd1g9"
                                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2dcI9889P21zW5OMojwzIHSItYocRXhRPb8jk4MHsiCwjkAQFGvQ69UpMdvhMQ5DJIgA&usqp=CAU">
                                        </div>
                                    </div>

                                    <div class="smb-list-item-content _1o1a6ke3">
                                        <div class="smb-list-item-name-wrapper _1o1a6ke4">
                                            <span class="smb-list-item-name _1o1a6ke5">유아용 전동 자동차 빌려드려요</span>

                                        </div>
                                        <span class="smb-list-item-description _1o1a6ke7">광주광역시 동구 동명동</span>
                                        <span class="smb-list-item-infos _1o1a6ke8">5,000원(일)</span>
                                        <span class="wish">
                                            <img src="heart.svg" alt="">
                                            <span style="vertical-align: top; font-weight: 600;">132</span>
                                        </span>
                                    </div>
                                </a>

                            </li>

                            <li class="_4a1tzy2">
                                <a class="smb-list-item _1o1a6ke0 korcsc4" href="">
                                    <div class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
                                        <div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">

                                            <img class="thumbnail-image qudd1g9"
                                                src="https://shopping-phinf.pstatic.net/main_2610218/26102180525.20210223122701.jpg?type=f300"
                                                alt="">
                                        </div>
                                    </div>

                                    <div class="smb-list-item-content _1o1a6ke3">
                                        <div class="smb-list-item-name-wrapper _1o1a6ke4">
                                            <span class="smb-list-item-name _1o1a6ke5">스캐너 빌려드립니다</span>

                                        </div>
                                        <span class="smb-list-item-description _1o1a6ke7">광주광역시 동구 금남로4가</span>
                                        <span class="smb-list-item-infos _1o1a6ke8">2,000원(일)</span>
                                        <span class="wish">
                                            <img src="heart.svg" alt="">
                                            <span style="vertical-align: top; font-weight: 600;">132</span>
                                        </span>
                                    </div>
                                </a>

                            </li>



                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>

</body>

</html>
</head>
<body>
	대여내역페이지
</body>
</html>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        }

        ._4a1tzy2 {
            width: 100%;
            box-sizing: border-box;
            background-color: whitesmoke;
        }

        /* ._4a1tzy2::after{
            content: "";
            height: .0625rem;
            display: block;
            background-color: var(--seed-semantic-color-divider-2);
            margin: 0.5rem 1rem;
        } */

        ._1o1a6ke0 {
            transition: background-color .15s;
            width: 100%;
            background-color: var(--seed-semantic-color-paper-default);
            padding: 1rem;
            box-sizing: border-box;
            display: flex;
            align-items: flex-start;
            overflow: hidden;
            text-decoration: none;
            cursor: pointer;
            border-bottom: 1px solid #9595952e;
            padding-left: 10;
            padding-right: 0;
        }

        ._1o1a6ke2 {
            margin-right: 1rem;
        }

        ._1o1a6ke1 {
            width: 5rem;
            height: 5rem;
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
            font-weight: 500;
            padding-top: 20px;
        }

        .row>* {
            flex-shrink: 0;
            max-width: 100%;
            padding-right: calc(var(--bs-gutter-x) * 0.5);
            padding-left: calc(var(--bs-gutter-x) * 0.5);
            margin-top: var(--bs-gutter-y);
        }

        .yes:hover {
            background-color: rgb(82 127 239);
            color: white;
        }

        .no:hover {
            background-color: rgb(82 127 239);
            color: white;
        }
    </style>
</head>

<body>
	
	 <%
    	int user_nick = Integer.parseInt(request.getParameter("user_nick"));
    	int rp_nick = Integer.parseInt(request.getParameter("rp_nick"));
    	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
    	
    	ProductDAO dao = new ProductDAO();
    	ProductDTO product = dao.ProductDetail(p_idx);
    %>
    <div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">
                        <button type="button" class="SearchFormModal__close">
                            <img src="small-caret-left.svg" alt="" style="width: 32px;">
                        </button>
                        <span style="font-size: 17px; font-weight: bold; position: absolute; top: 14px; left: 40px;">
                            반납완료
                        </span>
                    </div>
                </div>

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
                                        <span class="smb-list-item-name _1o1a6ke5"><%=product.getP_name() %></span>
                                    </div>
                                    <span class="smb-list-item-infos _1o1a6ke8"><%=rp_nick %></span>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <br>
                    <br>
                    <span style="position: absolute; left: 35px;"><%=user_nick %>님이 반납을 완료하셨나요?</span>
                    <br>
                    <br>
                    <br>

                    <span style="position: absolute; left: 60px;">
                        <button onclick="/Kkeonaeng/Rent_finish/Review/"type="button" class="yes" style="width: 100px; height: 50px; font-size: 15px; border: none;
                        border-radius: 10px;">예</button>
                        <button onclick="moveBack()" type="button" class="no"
                            style="width: 100px; height: 50px; font-size: 15px; margin-left: 40px; border: none; border-radius: 10px;">아니요</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	
    	const moveBack = () =>{
    		window.history.back();
    	}
    
    </script>
     
</body>
</html>
<%@page import="com.smhrd.model.WishlistDAO"%>
<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReservationDAO"%>
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
            box-shadow: 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 6px 16px 0 rgba(0, 0, 0, 0.08), 0 9px 28px 8px rgba(0, 0, 0, 0.05);
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
            /* flex-shrink: 0;
            height: 47px; */
            border-bottom: 1px solid #e4e5ed;
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
	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		if(info == null){
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
		List<ProductDTO> product_list =	new WishlistDAO().myWishlist(info.getUser_idx());
		
	%>
	<div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">

                        <button onclick="moveBack()" type="button" class="SearchFormModal__close">
                            <img src="../../img/small-caret-left.svg" alt="">
                        </button>
                        <span style="font-size: 17px;">
                            관심내역
                        </span>
                    </div>


                    <div class="_4a1tzy0">
                        <ul class="_4a1tzy1 korcsc5">
                            <%for(int i= 0;i < product_list.size();i++){ 
                            	String file = new FileDAO().fileSelect(new FileDTO(0, "product", product_list.get(i).getP_idx()));
                				String filename = "unknown.png";
                				if (file != null) {
                					filename = file;
                				}
                            %>

	                            <li class="_4a1tzy2">
	                                <a class="smb-list-item _1o1a6ke0 korcsc4" href="/Kkeonaeng/Product/Detail/?p_idx=<%=product_list.get(i).getP_idx()%>">
	                                    <div class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
	                                        <div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">
	
	                                            <img class="thumbnail-image qudd1g9"
	                                                src="/Kkeonaeng/file/<%=filename %>"
	                                                alt="">
	                                        </div>
	                                    </div>
	
	                                    <div class="smb-list-item-content _1o1a6ke3">
	                                        <div class="smb-list-item-name-wrapper _1o1a6ke4">
	                                            <span class="smb-list-item-name _1o1a6ke5"><%=product_list.get(i).getP_name() %></span>
	
	                                        </div>
	                                        <span class="smb-list-item-description _1o1a6ke7"><%=product_list.get(i).getContact_addr() %></span>
	                                        <span class="smb-list-item-infos _1o1a6ke8"><%=product_list.get(i).getPrice() %>원(일) </span>
	                                        <span class="wish">
	                                            <img src="../../img/noheart.png" alt="">
	                                            <span style="vertical-align: top; font-weight: 600;">132</span>
	                                        </span>
	                                    </div>
	                                </a>
	
	                            </li>
							<%} %>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	
    	const moveBack = () =>{
    		window.history.back();
    	}
    
    
    </script>
    <%} %>
</body>
</html>
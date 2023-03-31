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

		body{
			margin: 0 !important;
		}
  
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
            /* z-index: 10000; */
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
            /* height: 607px; */
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
            padding-bottom: 20px;
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
		    color: #ffffff;
		    font-weight: 700;
		    font-size: 0.9rem;
		    background: #ff5252;
		    border-radius: 7px;
		    padding: 5px;
		    /* position: absolute;
		    right: 30px;
		    bottom: 0.5rem; */
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
        
        
        .QuickMenuMobile{
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
     .QuickMenuMobile .menu-items{
        display: flex;
        align-items: center;
        flex: 1;
     }
     .QuickMenuMobile .menu{
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

.btnWrap{
	text-align: right;
    width: 100%;
    height: 25px;
}
    </style>
</head>
 
<body>
	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		if(info == null){
			response.sendRedirect("/Kkeonaeng/Login/");
		}else{
		List<ProductDTO> product_list =	new ReservationDAO().reservationList(info.getUser_idx());
		// rv_idx 를 가져올 방도가 없다...dto 좀더 다시 고민
	%>
	<div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">

                        <button onclick="moveBack()" type="button" class="SearchFormModal__close">
                            <img src="../img/small-caret-left.svg" alt="">
                        </button>
                        <span style="font-size: 17px;">
                            예약내역
                        </span>
                    </div>


                    <div class="_4a1tzy0">
                        <ul class="_4a1tzy1 korcsc5">
                            <%
                            if(product_list.size() > 0){
                            	
                            
                            for(int i= 0;i < product_list.size();i++){ 
                            	String file = new FileDAO().fileSelect(new FileDTO(0, "product", product_list.get(i).getP_idx()));
                				String filename = "unknown.png";
                				if (file != null) {
                					filename = file;
                				}
                            %>

	                            <li class="_4a1tzy2">
	                                <div class="smb-list-item _1o1a6ke0 korcsc4">
	                                    <div onclick="moveUrl('/Kkeonaeng/Product/Detail/?p_idx=<%=product_list.get(i).getP_idx()%>')" class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
	                                        <div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">
	
	                                            <img class="thumbnail-image qudd1g9"
	                                                src="/Kkeonaeng/file/<%=filename %>"
	                                                alt="">
	                                        </div>
	                                    </div>
	
	                                    <div class="smb-list-item-content _1o1a6ke3">
	                                        <div onclick="moveUrl('/Kkeonaeng/Product/Detail/?p_idx=<%=product_list.get(i).getP_idx()%>')" class="smb-list-item-name-wrapper _1o1a6ke4">
	                                            <span class="smb-list-item-name _1o1a6ke5"><%=product_list.get(i).getP_name() %></span>
	
	                                        </div>
	                                        <span class="smb-list-item-description _1o1a6ke7"><%=product_list.get(i).getContact_addr() %></span>
	                                        <div class="btnWrap">
	                                        	<span onclick="reservationCancel(<%=product_list.get(i).getRv_idx() %>)" class="smb-list-item-infos _1o1a6ke8">예약취소</span>
	                                        </div>
	                                        <%-- <span class="smb-list-item-infos _1o1a6ke8"><%=product_list.get(i).getPrice() %>원(일) </span> --%>
	                                        <!-- <span class="wish">
	                                            <img src="../img/heart.svg" alt="">
	                                            <span style="vertical-align: top; font-weight: 600;">132</span>
	                                        </span> -->
	                                    </div>
	                                </a>
	
	                            </li>
							<%}
                            
                            }else{
                            %>
                            <li class="_4a1tzy2" style="text-align: center;padding: 1rem;">
	                  			<p>예약내역이 없습니다</p>              
							</li>
                            <%} %>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <div class="QuickMenuMobile">

        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Main.jsp')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M4.00074 11V20C4.00074 20.5522 4.44845 21 5.00074 21H10.0007C10.553 21 11.0007 20.5522 11.0007 20V14H13.0007V20C13.0007 20.5522 13.4485 21 14.0007 21H19.0007C19.553 21 20.0007 20.5522 20.0007 20V11H21.8159C22.284 11 22.4954 10.4143 22.1353 10.1153L13.2784 2.76087C12.5377 2.14579 11.4638 2.14579 10.7231 2.76087L1.86615 10.1153C1.50603 10.4143 1.71748 11 2.18557 11H4.00074ZM15.0007 14V19H18.0007L18.0007 9.2817L12.0007 4.29956L6.00073 9.28171V10.9955L6.00074 11V19H9.00074L9.00073 13C9.00073 12.4477 9.44845 12 10.0007 12H14.0007C14.553 12 15.0007 12.4477 15.0007 13V13.9956L15.0007 14Z"
                        fill="black" />
                </svg>

                <div class="title active">홈</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Product/')">
            <div class="menu fl-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-box-seam" viewBox="0 0 16 16">
                    <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                  </svg>
                    
                <div class="title active">빌려드림</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/Message/')">
            <div class="menu fl-1">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20.5 12C20.5 16.6944 16.6945 20.5 12 20.5C7.63658 20.5 4.04105 17.2121 3.55575 12.9786C3.50944 12.5746 3.18006 12.25 2.77339 12.25C2.35106 12.25 2.00879 12.5991 2.05133 13.0193C2.56197 18.0634 6.82128 22 12 22C17.5229 22 22 17.5228 22 12C22 6.47715 17.5229 2 12 2C8.34254 2 5.14365 3.96356 3.40003 6.89402V4.25C3.40003 3.83579 3.06424 3.5 2.65003 3.5C2.23581 3.5 1.90002 3.83579 1.90002 4.25V8.5C1.90002 8.69891 1.97904 8.88968 2.11969 9.03033C2.26035 9.17098 2.45111 9.25 2.65003 9.25L6.90003 9.25C7.31425 9.25 7.65003 8.91421 7.65003 8.5C7.65003 8.08579 7.31424 7.75 6.90003 7.75L4.63718 7.75C6.10687 5.20934 8.85383 3.5 12 3.5C16.6945 3.5 20.5 7.30558 20.5 12Z" fill="black"/>
                    <path d="M12 7.5C11.5858 7.5 11.25 7.83579 11.25 8.25V12C11.25 12.268 11.393 12.5155 11.625 12.6495L15.3056 14.7745C15.6644 14.9816 16.1231 14.8587 16.3302 14.5C16.5373 14.1413 16.4144 13.6826 16.0556 13.4755L12.75 11.567V8.25C12.75 7.83579 12.4143 7.5 12 7.5Z" fill="black"/>
                    </svg>
                <div class="title active">나의 예약</div>
            </div>
        </div>
        <div class="menu-items" onclick="moveUrl('/Kkeonaeng/MyPage/')">
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
	
    	
    	const moveBack = () =>{
    		window.history.back();
    	}
    
    	// 예약취소
    	function reservationCancel(rv_idx,p_idx){
    		if(confirm('예약을 취소하시겠습니까?')){
    			location.href = 'ReservationDeleteCon.do?p_idx='+p_idx+'&rv_idx='+rv_idx;
    		}
    		
    	}
    
    </script>
    <%} %>
</body>
</html>
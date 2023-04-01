<%@page import="com.smhrd.model.UserDAO"%>
<%@page import="com.smhrd.model.WishlistDAO"%>
<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꺼냉</title>

<script src="https://kit.fontawesome.com/c108db6a29.js"
	crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<link href="/Kkeonaeng/css/joinStyles.css" rel="stylesheet" />

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
	background-color: var(- -seed-semantic-color-paper-default);
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
	border: .0625rem solid var(- -seed-scale-color-gray-alpha-50);
	border-radius: inherit;
	z-index: 1;
}

._1o1a6ke3, ._1o1a6ke4 {
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
	color: var(- -seed-scale-color-gray-900);
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
	color: var(- -seed-scale-color-gray-900);
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
	padding-right: calc(var(- -bs-gutter-x)* 0.5);
	padding-left: calc(var(- -bs-gutter-x)* 0.5);
	margin-top: var(- -bs-gutter-y);
}

.wish {
	align-self: self-end;
	margin-bottom: 0.5rem;
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
			
				<a onclick="moveBack()"
					style="text-decoration-line: none;"> <i
					class="fa-solid fa-chevron-left"
					style="padding: 0px 10px 10px; color: black;"></i>
				</a> 
				<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold">내가 쓴 대여글 목록</strong>
		</div>
	</nav>


					<div class="_4a1tzy0">
						<ul class="_4a1tzy1 korcsc5">
					<%
					int user_idx = Integer.parseInt(request.getParameter("user_idx"));
					UserDTO info = new UserDAO().userInfo(user_idx);
					
					List<ProductDTO> Product_list = new ProductDAO().ProductRentList(info.getUser_idx());

					for (int i = 0; i < Product_list.size(); i++) {

						ProductDTO product = Product_list.get(i);
						String file = new FileDAO().fileSelect(new FileDTO(0,"product",product.getP_idx()));
						int wishcheckcount = new WishlistDAO().WishlistCheckCount(product.getP_idx());
					%>
							<li class="_4a1tzy2">
							<a class="smb-list-item _1o1a6ke0 korcsc4" href="/Kkeonaeng/Product/Detail/?p_idx=<%=product.getP_idx()%>">
									<div
										class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
										<div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">

											<img class="thumbnail-image qudd1g9"
												src="/Kkeonaeng/file/<%=file %>" alt="">
										</div>
									</div>
									<div class="smb-list-item-content _1o1a6ke3">
										<div class="smb-list-item-name-wrapper _1o1a6ke4">
											<span class="smb-list-item-name _1o1a6ke5"><%=product.getP_name()%></span>
										</div>
										<span class="smb-list-item-description _1o1a6ke7"><%=product.getContact_addr()%></span>
										<span class="smb-list-item-infos _1o1a6ke8"><%=product.getPrice()%>원(일)</span>
										<span class="wish">
	                                            <img src="../img/noheart.png" alt="" style="width: 18px;">
	                                            <span style="font-weight: 600;font-size: 0.9rem;color: #6a6a6a;"><%=wishcheckcount %></span>
	                                        </span>
									</div>
							</a></li>


							<%
							}
							%>

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

</body>

</html>
</head>
<body>
</body>
</html>
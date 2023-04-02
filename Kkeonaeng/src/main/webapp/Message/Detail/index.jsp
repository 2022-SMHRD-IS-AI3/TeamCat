<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/c108db6a29.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="../../assets/favicon.ico" />
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
	height: 100%;
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

.profile {
	margin-left: 0.8rem;
	padding-bottom: 15px;
	border-bottom: solid 1px #9595952e;
	margin-right: 0.8rem;
	padding-top: 15px;
}

.profile .nickname {
	font-size: 1rem;
	font-weight: bolder;
	line-height: 1.5;
	letter-spacing: -0.6px;
	color: #212529;
	margin-bottom: 5px;
	width:65%;
}

.profile .region-name {
	font-size: 0.8rem;
    line-height: 1.46;
    letter-spacing: -0.6px;
    color: grey;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    height: 39px;
}

.fl-1 {
	flex: 1;
}

.profileWrap{
	width: 100%;
	display: flex;
}

.msdate{
	width:35%;
	text-align : right;
	font-size: 0.76rem;
    color: grey;
	
}


.product_info{
    display: flex;
    padding: 0.5rem;
    border-bottom: 1px solid #8080803c;
}

.p_img_wrap{
    width:15%;
    padding:0.5rem;
    overflow: hidden;
}

.p_img{
    width: 2rem;
    height:  2rem;
    object-fit: cover;
    border-radius: 0.2rem;
}

.p_info_wrap{
    width: 85%;
    padding:0.3rem;
}

.p_name{
    font-size: 0.8rem;
    font-weight: 600;
}

.p_price{
    font-size: 0.8rem;
    font-weight: 600;
}

    </style>
</head>

<body>

	<%
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		ProductDTO product = new ProductDAO().ProductDetail(p_idx);
		String file = new FileDAO().fileSelect(new FileDTO(0,"product",p_idx));
	%>
    <div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal" style="margin-bottom: 3.6rem;">
                    <nav class="navbar navbar-expand-lg" style="border-bottom: 1px solid #8080801a;">
						<div class="container">
			
							<a onclick="moveBack()"
								style="text-decoration-line: none;"> <i
								class="fa-solid fa-chevron-left"
								style="padding: 0px 10px 10px; color: black;"></i>
							</a> 
							<strong class="navbar-brand" style="font-size: 17px; color: black; font-weight: bold"><%=product.getNick() %></strong>
						</div>
					</nav>
                    <!-- 물건 사진 및 이름 -->
                    <div class="product_info">
                        <!-- 사진 -->
                        <div class="p_img_wrap">
                            <img class="p_img" src="/Kkeonaeng/file/<%=file %>" alt="">
                        </div>
                        <!-- 정보 -->
                        <div class="p_info_wrap">
                            <!-- 물건제목 -->
                            <div class="p_name"><%=product.getP_name() %></div>
                            <!-- 가격 -->
                            <div class="p_price"><%=product.getPrice() %>원</div>
                        </div>
                    </div>
					
					
            
        		</div>
        	</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        
    <script type="text/javascript">
	    const moveBack = () =>{
			window.history.back();
		}
    </script>
</body>

</html>
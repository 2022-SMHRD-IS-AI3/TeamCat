<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="../../assets/favicon.ico">
    <link href="../../css/styles.css" rel="stylesheet">
    <style>
        .KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile {
            background-color: rgba(33, 33, 33, 0.46);
        }

        .KmongDialog {
            /* position: fixed; */
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
            /* height: 50px; */
            position: relative;
            /* background-color: #ffffff; */
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


        .SearchFormModal__close {
            background-color: transparent;
            border: none;
            vertical-align: middle;
            width: 50px;
            height: 50px;
        }

        .SearchFormModal__close img {
            height: 35px;
        }

        .delete {
            background-color: transparent;
            border: none;
            vertical-align: middle;
            width: 50px;
            height: 50px;
            position: absolute;
            right: 45px;
        }
        .delete:hover::before {
            content: attr(title);
            background-color: #555;
            color: #fff;
            padding: 4px 8px;
            border-radius: 4px;
            position: absolute;
            bottom: 100%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .delete:hover::after {
            content: "";
            position: absolute;
            border-style: solid;
            border-width: 5px 5px 0 5px;
            border-color: #555 transparent transparent transparent;
            bottom: 90%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .delete:hover::before,
        .delete:hover::after {
            opacity: 1;
        }


        .edit {
            background-color: transparent;
            border: none;
            width: 50px;
            height: 50px;
            position: absolute;
            right: 5px;
        }

        .edit:hover::before {
            content: attr(title);
            background-color: #555;
            color: #fff;
            padding: 4px 8px;
            border-radius: 4px;
            position: absolute;
            bottom: 100%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .edit:hover::after {
            content: "";
            position: absolute;
            border-style: solid;
            border-width: 5px 5px 0 5px;
            border-color: #555 transparent transparent transparent;
            bottom: 90%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .edit:hover::before,
        .edit:hover::after {
            opacity: 1;
        }

        #profile {
            margin: 0 1.6rem;
            padding-top: 10px;
            position: relative;

        }

        #profile-link {
            display: block;
            text-decoration: none;
            color: #212529;
        }

        #profile .space-between {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #profile #profile-left {
            margin-left: 0.8rem;
            padding-bottom: 10px;
        }

        #profile #profile-left #nickname {
            font-size: 0.8rem;
            font-weight: 600;
            line-height: 1.5;
            letter-spacing: -0.6px;
            color: #212529;
        }

        #profile #profile-left #region-name {
            font-size: 0.8rem;
            line-height: 1.46;
            letter-spacing: -0.6px;
            color: #212529;
        }

        #description {
            margin: 0 1.6rem;
        }

        #description #title {
            font-size: 2rem;
            font-weight: 600;
            line-height: 1.5;
            letter-spacing: -0.5px;
        }

        #description #category {
            margin-top: 0.4rem;
            font-size: 0.9rem;
            line-height: 1.46;
            letter-spacing: -0.6px;
            color: #868e96;
            margin-bottom: 10px;
        }

        /* #description #detail{
            /* margin-top: 0.8rem;
            margin-bottom: 1.6rem; */
        */ #description #detail p {
            font-size: 1.1rem;
            line-height: 1.6;
            letter-spacing: -0.6px;
            margin: 0.8rem 0 1.2rem 0;
        }

        #description #counts {
            font-size: 1.3rem;
            line-height: 1.46;
            letter-spacing: -0.6px;
            color: #868e96;
        }


        .report1 {
            background-color: transparent;
            border: none;
            position: absolute;
            right: 7%;
        }

        .QuickMenuMobile {
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

        .QuickMenuMobile .menu-items {
            display: flex;
            align-items: center;
        }

        .QuickMenuMobile .menu {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 8px 0;
            border-right: 2px solid #e9ecef;
        }

        .fl-1 {
            flex: 1;
        }

        .QuickMenuMobile .title {
            font-size: 11px;
            margin-top: 3px;
        }

        .reservation {
            background-color: rgb(82 127 239);
            color: white;
            width: 100px;
            height: 40px;
            position: absolute;
            right: 15px;
            top: 10px;
            border: none;
            border-radius: 9px;
            font-weight: bold;
        }

        .w-100 {
            height: 190px;
        }

        .plan_filter {
            padding: 10px 15px;

        }

        .plan_filter.selection {
            border: 0;
            width: auto;
        }

        .selection {
            position: relative;
            display: inline-block;
            background-color: #fff;

        }

        .selection select {
            border: 1;
            width: 85px;
            z-index: 1;
            background: transparent;
            vertical-align: baseline;
            font-size: 14px;
        }

        .state {
            font-size: 0.6rem;
            border: 1px solid;
            border-radius: 10px;
            display: inline-block;
            width: 55px;
            height: 18px;
            text-align: center;
            border-color: rgb(82 127 239)
        }

        #price {
            font-size: 17px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        #itle{
            font-weight: bold;
        }

        #count{
            padding-bottom: 10px;
            font-size: 0.73rem;
            color: #00000057;
            font-weight: 700;
        }

        #reple{
            box-shadow: 0px 0px 7px -4px;
        }
       
    </style>
</head>
<body>
	<!-- 게시글 세부내용 조회 기능 -->	
	<%
	
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	ProductDAO dao = new ProductDAO();
	ProductDTO productDetail = dao.ProductDetail(p_idx);
	String file = new FileDAO().fileSelect(new FileDTO(0,"product",p_idx));
			
	UserDTO info = (UserDTO)session.getAttribute("info");
	int user_idx = 0; 
	if(info != null) {
		user_idx = info.getUser_idx();
	}
	%>
	
	
			
	<div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">
                        <button onclick="moveUrl('../')" type="button" class="SearchFormModal__close">
                            <img src="../../img/small-caret-left.svg" alt="">
                        </button>
                        <%if(info != null && info.getUser_idx() == productDetail.getUser_idx() ) {%>
						<button onclick="ProductDelete()" type="button" class="delete" title="삭제">
                            <img src="../../img/bin.svg" alt="">
                        </button>

                        <button onclick="moveUrl('../Write/?p_idx=<%=p_idx%>')" type="button" class="edit" title="수정">
                            <img src="../../img/edit.svg" alt="">
                        </button>
						
						<% } %>
                        

                    </div>
                </div>

                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                        <!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                            aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"
                            aria-label="Slide 5"></button> -->

                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img style="object-fit: cover;" src="/Kkeonaeng/file/<%=file%>" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <section id="profile" href="">
                    <a id="profile-link" href=""></a>
                    <div class="space-between">
                        <div style="display: flex;">
                            <div id="article-profile-image" style="align-self: center;">
                                <svg width="35" height="35" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                        d="M12 12C13.1046 12 14 11.1046 14 10C14 8.89543 13.1046 8 12 8C10.8954 8 10 8.89543 10 10C10 11.1046 10.8954 12 12 12ZM12 13.5C13.933 13.5 15.5 11.933 15.5 10C15.5 8.06701 13.933 6.5 12 6.5C10.067 6.5 8.5 8.06701 8.5 10C8.5 11.933 10.067 13.5 12 13.5Z"
                                        fill="black" />
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                        d="M10.9776 21.9484C11.3137 21.9825 11.6548 22 12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 14.4815 2.90389 16.752 4.4004 18.5C5.77451 20.105 7.64823 21.2696 9.78062 21.7528C10.1714 21.8414 10.5709 21.9071 10.9776 21.9484ZM17.4776 18.4999C16.0365 19.7156 14.1856 20.4608 12.1616 20.4985C12.1079 20.4995 12.054 20.5 12 20.5C11.9569 20.5 11.914 20.4997 11.8711 20.499C9.83437 20.4688 7.97122 19.7221 6.52238 18.4999C8.00263 17.2509 9.9131 16.5 12 16.5C14.0869 16.5 15.9973 17.2509 17.4776 18.4999ZM18.5375 17.4327C16.7845 15.9169 14.4993 15 12 15C9.50064 15 7.21545 15.9169 5.46245 17.4327C4.23701 15.9597 3.5 14.0659 3.5 12C3.5 7.30558 7.30558 3.5 12 3.5C16.6944 3.5 20.5 7.30558 20.5 12C20.5 14.0659 19.763 15.9597 18.5375 17.4327Z"
                                        fill="black" />
                                </svg>

                            </div>
                            <div id="profile-left">
                                <div id="nickname"><%=productDetail.getNick() %></div>
                                <div id="region-name"><%=productDetail.getContact_addr() %></div>
                                <div>
                                    <div class="selection">
                                        <span class="state">
                                            대여가능
                                        </span>

                                    </div>
                                </div>

                            </div>
                </section>
                <hr style="color: #a7a7a7bd; margin-bottom: 0.9rem; margin-top: 0.5rem;">
                <section id="description">
                    <h5 property="schema:name" id="itle" style=""><%=productDetail.getP_name() %></h5>
                    <p id="category">
                        생활/주방 ∙
                        <time>21시간전</time>
                    </p>
                    <p id="price" property="schema:price"><%=productDetail.getPrice() %>원</p>
                    <div property="schema:description" id="detail">
                        <p style="font-size: 0.85rem;">
                            <%=productDetail.getP_contents() %>
                        </p>

                    </div>
                    <p id="count" dir="counts" style="padding-bottom: 10px;">
                        관심 23
                    </p>

                </section>
                <section id="reple" class="mb-5">
                    <div class="bg-light">
                        <div class="card-body">
                            <span style="margin-left: 10px; font-weight: 600;">댓글 4개</span>
                            <!-- Comment form-->
                            <form class="mb-4" style="margin-top: 10px;"><textarea class="form-control" rows="3"
                                    placeholder="댓글을 입력하세요!"></textarea></form>
                            <!-- Comment with nested comments-->
                            <div class="d-flex mb-4">
                                <!-- Parent comment-->
                                <div class="ms-3">
                                    <div class="fw-bold">프로젝트 개극혐</div>
                                    이걸 어케 2주만에 하라는거임?
                                    <!-- Child comment 1-->
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="arrow-return-right.svg"
                                                alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">꺼냉좋아</div>
                                            저도 지금 꺼냉싫어로 닉변할까 고민중
                                        </div>
                                    </div>
                                    <!-- Child comment 2-->
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0"><img class="rounded-circle"
                                                src="arrow-return-right.svg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">프로젝트 개극혐</div>
                                            ㄱㄱㄱㄱ
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single comment-->
                            <div class="d-flex">
                               
                                <div class="ms-3">
                                    <div class="fw-bold">화가 많은 사람</div>
                                    이 의자로 컴퓨터 부숴도 되나요?
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
	<div class="QuickMenuMobile">
        <div class="menu-items">
            <div class="menu fl-1">
                <svg width="70" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M16.4835 3.20764C18.0773 3.20764 19.6061 3.84008 20.7341 4.96612C21.8621 6.09217 22.4972 7.61979 22.5 9.21365C22.5 12.4477 21.3135 13.9912 16.011 18.1807L13.2876 20.2945C12.5299 20.8826 11.4701 20.8826 10.7124 20.2945L7.989 18.1807C2.6865 13.9912 1.5 12.4477 1.5 9.21365C1.50278 7.61979 2.13789 6.09217 3.2659 4.96612C4.39391 3.84008 5.92264 3.20764 7.5165 3.20764C9.14236 3.21536 10.7014 3.85554 11.8635 4.99264L12 5.12142L12.1365 4.99264C13.2986 3.85554 14.8576 3.21536 16.4835 3.20764ZM7.51413 4.20764C8.71502 4.21388 9.87239 4.63078 10.7978 5.38096L11.6415 6.16945C11.8432 6.35803 12.1566 6.35803 12.3584 6.16945L13.2015 5.38153C14.127 4.63099 15.2847 4.21389 16.4858 4.20764C17.8139 4.20827 19.0876 4.73552 20.0276 5.67385C20.9679 6.61253 21.4974 7.88591 21.5 9.21455C21.4999 10.6652 21.2459 11.6406 20.4363 12.7491C19.5692 13.9366 18.0545 15.2915 15.3944 17.3934L12.6745 19.5045C12.2776 19.8126 11.7224 19.8126 11.3255 19.5045L8.60557 17.3934C5.9455 15.2915 4.43081 13.9365 3.56365 12.7491C2.75411 11.6406 2.5001 10.6652 2.5 9.21455C2.50254 7.88591 3.03207 6.61253 3.97239 5.67385C4.91236 4.73552 6.18604 4.20827 7.51413 4.20764Z"
                        fill="black" />
                </svg>

                <div class="title active"></div>
            </div>
            <div style="margin-left: 20px;">
                <%=productDetail.getPrice() %>원(일)
            </div>
            <div>
                <button class="reservation" type="button">예약자내역</button>
            </div>
        </div>
    </div>
	
    
	<script type="text/javascript">
		const ProductDelete = () => {
			if(confirm("삭제 하시겠습니까?") == true) {
				moveUrl("ProductDeleteCon.do?p_idx="+<%=p_idx %>);
			}
		}
		
		const moveUrl = (url) => {
			location.href=url;
		}
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
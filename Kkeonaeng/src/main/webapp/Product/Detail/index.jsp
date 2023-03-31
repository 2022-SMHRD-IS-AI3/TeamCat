<%@page import="com.smhrd.model.RentDAO"%>
<%@page import="com.smhrd.model.RentDTO"%>
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
    <title>꺼냉</title>
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

        .description {
            margin: 0 1.6rem;
        }

        .description #title {
            font-size: 2rem;
            font-weight: 600;
            line-height: 1.5;
            letter-spacing: -0.5px;
        }

        .description #category {
            margin-top: 0.4rem;
            font-size: 0.9rem;
            line-height: 1.46;
            letter-spacing: -0.6px;
            color: #868e96;
            margin-bottom: 10px;
        }

        /* .description #detail{
            margin-top: 0.8rem;
            margin-bottom: 1.6rem;*/
            
        .description #detail p {
            font-size: 1.1rem;
            line-height: 1.6;
            letter-spacing: -0.6px;
            margin: 0.8rem 0 1.2rem 0;
        }

        .description #counts {
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
            height: 35px;
            position: absolute;
            right: 15px;
            top: 7px;
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

        .price {
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
       .profile-img {
       	width: 45px;
	    height: 45px;
	    object-fit: cover;
	    border-radius: 50%;
       }
       
       .heartchk{
       	    width: 25px;
		    margin-left: 10px;
		    margin-right: 10px;
       	}
    </style>
</head>
<body>
	<!-- 게시글 세부내용 조회 기능 -->	
	<%
	
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	ProductDAO dao = new ProductDAO();
	ProductDTO productDetail = dao.ProductDetail(p_idx);
	String gps = productDetail.getContact_gps();
	String[] gpsArr = gps.split(",");
	String p_flag = "대여가능";
	if(productDetail.getP_flag().equals("2")){
		p_flag = "대여중";
	}
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
                            <img style="object-fit: cover;" onclick="moveUrl('../../Product/Detail/Detail_img?p_idx=<%=p_idx%>')" src="/Kkeonaeng/file/<%=file%>" class="d-block w-100" alt="...">
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
                            	<%
                            	String profile = new FileDAO().fileSelect(new FileDTO(0, "profile", productDetail.getUser_idx()));
                				String filename = "unknown.png";
                				if (profile != null) {
                					filename = profile;
                				}
                            		
                            	%>
                            
                                <img class="profile-img" alt="" src="/Kkeonaeng/file/<%=filename%>">

                            </div>
                            <div id="profile-left">
                                <div id="nickname"><%=productDetail.getNick() %></div>
                                
                                <div>
                                    <div class="selection">
										<span class="state">
                                            <%=p_flag %>
                                        </span>
                                    </div>
                                </div>

                            </div>
                </section>
                <hr style="color: #a7a7a7bd; margin-bottom: 0.9rem; margin-top: 0.5rem;">
                <section class="description">
                    <h5 property="schema:name" id="itle" style=""><%=productDetail.getP_name() %></h5>
                    <p id="category">
                        생활/주방 ∙
                        <time>21시간전</time>
                    </p>
                    <p class="price" property="schema:price"><%=productDetail.getPrice() %>원</p>
                    <div property="schema:description" id="detail">
                        <p style="font-size: 0.85rem;">
                            <%=productDetail.getP_contents() %>
                        </p>

                    </div>
                    <p id="count" dir="counts" style="padding-bottom: 10px;">
                        관심 23
                    </p>

                </section>
                <hr style="color: #a7a7a7bd; margin-bottom: 0.9rem; margin-top: 0.5rem;">
                <section class="description" style="margin-bottom:1rem;">
                	<p class="price">거래위치</p>
                	<div id="region-name" style="padding: 0.5rem;overflow: hidden;font-size: 0.9rem;"><%=productDetail.getContact_addr() %></div>
                    <div id="map" style="width:100%;height:200px;border-radius: 0.5rem;"></div>
				
                </section>
                <section id="reple" class="mb-5">
                    <div class="bg-light">
                        <div class="card-body">
                            <span style="margin-left: 10px; font-weight: 600;">댓글 4개</span>
                            <!-- Comment form-->
                            <form class="mb-4" style="margin-top: 10px;">
                            	<textarea class="form-control" rows="3" placeholder="댓글을 입력하세요!"></textarea>
                            	<button onclick="">작성완료</button>
                            </form>
                                    
                            <!-- Comment with nested comments-->
                            <div class="d-flex mb-4">
                                <!-- Parent comment-->
                             <div class="fw-bold"></div>
                                    이걸 어케 2주만에 하라는거임?    
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
            <% if(1<0){ %>
                <img class="heartchk" alt="" src="/Kkeonaeng/img/noheart.png">
			<%}else{ %>
                <img class="heartchk" alt="" src="/Kkeonaeng/img/heart.png">
			<%} %>			
                <div class="title active"></div>
            </div>
            <div class="price" style="margin-left: 20px;">
                <%=productDetail.getPrice() %>원(일)
            </div>
            <div>
            <%if(info !=null && user_idx == productDetail.getUser_idx()) {            
            %>
                <a href="../Reservation/UserList/?p_idx=<%=p_idx%>"><button class="reservation" type="button">예약자내역</button></a>
            <% }else{
           
            	RentDTO r = new RentDAO().rentStatuesInfo(new RentDTO(p_idx,user_idx));
            	String button = "<button onclick='reservation()' class='reservation' type='button'>예약하기</button>";
            			System.out.println(r);
            	if(r != null){
            		// 예약대기 r_idx == 0
	            	if(r.getR_idx() == 0){
	            		button = "<button class='reservation' type='button'>예약중</button>";
            		// 대여시작 r_status == N
	            	}else if(r.getR_status().equals("N")){
	            		button = "<button onclick='rentStartStatus()' class='reservation' type='button'>대여시작</button>";
	            	// 반납완료 return_chk == N
	            	}else if(r.getReturn_chk().equals("N")){
	            		button = "<button onclick='rentReturn("++")' class='reservation' type='button'>반납완료</button>";
	            	// 반납중 return_date == null
	            	}else if(r.getReturn_chk().equals("N") && r.getReturn_date() == null){
	            		button = "<button class='reservation' type='button'>반납중</button>";
	            	}
            	} 
            	
            	%>
            	<%=button%>
            <%} %>
            </div>
        </div>
    </div>
	
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=448887f9bc1535931929ada97487c31a"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(<%=gpsArr[0]%>, <%=gpsArr[1]%>), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(<%=gpsArr[0]%>, <%=gpsArr[1]%>); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		const ProductDelete = () => {
			if(confirm("삭제 하시겠습니까?") == true) {
				moveUrl("ProductDeleteCon.do?p_idx="+<%=p_idx %>);
			}
		}
		
		const reservation = () =>{
			moveUrl('../Reservation/?user_idx=<%=user_idx%>&p_idx=<%=p_idx%>');
		}
		
		
		const moveUrl = (url) => {
			location.href = url;

		}
		
		// 예약자 대여시작
		const rentStartStatus = () => {
			moveUrl('RentStartStatusCon.do?p_idx=<%=p_idx%>');
		}
		
		// 예약자 반납완료
		const rentReturn = (p_idx,user_idx,rp_idx) => {
			
			if(confirm("대여물건을 반납하시겠습니까?")){
				moveUrl(`RentReturnCon.do?p_idx=<%=p_idx%>&user_idx=<%=productDetail.getUser_idx()%>&rp_idx=<%=user_idx%>`);
			}
			<%-- moveUrl('RentReturnCon.do?p_idx=<%=p_idx%>'); --%>
		}

	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
	background-color: var(- -seed-semantic-color-paper-default);
	padding: 1rem;
	box-sizing: border-box;
	display: flex;
	align-items: flex-start;
	overflow: hidden;
	text-decoration: none;
	cursor: pointer;
	border-bottom: 1px solid #9595952e;
	padding-left: 0;
	padding-right: 0;
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
	margin: .125rem 0 0;
	overflow: hidden;
	text-overflow: ellipsis;
	word-break: break-all;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	color: #212124;
}

._1o1a6ke8 {
	line-height: 1.3;
	font-size: .75rem;
	margin: 0.25rem 0 0;
	color: #868B94;
}

.row>* {
	flex-shrink: 0;
	max-width: 100%;
	padding-right: calc(var(- -bs-gutter-x)* 0.5);
	padding-left: calc(var(- -bs-gutter-x)* 0.5);
	margin-top: var(- -bs-gutter-y);
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
	padding-left: 180px;
	padding-top: 20px;
}

.selection select {
	position: relative;
	border: 0;
	width: 85px;
	z-index: 1;
	background: transparent;
	vertical-align: baseline;
	font-size: 14px;
}

</style>
</head>
<body>
	<%
	String search = request.getParameter("search");
	ProductDAO dao = new ProductDAO();
	List<ProductDTO> search_list = dao.ProductSearch(search);

	System.out.println(search_list.size());
	%>

	<div
		class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
		<div class="KmongDialog__container">
			<div class="KmongDialog__content">
				<div class="SearchFormModal">
					<div class="SearchFormModal__header">
						<button type="button" class="SearchFormModal__close">
							<img src="../../img/small-caret-left.svg" alt="">

						</button>
						<span><input id="searchText" placeholder="검색어를 입력하세요." onkeyup="if(window.event.keyCode==13){search()}" type="text"
							maxlength="15" autocomplete="off" autocorrect="off"
							autocorrect="off" autocapitalize="off" autofocus="autofocus"
							class="SearchFormModal__input">
							<button type="button" class="SearchFormModal__clear-button">
								<img src="../../img/close-circle.svg" alt="">
							</button> </span>
					</div>
					<div"plan_filter">
						<div class="selection">
							<select id="category">
								<option value="">카테고리</option>
								<option value="">디지털기기</option>
								<option value="">생활가전</option>
								<option value="">가구/인테리어</option>
								<option value="">생활/주방</option>
								<option value="">유아동</option>
								<option value="">여성의류/잡화</option>
								<option value="">남성패션/잡화</option>
								<option value="">스포츠/레저</option>
								<option value="">취미/게임/음반</option>
								<option value="">도서</option>
								<option value="">반려동물용품</option>
								<option value="">기타</option>
							</select> <select id="sort">
								<option value="popular">전체</option>
								<option value="popular">인기순</option>
								<option value="latest">최신순</option>
								<option value="old">오래된순</option>
								<option value="available">대여가능</option>
							</select>
						</div>
					</div>

					<div class="_4a1tzy0">
						<ul class="_4a1tzy1 korcsc5">
							<%
							if (search_list.size() > 0) {
								for (ProductDTO dto : search_list) {
							%>
							<li class="_4a1tzy2">
								<a class="smb-list-item _1o1a6ke0 korcsc4" href="">
									<div class="smb-list-item-thumbnail-wrapper _1o1a6ke2 _1o1a6ke1">
										<div class="thumbnail-base qudd1g0 qudd1g4 _1o1a6ke1">
											<img class="thumbnail-image qudd1g9" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202201%2F2db4ee69075c401b523dc8612bfb1fcdac0634428e7e2d078cf66608386fb2b7.webp%3Fq%3D95%26s%3D1440x1440%26t%3Dinside&type=a340" alt="">
										</div>
									</div>

									<div class="smb-list-item-content _1o1a6ke3">
										<div class="smb-list-item-name-wrapper _1o1a6ke4">
											<span class="smb-list-item-name _1o1a6ke5"><%=dto.getP_name() %></span>
											<!-- <span class="smb-list-item-region _1o1a6ke6">금남로5가</span> -->
										</div>
										<span class="smb-list-item-description _1o1a6ke7"><%=dto.getPrice() %></span>
										<!-- <span class="smb-list-item-infos _1o1a6ke8">후기 1,720 ∙ 생활/주방</span> -->
									</div>
							</a></li>
							<hr>
							<%
							}
							%>


							<%
							} else {
							%>
							<li class="_4a1tzy2">
                                <p style="text-align: center;margin-block-start: 2em;margin-block-end: 2em;">검색 결과가 없습니다.</p>

                            </li>
							<hr>
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
	    const search = () =>{
			let searchData = document.getElementById('searchText').value;
			if(searchData.length > 0){
	    		moveUrl('./?search='+searchData);
				
			}
		}
	    
		const moveUrl = (url)=>{
			location.href=url;
		}
    </script>
</body>
</html>
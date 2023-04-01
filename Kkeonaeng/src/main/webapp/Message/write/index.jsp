<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="com.smhrd.model.MessageDAO"%>
<%@page import="com.smhrd.model.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/styles.css">
<style>
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
	/* overflow-y: auto; */
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

.write {
	margin-top: 15px;
    padding-bottom: 15px;
	border-bottom: 1px solid #e4e5ed;
    padding-left: 15px;
}

.special {
	width: 70px;
	height: 30px;
	background-color: white;
}

.actions {
	position: absolute;
	bottom: 10px;
	right: 10px;
}


.special:focus {
	background-color: rgb(82, 127, 239);
	color: white;
	border: 2px solid;
}
</style>
</head>

<body>
	<%
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));// 물건 idx
		int send_idx = Integer.parseInt(request.getParameter("send_idx"));// 물건 idx
		String user_nick = request.getParameter("user_nick");// 물건 idx
		ProductDTO product =new ProductDAO().ProductDetail(p_idx);
		UserDTO info = (UserDTO) session.getAttribute("info");
	
	%>
	<div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">

                        <button type="button" class="SearchFormModal__close">
                            <img src="../../img/small-caret-left.svg" alt="" style="width: 32px;">
                        </button>
                        <span style="font-size: 17px; font-weight: bold; position: absolute; top: 14px; left: 40px;">
                            메시지보내기
                        </span>

                    </div>
                    <div>
                        <p class="write" style="font-weight: bold;">게시글 제목 : <%=product.getP_name() %></p>
                        <p class="write">받는사람 : <%=user_nick %></p>
                    </div>
                </div>
            </div>



			<section id="contact">
				<div class="inner">
					<section>
						<!-- Q11. 메시지 보내기 기능(메시지는 계속 확인하기 위해서 DB에 저장!) -->
						<!-- 다른 사람의 DB에 메시지 저장해보기! -->
						<form action="MessageSendCon.do" method="post">
							<input type="hidden" name="p_idx" id="p_idx" value="<%=p_idx%>">
							<input type="hidden" name="user_idx" id="user_idx" value="<%=send_idx%>">
							<input type="hidden" name="send_idx" id="send_idx" value="<%=product.getUser_idx()%>">
							<div class="field">
								<textarea name="message_con" id="message_con" rows="6"
									style="width: 100%; position: absolute; bottom: 0px; height:75%;"></textarea>
							</div>
							<div class="actions">
								<input type="submit" value="전송" class="special" /> 
								<input type="reset" value="삭제" class="special" />
							</div>
						</form>
					</section>

				</div>
		</div>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>

</html>
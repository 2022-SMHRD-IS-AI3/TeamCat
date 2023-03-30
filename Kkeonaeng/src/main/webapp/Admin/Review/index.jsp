<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<th>리뷰 순번</th>
				<th>리뷰 받은 회원</th>
				<th>좋아요,싫어요</th>
				<th>리뷰 내용</th>
				<th>신고 유무</th>
				<th>신고 회원</th>
				<th>선택</th>
			</tr>
			<%
			List<ReviewDTO> Review_list = new ReviewDAO().ReviewAll();

			for (int i = 0; i < Review_list.size(); i++) {

				ReviewDTO review = Review_list.get(i);
				String urlCon = "ReviewDeleteCon.do";
			%>
			<tr>
				<td><%=review.getRv_idx()%></td>
				<td><%=review.getUser_idx()%></td>
				<td><%=review.getThumbs_flag()%></td>
				<td><%=review.getRv_contents()%></td>
				<td><%=review.getRp_flag()%></td>
				<td><%=review.getRp_idx()%></td>
				<td>
					<button onclick="moveUrl('<%=urlCon%>?admin=y&Rv_idx=<%=review.getRv_idx()%>')">
						삭제
					</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	
	<script type="text/javascript">
	const moveUrl = (url) => {
		location.href = url;
	}
	</script>
</body>
</html>
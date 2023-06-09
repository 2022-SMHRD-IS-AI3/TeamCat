<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>꺼냉</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../css/joinStyles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c108db6a29.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
#checkReport, #review {
	display: none;
}

button {
	border: none;
	background-color: #fff;
}

li {
	list-style: none;
	width: 50%;
	height: 200px;
	float: left;
}

textarea {
	width: 100%;
	height: 6.25em;
	border: solid 1px #000;
	resize: none;
}

.gbWrap{
	display:flex;
}

.gbChoice{
	width:50%
}
</style>

</head>
<body>

	<%
	int user_idx = Integer.parseInt(request.getParameter("user_idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	int rp_idx = Integer.parseInt(request.getParameter("rp_idx"));
	%>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a href="#" style="text-decoration-line: none;"> <i
				class="fa-solid fa-chevron-left"
				style="padding: 0px 10px 10px; color: black;"></i>
			</a> <span class="navbar-brand">리뷰</span>
		</div>
	</nav>

	<!-- Page content-->
	<div class="container">
		<div class="text-center mt-5">
			<div class="gbWrap" id="gb">
				<div class="gbChoice">
					<span>
						<button onclick="thumbsChk('G')" class="good">
							<i class="fa-regular fa-thumbs-up fa-5x"></i>
						</button>
					</span>
					<div>
						<span>좋아요</span>
					</div>
				</div>
				<div class="gbChoice">
					<span>
						<button onclick="thumbsChk('B')" class="bad">
							<i class="fa-regular fa-thumbs-down fa-5x"></i>
						</button>
					</span>
	
					<div>
						<span>별로에요</span>
					</div>
				</div>
			</div>
		</div>
		<form action="ReviewUpdateCon.do" method="post">
			<input type="hidden" name="p_idx" value="<%=p_idx%>">
			<input type="hidden" name="rp_idx" value="<%=rp_idx%>"> <input
				type="hidden" name="user_idx" value="<%=user_idx%>">
				 <input type="hidden" name="thumbs_flag" id="thumbs_flag" value="">
				 <input type="hidden" name="rp_flag" id="rp_flag" value="0">
			<br> <br>
			<div id="checkReport">
				<input onclick="report()" type="checkbox" name="rp_check"
					id="rp_check" value="1"> <label for="rp_check">신고하기
					(선택사항)</label>
				<p style="font-size: 0.85rem; color: #6c757d;">⚠신고할 내용이 없다면
					신고하기를 클릭하지 않고 리뷰를 작성해주세요.</p>
			</div>

			<div id="review">
				<textarea name="rv_contents" id="rv_contents" cols="30" rows="10"
					maxlength="50"></textarea>
			</div>
			<div style="margin-top: 1rem;" align="center">
				<input type="submit" value="리뷰완료" class="input"
					style="display: none;">
			</div>
		</form>
	</div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
            // 좋아요 싫어요 눌렀을 때 리뷰창 변경
            let thumbsChk = (flag) => {
                
                if(flag == 'G'){
                    
                    document.getElementById('rv_contents').setAttribute('placeholder','리뷰를 작성해주세요(최대 50자)');
                    document.getElementById('review').style.display = 'block';
                    document.getElementById('checkReport').style.display = 'none';
                    $('.input').show();
                }else{
                    document.getElementById('rv_contents').setAttribute('placeholder','리뷰를 작성해주세요(최대 50자)');
                    document.getElementById('review').style.display = 'block';
                    document.getElementById('checkReport').style.display = 'block';
                    $('.input').show();
                
                }
                document.getElementById('thumbs_flag').value = flag;
            }

        
            // 신고하기 클릭시 리뷰창 변경
            function report() {
                if (document.getElementById("rp_check").checked == true){
                    document.getElementById('rv_contents').setAttribute('placeholder','신고내용을 작성해주세요(최대 50자)');
                    document.getElementById('review').style.display = 'block';
                    document.getElementById('checkReport').style.display = 'block';
                    document.getElementById('rp_flag').value = 1;
                }else{
                    document.getElementById('rp_flag').value = 0;
                    document.getElementById('rv_contents').setAttribute('placeholder','리뷰를 작성해주세요(최대 50자)');
                    document.getElementById('review').style.display = 'block';
                    document.getElementById('checkReport').style.display = 'block';
                }
            }

            // 눌렀을 때 good -> solidGood
            $(document).on("click", "button[class=good]", function(){
            $(this).html("<i class='fa-solid fa-thumbs-up fa-5x'></i>");
            $(this).removeAttr("class")
            $(this).attr("class","solidGood");
            })
            
            
            // bad -> solidBad
            $(document).on("click", "button[class=bad]", function(){
            $(".bad").html("<i class='fa-solid fa-thumbs-down fa-5x'></i>");
            $(".good").html("<i class='fa-regular fa-thumbs-up fa-5x'></i>");
            $(this).removeAttr("class")
            $(this).attr("class","solidBad");
            })

      		 /*  function like(review_no, elem) {
   					if (($(elem).children().text() == '취소')) {
       				 	$(elem).children().attr('class', 'fa fa-regular fa-thumbs-up');
      					$(elem).children().text('좋아요');
       				 	updateLikeReview(review_no, 0);
        
  				 	} else if (($(elem).children().text() == '좋아요')) {
       					$(elem).children().attr('class', 'fa-solid fa-thumbs-up');
        				$(elem).children().text('취소');
       					updateLikeReview(review_no, 1);
   				 	}
				}
				function hate(review_no, elem){
	
   			 		if (($(elem).children().text() == '취소')) {
        				$(elem).children().attr('class', 'fa fa-regular fa-thumbs-down');
        				$(elem).children().text('싫어요');
        				updateLikeReview(review_no, 0);
    				} else if (($(elem).children().text() == '싫어요')) {
        				$(elem).children().attr('class', 'fa-solid fa-thumbs-down');
        				$(elem).children().text('취소');
        				updateLikeReview(review_no, -1);
  					}
				} */

				
 
        </script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>
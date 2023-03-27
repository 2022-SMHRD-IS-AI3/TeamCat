<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	String p_idx = request.getParameter("p_idx");
	
	String actionUrl = "ProductWriteCon.do";
	System.out.println("test : "+p_idx);
	System.out.println("test : "+p_idx);
	if(p_idx != null){
		actionUrl = "ProductUdateCon.do";
	}
	System.out.println("test : "+p_idx);
	if (info == null) {
		response.sendRedirect("/Kkeonaeng/Login/");
	} else {
	%>
	<div id="Product">
		<form action="<%= actionUrl %>" method="post" name="formData" enctype="multipart/form-data">
			<table id="list" border=1>
				<tr>
					<td>작성자</td>
					<input type="hidden" name="user_idx" id="user_idx"
						value="<%=info.getUser_idx()%>">
					<td>
						<%-- <%=info.getNick()%> --%>
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><select id="c_idx" name="c_idx">
							<option value="1">디지털기기</option>
							<option value="2">생활가전</option>
							<option value="3">가구/인테리어</option>
							<option value="4">생활/주방</option>
							<option value="5">유/아동</option>
							<option value="6">여성의류/잡화</option>
							<option value="7">뷰티/미용</option>
							<option value="8">스포츠/레저</option>
							<option value="9">취미/게임/음반</option>
							<option value="10">도서</option>
							<option value="11">반려동물용품</option>
							<option value="12">기타</option>
					</select></td>
				</tr>
				<tr>
					<td>물품명</td>
					<td><input type="text" name="p_name" id="p_name"></td>
				</tr>

				<tr>
					<td>가격</td>
					<td><input type="text" name="price" id="price"></td>
				</tr>
				<tr>
					<td colspan="2" >
						<input onchange="fileChange(this)" name="filename" type="file"	style="float: right;">
						<input type="hidden" name="fileExt" id="fileExt" value="">
		        		<input type="hidden" name="filesize" id="filesize" value="">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<img id="file_view" alt="" src="" style="object-fit: contain;width:315px;height:180px;">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td colspan="2">
					 <textarea placeholder="물품에 대해 설명해주세요" id="p_contents" name="p_contents" cols="40" rows="10" style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<td><button onclick="moveUrl('./Map/')">거래희망장소 ></button></td>
					<td>
						<input type="hidden" name="contact_gps" id="contact_gps">
						<input type="hidden" name="contact_addr" id="contact_addr">
						<span id="contact_addr_view"></span>
						<button type="button" onclick="addrDel()">x</button>	
					</td>
				</tr>
				<tr>
					<td colspan="2"> <input type="submit" value="작성하기"></td>
				</tr>
			</table>
		</form>
	</div>
	
	

	<script>

        let urlSearch = new URLSearchParams(location.search);
        if(location.search != ''){
        	
	        const el = document.getElementById("c_idx"); //select box의 option 갯수
	        const len = el.options.length; //select box의 option 갯수
	        //select box의 option 갯수만큼 for문 돌림
	        for (let i=0; i<len; i++){  
	        	//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
	          if(el.options[i].value == urlSearch.get('c_idx')){
	          	el.options[i].selected = true;
	          }
	        }  
	        document.getElementById('p_name').value = urlSearch.get('p_name');
	        document.getElementById('price').value = urlSearch.get('price');
	        document.getElementById('p_contents').value = urlSearch.get('p_contents');
	        document.getElementById('contact_gps').value = urlSearch.get('contact_gps');
	        document.getElementById('contact_addr').value = urlSearch.get('contact_addr');
	        document.getElementById('contact_addr_view').innerText = urlSearch.get('contact_addr');
        }

        const addrDel = () => {
            document.getElementById('contact_addr').value = '';
            document.getElementById('contact_addr_view').innerText = '';
        }

        const moveUrl = (loc) => {
            let form = document.formData;
            form.action = loc;
            form.method = "get";
            form.submit();
            
            
        }
        
        const fileChange =($target) => {
    	    var file = $target.files[0];
    	    document.getElementById('fileExt').value = (file.name).split('.')[1];
    	    document.getElementById('filesize').value = file.size;
        	var reader = new FileReader();
        	reader.onload = function(e) { 
    	      	document.getElementById('file_view').src = e.target.result;
    	    };
    	    reader.readAsDataURL(file);
        } 
    </script>
	<%
	}
	%>
</body>
</html>
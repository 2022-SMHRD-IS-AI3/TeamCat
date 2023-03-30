<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>꺼냉</title>
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
<link href="../../css/boardWriteStyles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c108db6a29.js" crossorigin="anonymous"></script>

<!--     <script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.form.js' type="text/javascript"
        language="javascript"></script>
    <script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MetaData.js' type="text/javascript"
        language="javascript"></script>
    <script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js' type="text/javascript"
        language="javascript"></script>
    <script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.blockUI.js' type="text/javascript"
        language="javascript"></script> -->

	<style>
        tr {
            border-bottom: 1px solid #dddddd
        }

        .input-file-button {
            padding: 6px 15px;
            background-color: #dddddd;
            border-radius: 4px;
            color: black;
            cursor: pointer;
            height: 65px;
            line-height: 3.2;
        }

        input {
            border: none;
            width: 100%;
        }

        #free {
            width: auto;
        }

        textarea {
            width: 100%;
            height: 6.25em;
            border: none;
            resize: none;
        }

        #divWrap {
            width: 245px;
            overflow-y: scroll;
        }

        #divWrap::-webkit-scrollbar {
            display: none;
        }

        #image_container {
            width: 145%;
            text-align: left;
        }

        #image_container > img {
            width: 67px;
            height: 67px;
            margin: 2px;
            object-fit: cover;
            border-radius: 10%;
        }


        #contact_addr {
            width: 100%;
            margin-bottom: 1rem;
        }

        .mapInput {
            margin-bottom: 0.1rem;
            font-weight: bold;
        }

		.me-3:hover {
		color:#527fef;
		cursor: pointer;
		}
		
        button {
            height: 40px;
            width: 150px;
            border-radius: 4px;
            border: none;
            background-color: #cccccc;
            color: #ffffff;
            font-family: sans-serif;
            margin: auto;
            display: block;

        }

        button:hover {
            background-color: #527fef;
            transition-duration: 0.3s;
        }

        #addr {
            font-size: 0.85rem;
        }
        
        #contact_addr {
        	margin-top: 10px;
        	border-bottom: 2px solid #cccccc;
        }
        
        
    </style>
</head>
<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	String p_idx = request.getParameter("p_idx");
	String actionUrl = "ProductWriteCon.do";
	String writeType = "글쓰기";
	String p_name = "";
	int price = 0;
	String p_contents = "";
	String contact_addr = "";
	String contact_gps = "";
	int c_idx = 0;
	if(p_idx != null){
		actionUrl = "ProductUpdateCon.do?p_idx="+p_idx;
		writeType = "글수정";
		
 		ProductDTO dto = new ProductDAO().ProductDetail(Integer.parseInt(p_idx));
		p_name = dto.getP_name();
		price = dto.getPrice();
		contact_addr = dto.getContact_addr();
		contact_gps = dto.getContact_gps();
		p_contents = dto.getP_contents();
		c_idx = dto.getC_idx();
		String[] gpsArr = contact_gps.split(",");	
		
	}
	
	if (info == null) {
		response.sendRedirect("/Kkeonaeng/Login/");
	} else {
		
	%>
	
	<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
                <span class="navbar-brand" style="font-weight: bold;">
                <a href="../" style="text-decoration-line: none; color: black;">
                <i class="fa-solid fa-chevron-left"></i>대여 <%=writeType %></a></span>
                <span id="submit" class="me-3" onclick="submitData()">완료</span>
            
        </div>
    </nav>
    
    
	 <!-- Page content-->
    <div class="container" style="padding-top: 20px;">
        <div class="text-center mt-5">
            <form name="formdata" method="post" action="ProductWriteCon.do" enctype="multipart/form-data">
                <input type="hidden" name="user_idx" id="user_idx" value="<%=info.getUser_idx()%>">
                <table class="table table-striped" style="border-collapse: collapse;">

                    <tr>
                        <td>
                            <input type="hidden" name="fileExt" id="fileExt" value="">
                            <input type="hidden" name="filesize" id="filesize" value="">
                            <input style="display:none;" type="file" id="file" name="filename" maxlength="5"
                                accept="image/png, image/jpg, image/jpeg" onchange="setThumbnail(event);"
                                multiple="multiple">
                            <label class="input-file-button" for="file" style="float: left;">
                                <i class="fa-solid fa-images"></i></label>

                        </td>
                        <td>
                            <div id="divWrap">

                                <div id="image_container">
                                	<% if(p_idx != null){ 
                                		String filename = "";
										String file = new FileDAO().fileSelect(new FileDTO(0, "product", Integer.parseInt(p_idx)));
													
										if (file != null) {
											filename = file;
										}
													
										%>
                                		<img src="/Kkeonaeng/file/<%= filename  %>">
                                	<%} %>
                                
                                </div>
                            </div>
                        </td>
                    </tr>
				<tr>
				<tr>
                    <td colspan="2"><input type="text" class="p_name" placeholder="글 제목" name="p_name"
                                id="p_name" maxlength="50" value="<%=p_name%>">
                    </td>

                </tr>
                <tr>
                    <td align="left">
                            카테고리
                    </td>
                    <td align="right">
                        <select id="c_idx" name="c_idx">
                            <option value="">-- 카테고리 --</option>
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
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <input type="text" class="price" placeholder="가격" name="price" id="price"maxlength="50" value="<%=price %>">

                    </td>
                    <td align="right">
                        무료 <input type="checkbox" name="free" id="free" value="무료">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea style="font-size: 13px;" class="content" placeholder="물품에 대한 상세 설명을 작성하세요.&#13;&#10;자세할수록 다른 고객이 물건 선택하는 데 도움이 돼요!" name="p_contents" id="myTextarea" maxlength="2048"></textarea>
                    </td>
                </tr>
                <!-- 카카오 맵 -->
                <tr>
                    <td align="left" colspan="2">
                    <details>
                    <summary>거래가능장소</summary>
                    
                        <div id="myDIV" align="left">
                            <p style="font-weight: bold;">만나서 거래할 때에는 안전한 공공장소에서 거래하세요.</p>
                            <p>원하는 거래 위치를 클릭하고 상세 장소명을 입력하세요.</p>
                            <div id="map" style="width:100%;height:350px;"></div>
                            <input type="hidden" name="contact_gps" id="contact_gps" value="<%=contact_gps %>">
                            <input type="text" id="contact_addr" name="contact_addr" placeholder="상세 장소를 입력해주세요" value="<%=contact_addr %>">
                        
                        </div>
                        </details>
                    </td>
                </tr>
       
			</table>
		</form>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=448887f9bc1535931929ada97487c31a"></script>
	<script>
	   let fileUploadCnt = 0;
	    function setThumbnail(event) {
	        
	    	
           for (var image of event.target.files) {
           	if (fileUploadCnt <= 5) {
	                fileUploadCnt++;
	                var reader = new FileReader();
	
	                reader.onload = function (event) {
	                	fileUploadCnt++;
	                    var img = document.createElement("img");
	                    img.setAttribute("src", event.target.result);
	                    document.querySelector("div#image_container").appendChild(img);
	                };
	
	                reader.readAsDataURL(image);
            	} else {
    	            alert("첨부 사진은최대 5장까지만 가능합니다.")
    	            break;
	    	    }
	        }
	       
	    }
		
	    // 접기
		var bDisplay = true;
        function doDisplay() {
            var con = document.getElementById("myDIV");

            if (con.style.display == 'none') {
                con.style.display = 'block';

            } else {
                con.style.display = 'none';
            }
        }
		
		/* for (var i = 0; i < target.length; i++) {
            target[i].addEventListener('click', function () {
                targetID = this.getAttribute('href');
                document.querySelector(targetID).style.display = 'block';
            });
        } */
		
		
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
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨 
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon);

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

        displayMarker(locPosition);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);

        kakao.maps.event.addListener(map, 'drag', function () {
            var latlng = map.getCenter();
            marker.setPosition(latlng);
            //marker.setPosition(latlng);

            document.getElementById('contact_gps').value = latlng.getLat() + "," + latlng.getLng();
        });

        kakao.maps.event.addListener(map, 'zoom_changed', function () {
            var latlng = map.getCenter();
            marker.setPosition(latlng);
            //marker.setPosition(latlng);

            document.getElementById('contact_gps').value = latlng.getLat() + "," + latlng.getLng();
        });

    }
    // ProductUpdate - 수정
    var textarea = document.getElementById("myTextarea");
    textarea.value = "<%=p_contents %>"
 
    	let arr = [{k:"1",v:"디지털기기"},{k:"2",v:"생활가전"},{k:"3",v:"가구/인테리어"},{k:"4",v:"생활/주방"},{k:"5",v:"유/아동"},{k:"6",v:"여성의류/잡화"},{k:"7",v:"뷰티/미용"},{k:"8",v:"스포츠/레저"},
    		{k:"9",v:"취미/게임/음반"},{k:"10",v:"도서"},{k:"11",v:"반려동물용품"},{k:"12",v:"기타"}];
    	
    	var optionHtml = '<option value="">--카테고리--</option>';
    	for(var j=0;j<arr.length;j++){
    		var selected = '';
    		if(arr[j].k == <%=c_idx%>){
    			selected = 'selected';
    		}
    		optionHtml +=`<option value="${arr[j].k}" ${selected}>${arr[j].v}</option>`;
    	}
    	document.getElementById('c_idx').innerHTML = optionHtml;
    	
    	
    	function submitData(){
    		
    		var input1 = document.getElementById("p_name").value;
    		var input2 = document.getElementById("c_idx").value;
    		var input3 = document.getElementById("myTextarea").value;
    		var input4 = document.getElementById("contact_addr").value;
    		var input5 = document.getElementById("contact_gps").value;
    		var input6 = document.getElementById("file").value;
    	
    		if (input1 == "") {
    			alert("글 제목을 입력해주세요.");
    			return;
    		}
    		if (input2 == "") {
    			alert("카테고리를 입력해주세요.");
    			return;
    		}
    		if (input3 == "") {
    			alert("물품에 대한 내용을 입력해주세요.");
    			return;
    		}
    		if (input4 == "") {
    			alert("거래 할 장소를 체크해주세요.");
    			return;
    		}
    		if (input5 == "") {
    			alert("상세장소를 입력해주세요.");
    			return;
    		}
    		if (input6 == "") {
    			alert("사진을 올려주세요.");
    			return;
    		}	
    		
    		let formdata = document.formdata;
    		formdata.action = "<%=actionUrl %>";
    		formdata.submit();		 		
    	}
			
    </script>
	<%
	}
	%>
	
</body>
</html>
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
    <script src="https://kit.fontawesome.com/c108db6a29.js" crossorigin="anonymous"></script>

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
	if(p_idx != null){
		actionUrl = "ProductUpdateCon.do?p_idx="+p_idx;
		writeType = "글수정";
		
 		ProductDTO dto = new ProductDAO().ProductDetail(Integer.parseInt(p_idx));
		p_name = dto.getP_name();
		price = dto.getPrice();
		contact_addr = dto.getContact_addr();
		contact_gps = dto.getContact_gps();
		p_contents = dto.getP_contents();
		p_contents = dto.getP_contents();
		p_contents = dto.getP_contents();
		
	}
	
	if (info == null) {
		response.sendRedirect("/Kkeonaeng/Login/");
	} else {
		
	%>
	
	<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a href="../" style="text-decoration-line: none;">
                <i class="fa-solid fa-chevron-left"></i>
                <span class="navbar-brand">대여 <%=writeType %></span>
            </a>

            
                <span class="me-3" onclick="submitData()">완료</span>
            
        </div>
    </nav>
    
	 <!-- Page content-->
    <div class="container">
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

                                <div id="image_container"></div>
                            </div>
                        </td>
                    </tr>
				<tr>
				<tr>
                    <td colspan="2"><input type="text" class="p_name" placeholder="글 제목" name="p_name"
                                maxlength="50" value="<%=p_name%>">
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
                        <input type="text" class="price" placeholder="가격" name="price" maxlength="50">

                    </td>
                    <td align="right">
                        무료 <input type="checkbox" name="free" id="free" value="무료">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea class="content" placeholder="물품에 대한 내용을 작성하세요." name="p_contents" maxlength="2048"></textarea>
                    </td>
                </tr>
                <!-- 카카오 맵 -->
                <tr>
                    <td align="left" colspan="2">
                    거래가능장소<span class="addrText"></span>
                    
                        <i onclick="doDisplay()" class="fa-solid fa-angle-down" style="float:right;"
                            style="padding: 0;"></i>
                        <div id="myDIV" align="left">
                            <p style="font-weight: bold;">만나서 거래할 때에는 안전한 공공장소에서 거래하세요.</p>
                            <p>원하는 거래 위치를 클릭하고 상세 장소명을 입력하세요.</p>
                            <div id="map" style="width:100%;height:350px;"></div>
                            <input type="hidden" name="contact_gps" id="contact_gps">
                            <input type="text" id="contact_addr" name="contact_addr" placeholder="상세 장소를 입력해주세요">
                        </div>
                        <div>
                            <button type="button" onclick="saveAddr()">거래장소선택완료</button>
                        </div>
                    </td>
                </tr>
				
			</table>
		</form>
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
    
    
    	function submitData(){
    		
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
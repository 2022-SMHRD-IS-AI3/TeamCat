<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>꺼냉</title>
<style>
        body{
            max-width: 768px;
            min-width: 320px;
            width: 100%;
            min-height: 100%;
            height: 100%;
            position: relative;
            color: #212529;
            background-color: #fff;
        }
        #carouselExampleIndicators{
            width: 100vw;
            height: 100vh;
        }
        .close-btn{
            cursor: pointer;
            outline: none;
            border: none;
            position: absolute;
            right: 10px;
            top: 10px;
            background-color: transparent;
            z-index: 1;
        }
        .carousel-item img{
            height: 100vh;
        }
        

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
<button class="close-btn" onclick="moveBack()">
        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M17.6585 4.92888C18.049 4.53836 18.6822 4.53835 19.0727 4.92888C19.4632 5.3194 19.4632 5.95257 19.0727 6.34309L13.4158 12L19.0727 17.6568C19.4632 18.0473 19.4632 18.6805 19.0727 19.071C18.6822 19.4615 18.049 19.4615 17.6585 19.071L12.0016 13.4142L6.34481 19.071C6.3387 19.0771 6.33254 19.0831 6.32632 19.089C5.93455 19.4614 5.31501 19.4554 4.93059 19.071C4.6377 18.7781 4.56447 18.3487 4.71092 17.9876C4.75973 17.8672 4.83296 17.7544 4.93059 17.6568L10.5874 12L4.93059 6.34314C4.54006 5.95262 4.54006 5.31945 4.93059 4.92893C5.32111 4.5384 5.95428 4.5384 6.3448 4.92893L12.0016 10.5857L17.6585 4.92888Z" fill="black"/>
            </svg>
            
    </button>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>

        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20220912_144%2F1662950226101Qs9Dg_JPEG%2F64086060925487258_913395479.jpeg&type=sc960_832" class="d-block w-100" alt="..." >
          </div>
          <div class="carousel-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202212%2F910FBF5DFF2F7232CD6D3D973455205F36E5B0958746704E204C62412732C443.jpg%3Fq%3D95%26s%3D1440x1440%26t%3Dinside&type=sc960_832" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20221209_221%2F1670513926914u7s2s_JPEG%2F71649706639394358_152560993.jpeg&type=sc960_832" class="d-block w-100" alt="..." >
          </div>
          <div class="carousel-item">
            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMDVfMTgx%2FMDAxNjcwMjM3OTA5ODky.TQUg5J68hpPX6OzvbdMjsonemHceplK73zWU2U5h7DIg.-XqlIqkviYSwlHIXHEyzuBp9oSC0vHB3eKtoE6lYzWAg.JPEG.indigo723%2F50_%252814%2529.jpg&type=sc960_832" class="d-block w-100" alt="..."> 
          </div>
          <div class="carousel-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202109%2Fd49036289a3c6c7a98f0dec0382dae8749445cde1f0ba34919cf1799d16f7f79.webp%3Fq%3D95%26s%3D1440x1440%26t%3Dinside&type=sc960_832" class="d-block w-100" alt="..." ">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    <!-- </section> -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

	<script type="text/javascript">
	
	const moveBack = () =>{
    		window.history.back();
    	}
	</script>
	
</body>
</html>
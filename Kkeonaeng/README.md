![header](https://capsule-render.vercel.app/api?type=Wave&color=0:527fef,100:00d4ff&height=250&section=header&text=&fontSize=70&fontColor=101647)


# 1. 프로젝트 개요
**주제 : 지도 api를 활용한 내 주변 이웃 간 C2C 물건 대여 서비스 플랫폼**

* 대여해줄 물건 등록과 물건 예약을 할 수 있고, 거래 완료 후 리뷰를 작성할 수 있게 기능 제공
* 필요한 물건을 찾을 수 있게 검색기능 제공
* 물건 상세페이지에서 대여자에게 메시지 보내기가 가능하게 메시지 기능 제공
* 마음에 드는 물건을 관심등록 후 목록에서 확인 가능할 수 있게 기능 제공

**프로젝트 명 : 꺼냉**

**프로젝트 팀명 : Team Cat**

**프로젝트 기간 : 2023.03.21 ~ 2023.04.02**

# 2. 주요기능
### 개발 목표 : 지도 API를 사용하여 위치를 확인하고 내 주변에서 쉽게 물건을 대여할 수 있는 온라인 대여 서비스 개발


### 개발 내용 
* 가입 시 입력한 행정구역 정보로 내 근처 물건 확인가능
* 대여자와 예약자 간 메시지 전송 기능
* 회원간의 신뢰도를 높이기 위해 리뷰 작성 기능
* 사용자의 편의성을 위해 카카오 계정 간편 가입 기능


# 3. 개발환경
![image](https://user-images.githubusercontent.com/108473234/229777704-6c7c555b-f450-4592-a462-1592432541be.png)

# 4. 유스케이스
![image](https://user-images.githubusercontent.com/108218039/230032604-89210049-fc51-48a1-9c28-c27f6d708ba4.png)

# 5. 주요 기능
### **1. 예약하기**
![image](https://user-images.githubusercontent.com/108473234/229787214-4b639245-47dc-4925-a8d8-35ef7fb7dd62.png)


### **2. 위치 선택**
- 게시글 작성시 거래 원하는 장소 선택 가능
- 가입시 받은 행정구역 정보로 나와 같은 행정구의 사람들이 쓴 글이 게시판에 노출


### **3. 카카오로 로그인 및 회원가입**
- 사용자 편의를 위한 간편 가입


### **4. 메시지 기능**
- 개인정보 노출 없이 대화 가능한 메시지 기능 구현
- 사전 대화로 예약시 불편함 줄임


### **5. 리뷰**
- 거래 신뢰도를 높이기 위해 리뷰 작성
- 작성자는 리뷰 삭제 불가


# 6. ER다이어그램
![image](https://user-images.githubusercontent.com/108473234/229778068-981d0a16-9ae5-4295-a940-e25ad9489b38.png)

# 7. WEB 페이지
* 메인화면 및 로그인 / 회원가입 페이지
![image](https://user-images.githubusercontent.com/108473234/229782552-b55ddca9-62af-4f8d-820f-53a961551649.png)


* 게시글 작성 페이지
![image](https://user-images.githubusercontent.com/108473234/229785542-bc0b0cd1-1010-4ec1-8d62-3aaef5b5d68d.png)


* 물건 목록 / 물건 상세 & 거래장소 확인 가능
![image](https://user-images.githubusercontent.com/108473234/229783358-480ed7dc-a98d-4a7e-9c06-311278680fa9.png)


* 물건 예약 및 예약후 물건상세 페이지
![image](https://user-images.githubusercontent.com/108473234/229783908-59d253aa-6dbb-4ab8-bb64-9bc10e7f79f3.png)


* 다른 사람 프로필 확인 페이지 / 마이페이지 / 내 물건 예약자 목록 페이지
![image](https://user-images.githubusercontent.com/108473234/229784867-432613f4-7a47-4236-80bd-b1033ab09251.png)


* 검색 및 최근 검색어 / 검색 결과 페이지
![image](https://user-images.githubusercontent.com/108473234/229785355-7e27b3c1-b767-421c-8e88-f67fa9673417.png)


* 마이페이지 / 내가받은리뷰 / 꺼냉 사용법 안내 페이지
![image](https://user-images.githubusercontent.com/108473234/229785831-33c83c27-b037-48d4-8ee0-3c86ad67cb18.png)


# 8. 모델개발 트러블 슈팅
1. 카카오맵 api를 사용하여 지도 생성하기
![image](https://user-images.githubusercontent.com/108473234/229788637-71d4329d-44db-4e9c-a3da-8c1db5e081f9.png)


2. 웹소켓으로 실시간 채팅 기능 만들기
![image](https://user-images.githubusercontent.com/108473234/229788777-4d31a3ba-88cd-4ea8-952f-d19350eea529.png)


# 9. 팀원 단위 업무 분장
![image](https://user-images.githubusercontent.com/108473234/229778924-292c70f5-e86f-4af8-833c-affbeeffce97.png)

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile {
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
            box-shadow: 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 6px 16px 0 rgba(0, 0, 0, 0.08), 0 9px 28px 8px rgba(0, 0, 0, 0.05);
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

        .input,
        button,
        select,
        textarea {
            font-family: inherit;
            line-height: inherit;
        }

        .button,
        html input[type="button"],
        input[type="reset"],
        input[type="submit"] {

            cursor: pointer;
        }

        .button,
        select {
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
            border: none;
            outline: none;
            color: #303441;
            width: 300px;
        }



        .Recommend {
            margin: 8px 0;
        }

        .Recommend__header {
            /* display: flex; */
            /* justify-content: space-between;
            align-items: flex-end; */
            /* padding: 0 20px 4px 20px; */
            height: 590px;
            margin: 8px 0 0 0;
            padding-top: 12px;
        }

        .Recommend__title {
            font-size: 16px;
            font-weight: bold;
            color: #303441;
            padding-bottom: 10px;
            padding-left: 18px;
        }

        .Recommend__list {
            padding: 0 0 24px 0;
        }

        .Recommend__item {
            padding: 0 20px;
            height: 48px;
            display: flex;
            align-items: center;
            white-space: nowrap;
            background-color: #ffffff;
            transition: background-color .2s;
        }

        .Recommend__item-order {
            color: #303441;
            font-size: 14px;
            font-weight: bold;
            width: 24px;
            text-align: left;
        }

        .Recommend__item-label {
            color: #555969;
            font-size: 15px;
            padding-top: 4px;
        }

        * {
            box-sizing: border-box;
        }

        .SearchHistory__clear-button {
            float: right;
            margin-right: 10px;
            font-size: 13px;
            color: #116ad4;
            background-color: transparent;
            border: none;
            outline: none;
            /* display: flex; */
            justify-content: center;
            align-items: center;
            padding-left: 200px;
            transition: opacity 0.2s;
        }

        .SearchFormModal__clear-button {
            position: absolute;
            right: 4%;
            background-color: transparent;
            border: none;
            height: 52px;
            flex-shrink: 0;
        }

        .close {
            height: 19px;
            position: absolute;
            left: 88%;
        }
        .SearchFormModal__clear-button img{
            opacity: 0.6;
        }
        
    </style>
</head>

<body>

	<%
	System.out.println(123);
		%>
    <div>
        <div class="KmongDialog KmongDialog--backdrop KmongDialog--fullscreen KmongDialog--mobile">
            <div class="KmongDialog__container">
                <div class="KmongDialog__content">
                    <div class="SearchFormModal">
                        <div class="SearchFormModal__header">
                            <button onclick="moveUrl('../Main.jsp')" type="button" class="SearchFormModal__close">
                                <img src="../img/small-caret-left.svg" alt="">

                            </button>
                            <span><input id="searchText" onkeyup="if(window.event.keyCode==13){search()}" placeholder="검색어를 입력하세요." type="text" maxlength="15" autocomplete="off"
                                    autocorrect="off" autocorrect="off" autocapitalize="off" autofocus="autofocus"
                                    class="SearchFormModal__input">
                                    <button type="button" class="SearchFormModal__clear-button">
                                        <img src="close-circle.svg" alt="">
                                    </button>
                            </span>
                        </div>
                        <div class="SearchFormModal__body">
                            <div>
                                <div class="Recommend">
                                    <div class="Recommend__header">
                                        <div class="Recommend__title">
                                            최근 검색어
                                            <button type="button" class="SearchHistory__clear-button">전체삭제</button>
                                        </div>
                                        <div class="Recommend__list">
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">1</span>
                                                <span class="Recommend__item-label">드릴</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">2</span>
                                                <span class="Recommend__item-label">텐트</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">3</span>
                                                <span class="Recommend__item-label">테이블</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">4</span>
                                                <span class="Recommend__item-label">도서</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">5</span>
                                                <span class="Recommend__item-label">유아용 가구</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">6</span>
                                                <span class="Recommend__item-label">스캐너</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">7</span>
                                                <span class="Recommend__item-label">정장</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">8</span>
                                                <span class="Recommend__item-label">군복</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">9</span>
                                                <span class="Recommend__item-label">망치</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                            <div class="Recommend__item">
                                                <span class="Recommend__item-order">10</span>
                                                <span class="Recommend__item-label">간이의자</span>
                                                <span class="close"><svg width="24" height="24" viewBox="0 0 24 24"
                                                        fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M4.57715 18.7174L11.2946 12L4.57715 5.28247L5.28426 4.57537L12.0017 11.2928L18.7193 4.57532L19.4264 5.28242L12.7088 12L19.4264 18.7175L18.7193 19.4246L12.0017 12.7071L5.28426 19.4246L4.57715 18.7174Z"
                                                            fill="black" />
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    
    	const search = () =>{
    		let searchData = document.getElementById('searchText').value;
    		if(searchData.length > 0){
	    		moveUrl('./Product/?search='+searchData);
    			
    		}
    	}
    	const moveUrl = (url)=>{
    		location.href=url;
    	}
    </script>
</body>
</html>
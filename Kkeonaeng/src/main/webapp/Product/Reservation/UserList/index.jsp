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

.content {
	font-size: 15px;
	margin-left: 10px;
}

.zzzz {
	padding-bottom: 15px;
	border-bottom: 1px solid #C0C0C0;
}

.notbad {
	padding-left: 20px;
	padding-right: 20px;
}

.bbttnn {
	width: 105px;
	height: 35px;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
	border: 1px solid #C0C0C0;
}

.bbttnn:focus {
	color: #527fef;
	border-color: #527fef;
	background-color: white;
	border: 2px solid;
}

.good {
	padding-left: 20px;
}

.date {
	padding-right: 17px;
	color: #808080;
}
</style>
</head>
<body>예약자목록페이지입니다
</body>
</html>
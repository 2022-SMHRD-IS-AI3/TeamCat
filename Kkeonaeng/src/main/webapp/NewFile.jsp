<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<div>
		<form action="WishlistDeleteCon.do">
			<table>
				<tr>
					<td>찜 누른사람(user_idx)</td>
					<td><input type="text" name="user_idx"></td>
				</tr>
				<tr>
					<td>물건 순번(p_idx)</td>
					<td><input type="text" name="p_idx"></td>
				</tr>
				<tr>
					<td></td>
					<td><button>적용</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/basic_view_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UTF-8</title>
</head>
<body>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<div style="width: 1300px; text-align: center;">
		<h2>아이템정보 입력</h2>
		<form action="/bbs/Item/iteminsert" method="post" enctype="multipart/form-data" >
			<table style="width: 100%;">
				<tr>
					<td>
						<select name="category" style="width: 607px; height: 50px;">
							<option value="top">상의</option>
							<option value="bottom">하의</option>
							<option value="shoes">신발</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="itemname" placeholder="상품 이름" style="font-size:15px; width: 600px; height: 50px;"></td>
				</tr>
				<tr>
					<td><input type="text" name="itemsize" placeholder="상품 사이즈" style="width: 600px; height: 50px;"></td>
				</tr>
				<tr>
					<td><input type="text" name="itemprice" placeholder="상품 가격" style="width: 600px; height: 50px;"></td>
				</tr>
				<tr>
					<td><input type="text" name="itemcolor" placeholder="상품 색상" style="width: 600px; height: 50px;"></td>
				</tr>
				<tr>
					<td><input type="file" name ="file" style="width: 300px; height: 50px;"></td>
				</tr>
			</table>
			<input type="submit" value="상품 등록하기" style="color:white; font-size:18px; background-color:#3366FF; width: 600px; height: 50px;">
		</form>
	</div>
	
</body>
</html>
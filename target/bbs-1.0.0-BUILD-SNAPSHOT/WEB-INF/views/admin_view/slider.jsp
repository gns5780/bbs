<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/basic_view_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<div style="width: 1300px; text-align: center;">
		<h2>슬라이더 파일 변경</h2>
		<h4>jpg파일  width:1300px height:600px </h4>
		<form action="/bbs/Slider/insert" method="post" enctype="multipart/form-data" >
			<table style="margin-left: auto; margin-right: auto;" border="1">
				<tr>
					<td>1번슬라이더</td>
					<td><input type="file" name ="mainslider1"></td>
				</tr>
				<tr>
					<td>2번슬라이더</td>
					<td><input type="file" name ="mainslider2"></td>
				</tr>
				<tr>
					<td>3번슬라이더</td>
					<td><input type="file" name ="mainslider3"></td>
				</tr>
				<tr>
					<td>4번슬라이더</td>
					<td><input type="file" name ="mainslider4"></td>
				</tr>
			</table>
			<input type="submit" value="슬라이더 등록하기" style="color:white; font-size:18px; background-color:#3366FF; width: 600px; height: 50px;">
		</form>
	</div>
	
</body>
</html>
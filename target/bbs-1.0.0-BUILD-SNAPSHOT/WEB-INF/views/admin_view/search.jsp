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
	<br>
	<h2 style="text-align: center;">검색어 순위 조회</h2>
	<table border="1" style="margin-left: auto; margin-right: auto; border-collapse: collapse; text-align: center; width: 700px;">
		<tr style="background-color: #f5f5f5; text-align: center;">
			<td>키워드</td>
			<td>검색수</td>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr style="background-color: #f5f5f5; text-align: center;">
				<td>${dto.name}</td>
				<td>${dto.num}</td>								
			</tr>
		</c:forEach>
	</table>
</body>
</html>
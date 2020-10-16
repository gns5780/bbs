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
	<h2 style="text-align: center;">전체회원정보 조회</h2>
	<table border="1" style="margin-left: auto; margin-right: auto; border-collapse: collapse; text-align: center; width: 100%;">
		<tr style="background-color: #f5f5f5; text-align: center;">
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>주소</td>
			<td>휴대폰번호</td>
			<td>email</td>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr style="background-color: #f5f5f5; text-align: center;">
				<td>${dto.id}</td>
				<td>${dto.pw}</td>
				<td>${dto.name}</td>
				<td>${dto.address}</td>
				<td>${dto.phonenum}</td>
				<td>${dto.email}</td>								
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
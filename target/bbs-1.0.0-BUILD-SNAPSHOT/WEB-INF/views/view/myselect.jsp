<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/basic_view_top.jsp" %>
<%@include file="../include/msg.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<script type="text/javascript">
		function mydelete(){
			var pw = prompt('패스워드를 입력해주세요');
			location.href = '/bbs/User/deletemy?pw='+ pw;
		}
	</script>
	<div style="text-align: center;">
		<h2>내 정보</h2>
		<table border="1" style="margin-left: auto; margin-right: auto; width: 1000px; height: 150px;">
			<tr >
				<td rowspan="4">${dto.name}(${dto.id })</td>
			</tr>
			<tr >
				<td>이메일</td>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<td>전화</td>
				<td>${dto.phonenum}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${dto.address}</td>
			</tr>
		</table>
		<br>
		<input type="button" value="정보 수정" onclick="location.href='/bbs/User/updatemy'" style="width: 250px; height: 70px; background-color: black; color: white; font-size: 13px;">
		<input type="button" value="회원 탈퇴" onclick="mydelete();" style="width: 250px; height: 70px; background-color: black; color: white; font-size: 13px; margin-left: 20px;">
		<br><br>
		<input type="button" value="내 질문목록" onclick="location.href='/bbs/Board/selectallmy'" style="width: 530px; height: 70px; background-color: black; color: white; font-size: 13px;">
	</div>
	
</body>
</html>
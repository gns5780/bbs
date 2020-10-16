<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/basic_view_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_main</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<div style="text-align: center;">
		<input type="button" value="Q&A/질문목록"  onclick="location.href='/bbs/Board/selectall'" style="width: 500px; height: 110px; font-size: 30px; background-color: white; color: gray; margin-right: 20px;">
		<input type="button" value="Q&A/질문하기"  onclick="location.href='/bbs/Board/insert'" style="width: 500px; height: 110px; font-size: 30px; background-color: white; color: gray;">
	</div>
	<br>
	
	<form action="/bbs/Board/selectall" method="post" name="selectform" style="text-align: center;">
		<input type="button" value="내질문목록" onclick="location.href='/bbs/Board/selectallmy'" style="height: 30px; width: 140px; background-color: white; color:black;">
		<input type="button" value="FAQ/자주찾는질문" onclick="location.href='/bbs/Board/selectallread'" style="height: 30px; width: 140px; background-color:gray; color:white;">
		<input type="text" name="findValue" style="border: 1; width: 500px; height: 30px; border-radius: 10px; border-width: 2px; text-align: center;">
		
		<select name="findKey" style="height: 30px; width: 70px; font-size: 15px;">
			<option value="subject">제목</option>
			<option value="userid">작성자</option>
			<option value="content">내용</option>
			
		</select>
	</form>
	<br>
	<table style="margin-left: auto; margin-right: auto; border-collapse: collapse; width: 100%;">
		<tr style="text-align: center; background-color:#f5f5f5;" >
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일자</th>
			<th>조회수</th>
			<th>답변</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr style="text-align: center; background-color:#f5f5f5;" onclick="location.href='/bbs/Board/selectone?num=${dto.num}'">
				<td style="padding: 4px;">${dto.num}</td>
				<td>${dto.userid}</td>
				<c:forEach begin="1" end="${dto.re_level*2}">
						&nbsp;
				</c:forEach>
				<c:if test="${dto.re_level !=0 }"><img src="/bbs/img/reply.png" style="width: 15px; height: 15px;"></c:if>
				<td>${dto.subject}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td><c:if test="${dto.re_step eq 1}">완료</c:if> </td>
			</tr>
		
		</c:forEach>
	</table>
	
	
	
	
</body>
</html>
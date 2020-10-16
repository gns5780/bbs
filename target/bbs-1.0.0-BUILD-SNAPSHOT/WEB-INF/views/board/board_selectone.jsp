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
	<div style="text-align: center;">
		<input type="button" value="Q&A/질문목록"  onclick="location.href='/bbs/Board/selectall'" style="width: 500px; height: 110px; font-size: 30px; background-color: white; color: gray; margin-right: 20px;">
		<input type="button" value="Q&A/질문하기"     onclick="location.href='/bbs/Board/insert'" style="width: 500px; height: 110px; font-size: 30px; background-color: white; color: gray;">
	</div>
	<br>
	
	<form action="/bbs/Board/selectall" method="post" name="selectform" style="text-align: center;">
		<input type="button" value="내질문목록" onclick="location.href='/bbs/Board/selectallmy'" style="height: 30px; width: 140px; background-color: white; color:black;">
		<input type="button" value="FAQ/자주찾는질문" onclick="location.href='/bbs/Board/selectallread'" style="height: 30px; width: 140px; background-color: white; color:black;">
		<input type="text" name="findValue" style="border: 1; width: 500px; height: 30px; border-radius: 10px; border-width: 2px; text-align: center;">
		
		<select name="findKey" style="height: 30px; width: 70px; font-size: 15px;">
			<option value="subject">제목</option>
			<option value="userid">작성자</option>
			<option value="content">내용</option>
			
		</select>
	</form>
	<br>

	<div style="text-align: center;">
		<form name="updateform">
			<table border="1" style="margin-left: auto;margin-right: auto; border-collapse: collapse;">
				<tr style="background-color:#f5f5f5;">
					<td>작성자</td>
					<th >${dto.userid }</th>
					<td>조회수</td>
					<th>${dto.readcount }</th>
				</tr>
				<tr style="background-color:#f5f5f5;">
					<td>제목</td>
					<th>${dto.subject }</th>
					<td>작성일자</td>
					<th>${dto.reg_date}</th>
				</tr>
				
				<tr style=" background-color: #f5f5f5;">
					<td>내 용</td>
					<th colspan="3"><textarea rows="30" cols="100" readonly="readonly" style="background-color: #f5f5f5; border: 0px;" >${dto.content}</textarea></th>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<c:if test="${loginCheck eq dto.userid }">
		<div style="text-align: center;">
			<input type="button" value="삭제하기" onclick="location.href='/bbs/Board/delete?num=${dto.num}'" style="background-color: #555555; color: white; width: 110px; height: 30px;">
		</div>
	</c:if>
	<br><br>
	<!---답글---------------------------------------------------------------------------------------------------------------------->
	<c:if test="${redto.content ne NULL }">
		<div style="text-align: center;">
			<form name="updateform">
				<table border="1" style="margin-left: auto;margin-right: auto; border-collapse: collapse;">
					<tr style="background-color: #f5f5f5;">
						<td>작성자</td>
						<th >${redto.userid }</th>
						<td>조회수</td>
						<th>${redto.readcount }</th>
					</tr>
					<tr style="background-color: #f5f5f5;">
						<td>제목</td>
						<th>${redto.subject }</th>
						<td>작성일자</td>
						<th>${redto.reg_date}</th>
					</tr>
					
					<tr style="background-color: #f5f5f5;">
						<td>내 용</td>
						<th colspan="3"><textarea rows="30" cols="100" readonly="readonly" style="background-color: #f5f5f5; border: 0px;">${redto.content}</textarea></th>
					</tr>
				</table>
			</form>
		</div>
		<br><br>
	</c:if>
	
	<c:if test="${redto.content eq NULL }">
		<h2 style="text-align: center;">아직 답변이없습니다.</h2>
	</c:if>
	
	<script type="text/javascript">
			function board_replyinsert(){
				if(replyinsertform.subject.value==''){
					alert('제목을 입력하세요');
				}else if(replyinsertform.content.value==''){
					alert('내용을 입력하세요');
				}else{
					replyinsertform.action="/bbs/Board/replyinsert";
					replyinsertform.submit();
				}
			}
		</script>
	
	
	<c:if test="${loginCheck eq 'admin' }">
		<c:if test="${redto.content eq NULL }">
			<div style="text-align: center;">	
				<br><hr style="width: 300%; left: 100%;">
				<h2>관리자 답변달기</h2>
				<form name="replyinsertform">
					<input type="hidden" name=num value="${dto.num}">
					<table border="1"  style="margin-left: auto; margin-right: auto; border-collapse: collapse;">
						<tr style="background-color: #f5f5f5;">
							<td style="text-align: center;">제목</td>
							<td><input type="text" name="subject" style="width: 90%; height: 100%; border: 0ex; background-color: #f5f5f5;"></td>
						</tr>
						<tr style="background-color: #f5f5f5;">
							<td style="text-align: center;">내용</td>
							<td><textarea rows="20" cols="70" name="content" style="border: 0px; background-color: #f5f5f5;"></textarea></td>
						</tr>
					</table>
					<br>
					<div style="text-align: center;"><input type="button" onclick="board_replyinsert();" value="등록하기" style="font-size:30px; background-color: black; color: white; height: 100px; width: 590px;"></div>
				</form>
			</div>
		</c:if>
		<c:if test="${redto.content ne NULL }">
			<div style="text-align: center;"><input type="button" value="답변 삭제하기" onclick="location.href='/bbs/Board/replydelete?num=${dto.num}'" style="font-size: 20px; background-color: black; color: white;height: 70px; width: 200px;"></div>
		</c:if>
	</c:if>
	<br><br><br><br><br><br>
	
	
</body>
</html>
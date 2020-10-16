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
	<script type="text/javascript">
		function main_move(){
			if(insertform.content.value != '' ||insertform.subject.value !=''){
				if(confirm('이동시 작성된 정보는 삭제됩니다.이동 하시겠습니까?')){
					location.href='/bbs/Board/selectall';
				}
			}else{
				location.href='/bbs/Board/selectall';
			}
		}
	</script>
	<div style="text-align: center;">
		<input type="button" value="Q&A/질문목록"  onclick="location.href='/bbs/Board/selectall'" style="width: 500px; height: 110px; font-size: 30px; background-color: white; color: gray; margin-right: 20px;">
		<input type="button" value="Q&A/질문하기"     onclick="location.href='/bbs/Board/insert'" style="width: 500px; height: 110px; font-size: 30px; background-color:gray; color: white;">
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
	
	<script type="text/javascript">
		function board_insert(){
			if(insertform.subject.value==''){
				alert('제목을 입력하세요');
			}else if(insertform.content.value==''){
				alert('내용을 입력하세요');
			}else{
				insertform.action="/bbs/Board/insert";
				insertform.submit();
			}
		}
	</script>
	<form method="post" name="insertform">
		<table border="1" style="margin-left: auto; margin-right: auto; width:650px; border-collapse: collapse; background-color:#f5f5f5;">
			<tr>
				<td style="text-align: center; width: 60px; height: 40px;">제목</td>
				<td><input type="text" name="subject" style="width: 90%; height: 40px; border: 0ex; background-color:#f5f5f5;"></td>
			</tr>
			<tr>
				<td style="text-align: center;">내용</td>
				<td><textarea rows="20" cols="70" name="content" style="border: 0px; background-color:#f5f5f5;"></textarea></td>
			</tr>
		</table>
		<br>
		<div style="text-align: center;"><input type="button" onclick="board_insert();" value="등록하기" style="font-size:30px; background-color: black; color: white; height: 100px; width: 590px;"></div>
	</form>
	
	
	
	
	
	
</body>
</html>
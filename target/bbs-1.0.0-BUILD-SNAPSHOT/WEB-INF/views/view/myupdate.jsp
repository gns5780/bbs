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
	<script type="text/javascript">
		function myupdate(){
			if(updateform.pw.value==''){
				alert('수정할 패스워드를 입력해주세요');
				updateform.pw.focus();
			}else if(updateform.repw.value==''){
				alert('수정할 패스워드확인을 입력해주세요');
				updateform.repw.focus();
			}else if(updateform.pw.value != updateform.repw.value){
				alert('수정할 패스워드가 서로 다릅니다');	
				updateform.pw.focus();
			}else if(updateform.email.value==''){
				alert('수정할 이메일을 입력해주세요');
				updateform.email.focus();
			}else if(updateform.phonenum.value==''){
				alert('수정할 전화번호를 입력해주세요');
				updateform.phonenum.focus();
			}else if(updateform.address.value==''){
				alert('수정할 주소를 입력해주세요');
				updateform.address.focus();
			}
			else{
				var lodpw = prompt('패스워드를 입력해주세요');
				updateform.action='/bbs/User/updatemy?lodpw='+lodpw;
				updateform.submit();
			}
		}
		function goPopup(){
			var popupWidth = 570;
			var popupHeight = 420;
			
			var popupX = (window.screen.width / 2) - (popupWidth/2);
			var popupY = (window.screen.height / 2) - (popupHeight/2);
			
			var pop = window.open("/bbs/resources/juso_api/jusoPopup.jsp","pop","width="+popupWidth+",height="+popupHeight+", scrollbars=yes, resizable=yes, left="+ popupX + ", top="+ popupY); 
			
			joinform.phonenum.focus();
		}
		function jusoCallBack(roadFullAddr){
			document.updateform.address.value = roadFullAddr;
		}
	</script>
	<div style="text-align: center;">
		<h2>내 정보</h2>
		<form name="updateform" method="post">
			<table border="1" style="margin-left: auto; margin-right: auto; width: 1000px; height: 150px;">
				<tr >
					<td rowspan="6">${dto.name}(${dto.id })</td>
				</tr>
				<tr>
					<td>수정할 패스워드</td>
					<td><input type="password" name ="pw" style="border: 0px; width: 100%; height: 100%; text-align: center;"></td>
				</tr>
				<tr>
					<td>수정할 패스워드 확인</td>
					<td><input type="password" name ="repw" style="border: 0px; width: 100%; height: 100%; text-align: center;"></td>
				</tr>
				<tr>
					<td>수정할 이메일</td>
					<td><input type="text" name="email" value="${dto.email }" style="border: 0px; width: 100%; height: 100%; text-align: center;"></td>
				</tr>
				<tr>
					<td>수정할 전화번호</td>
					<td><input type="text" name="phonenum" value="${dto.phonenum }" style="border: 0px; width: 100%; height: 100%; text-align: center;"></td>
				</tr>
				<tr>
					<td>수정할 주소</td>
					<td><input type="text" name="address" value="${dto.address }" onclick="goPopup();" readonly="readonly" style="border: 0px; width: 100%; height: 100%; text-align: center;"></td>
				</tr>
			</table>
			<input type="hidden" name ="id" value="${dto.id}">
			<input type="hidden" name ="name" value="${dto.name}">
		</form>
		<br>
		<input type="button" value="수정 완료" onclick="myupdate();" style="width: 170px; height: 40px; background-color: black; color: white; font-size: 13px; margin-left: 20px;">
	</div>
	
	
</body>
</html>
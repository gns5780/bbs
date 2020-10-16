<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/msg.jsp" %>
<%@include file="../include/basic_view_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<script>
		function join(){
			if(joinform.name.value==""){
				alert("이름을 입력하세요");
			}else if(joinform.id.value==""){
				alert("아이디를 입력하세요");
			}else if(joinform.id.value.length < 4){
				alert("아이디를 4자리 이상 입력하세요");
			}else if(joinform.pw.value.length < 4){
				alert("패스워드를 4자리 이상 입력하세요");
			}else if(joinform.pw.value==""){
				alert("패스워드를 입력하세요");
			}else if(joinform.repw.value==""){
				alert("비밀번호확인을 입력하세요");
			}else if(joinform.repw.value!=joinform.pw.value){
				alert("비밀번호가 서로 불일치합니다.");
			}else if(joinform.name.value==""){
				alert("이름을 입력하세요");
			}else if(joinform.address.value==""){
				alert("주소를 입력하세요");
			}else if(joinform.phonenum.value==""){
				alert("휴대폰번호를 입력하세요");
			}else if(joinform.email.value==""){
				alert("이메일주소를 입력하세요");
			}else if('${answer}'==""){
				alert("아이디 중복체크를 해주세요!");
			}else if('${answer}' == '1'){
				alert("아이디 중복체크를 해주세요!");
			}
			//else if('${answer2}' != joinform.emailanswer.value){
			//	alert("인증번호가 다릅니다.");
			//}
			else{
				alert("가입이 완료되었습니다.");
				joinform.action='/bbs/User/insert';
				joinform.submit();
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
			document.joinform.address.value = roadFullAddr;
		}
		function idcheck(){
			 if(joinform.id.value==""){
				alert("아이디를 입력하고 중복체크해주세요");
				joinform.id.focus();
			}else if(joinform.id.value.length < 4){
				alert("아이디를 4자리 이상 입력하세요");
			}else{
				if('${answer2}'== '') joinform.action='/bbs/User/idcheck?answer2=null';
				else joinform.action='/bbs/User/idcheck?answer2=${answer2}';
				joinform.submit();
			}
		}
		function mailcheck(){
			
			 if(joinform.email.value==""){
					alert("이메일을 입력하고 인증해주세요");
			}else if(joinform.email.value.indexOf('@naver.com') == -1){
				alert("메일형식을 정확히 입력바랍니다 (@naver.com)");
			}else{
				
				//if('${answer}'=='0') joinform.action='/bbs/User/mailcheck?answer='+ 0;
				//else joinform.action='/bbs/User/mailcheck?answer='+ 1;
				//joinform.submit();
			}
		}
	</script>
	
	<!-- <input type="button" value="주소찾기" onclick="goPopup();"> -->
				
	<div style="width: 1300px; text-align: center;">
		<h4 style="float: left;">회원정보 입력</h4>
		<hr style="width: 100%;">
		<form name="joinform" style="width: 100%;" method="post">
				<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td><input type="text" name="name" value="${dto.name}" autocomplete=”off” placeholder="이름"  style=" width: 600px; height: 40px;" onkeypress="if(event.keyCode == 13){joinform.id.focus();}"></td>
				</tr>
				<tr> 
					<td><input type="text" name="id" value="${dto.id}" autocomplete=”off” placeholder="아이디" onkeypress="if(event.keyCode == 13){idcheck();}" <c:if test="${answer eq 0 }">readonly="readonly"</c:if> style=" width: 600px; height: 40px;"></td>
				</tr>
				<tr>
					<td><input type="button" value="아이디중복체크" onclick="idcheck()" style="width:607px; height: 40px;color:white; background-color:black"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" value="${dto.pw}" autocomplete=”off” placeholder="비밀번호" style=" width: 600px; height: 40px;"onkeypress="if(event.keyCode == 13){joinform.repw.focus();}"></td>
				</tr>
				<tr>
					<td><input type="password"name="repw" value="${dto.repw}" autocomplete=”off” placeholder="비밀번호 확인" style=" width: 600px; height: 40px;" onkeypress="if(event.keyCode == 13){joinform.address.focus();}" ></td>
				</tr>
				<tr>
					<td><input type="text" id="address" name="address" onfocus="goPopup();" value="${dto.address}" autocomplete=”off” placeholder="주소" readonly="readonly" style=" width: 600px; height: 40px;" onkeypress="if(event.keyCode == 13 ) {joinform.phonenum.focus();}"></td>
				</tr>
				<tr>
					<td><input type="text" name="phonenum" value="${dto.phonenum}" autocomplete=”off” placeholder="휴대폰번호(-없이 숫자만 입력바랍니다)" style=" width: 600px; height: 40px;" onkeypress="if(event.keyCode == 13){joinform.email.focus();}"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" value="${dto.email}" autocomplete="off" placeholder="이메일 주소(현재 네이버 주소만 가능합니다. 임시비밀번호/메일인증 서비스)" style=" width: 600px; height: 40px;" onkeypress="if(event.keyCode == 13){mailcheck()}"></td>
				</tr>
				<tr>
					<td><input type="button" value="이메일 인증" onclick="mailcheck()" style="width: 607px; height: 40px;color:white; background-color:black; font-size: 16px;"></td>
				</tr> 
				<c:if test="${answer2 ne null }">
					<tr>
						<td><input type="text" name="emailanswer" autocomplete="off" placeholder="인증번호" style="width: 600px; height: 40px;"></td>
					</tr>
				</c:if>
				
			</table>
			<br>
			<input type="button" value="가입완료" style="width: 607px; height: 60px; font-size:25px; color:white; background-color:black" onclick="join()" >
		</form>
	</div>
	
</body>
</html>
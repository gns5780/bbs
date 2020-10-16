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
	<script type="text/javascript">
		function login(){
			if(loginform.id.value ==''){
				alert('아이디를 입력하세요');
			}else if(loginform.pw.value ==''){
				alert('비밀번호를 입력하세요');
			}else{
				loginform.submit();
			}
		}
		function selectid(){
			var phonenum = prompt('휴대폰번호를 입력해주세요');
			location.href='/bbs/User/selectid?phonenum='+phonenum;
		}
		function selectpw(){
			var id = prompt('아이디를 입력해주세요');
			if(id!=null){
				var phonenum = prompt('휴대폰번호를 입력해주세요');
				if(id!=null && phonenum!=null ){
					location.href='/bbs/User/selectpw?id='+id+'&phonenum='+phonenum;
				}
			}
			
		}
	</script>
	<div style="width: 1300px; text-align:left; margin-left: 50px;" >
		<form name="loginform" action="/bbs/User/login" style="float: left; width: 700px;height: 1000px;" method="post">
			<h2 style="font-size: 30px;">회원 로그인</h2>
			<table>
			<tr>
				<td><input type="text" name="id" placeholder="MemberID" style="width: 400px; height: 35px;" onkeypress="if(event.keyCode == 13){loginform.pw.focus();}"></td>
			</tr>
			<tr>
				<td><input type="password" name="pw" placeholder="PassWord" style="width: 400px; height: 35px;"onkeypress="if(event.keyCode == 13){ login();}"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="login()" value="Log-in" style="width: 407px; height: 50px; background-color: black; color: white; font-size: 15px; margin-top: 10px;"><td>
			</tr>
			</table>
		</form>
		<h3>회원가입</h3>
		<h5 style="color: gray;">아직 회원이 아니신가요?<br>
		회원가입을 하시면 다양한 혜택을 편리하게 이용하실 수 있습니다.</h5>
		<input type="button" value="Join-us" onclick="location.href='/bbs/User/join'" style="font-size:16px; width: 400px; height: 45px; background-color: white;"><br>
		<h5 style="color: gray;">아이디를 잊으셨나요?<br>
		간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.</h5>
		<input type="button" value="ID 찾기" onclick="selectid();" style=" width: 400px; height: 45px; background-color: white;">
		<h5 style="color: gray;">비밀번호를 잊으셨나요?<br>
		간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.</h5>
		<input type="button" value="PassWord 찾기" onclick="selectpw();" style=" width: 400px; height: 45px; background-color: white;">
	</div>
	<br><br>
	${msgg}
	<table>
		<c:forEach var="dto" items="${list}" >
			<tr>
				<td>아이디 :</td>
				<td>${dto}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
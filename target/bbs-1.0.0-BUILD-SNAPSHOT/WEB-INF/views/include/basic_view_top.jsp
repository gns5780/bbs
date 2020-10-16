 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<script type="text/javascript">
		function logout(){
			if(confirm('로그아웃 하시겠습니까?')){
				location.href='/bbs/User/logout';
			}
		}
		function boardmove(){
			if('${loginCheck}'!=''){
				location.href='/bbs/Board/selectall';
			}else{
				alert('로그인후 이용해주세요!');
				location.href='/bbs/User/login';
			}
		}
	</script>
	<br>
	<div style="width: 1300px;">
	<c:choose>
		<c:when test="${loginCheck eq 'admin'}">
			<button type="button" style="float: right; margin-right: 10px; border: 0px; background-color: white;" onclick="boardmove();">고객센터</button>			
			<button type="button" style="float: right; margin-right: 10px; border: 0px; background-color: white;" onclick="logout()">로그아웃</button>
			<button type="button" style="float: right; margin-right: 30px; border: 0px; background-color: white;" onclick="location.href='/bbs/Admin/main'">관릭자 기능</button>
		</c:when>
		<c:when test="${loginCheck ne null}">
			<button type="button" style="float: right; margin-right: 30px; border: 0px; background-color: white;" onclick="location.href='/bbs/User/selectmy'">내정보</button>
			<button type="button" style="float: right; margin-right: 10px; border: 0px; background-color: white;" onclick="boardmove();">고객센터</button>
			<button type="button" style="float: right; margin-right: 10px; border: 0px; background-color: white;" onclick="logout()">로그아웃</button>
		</c:when>
		<c:otherwise>
			<button type="button" style="float: right; margin-right: 30px; border:0px; background-color: white; " onclick="location.href='/bbs/User/login'">로그인</button>
			<button type="button" style="float: right; margin-right: 10px; border: 0px; background-color: white;" onclick="boardmove();">고객센터</button>			
			<button type="button" style="float: right; margin-right: 10px; border: 0px; background-color: white;" onclick="location.href='/bbs/User/join'">회원가입</button>
		</c:otherwise>
	</c:choose>
	<hr style="width: 300%;  position:relative; right:100%; top: 5px;">
	<!---------메인로고/아이템이름으로 검색-------------------------------------------------------------------------------->
	</div>
	<div style="width: 1300px;">
	<img src="/bbs/resources/image/mainicon.png" style="margin-left:20%; margin-top:5px; height: 90px; width: 100px; float: left;" onclick="location.href='/bbs/Item/selectall'">
		<form action="/bbs/Item/selectall">
			<input type="hidden" name="findKey" value="">
			<input type="text" name="findValue" style="border: 1; margin-left: 10%; width: 400px; height: 40px; border-radius: 25px; border-width: 3px; margin-top: 26px;">
			<button type="submit" style="border: 0px; background-color: white; position:relative; top: 8px;">
				<img src="/bbs/resources/image/image.png" style="height: 30px; width: 30px;">
			</button>
		</form>
		
		<hr style="width:300%; position: relative; right:100%; top:5px;">
		<hr style="width:300%; position: relative; right:100%;">
	</div>
	<br>
	
	
	
</body>
</html>
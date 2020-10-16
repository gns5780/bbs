<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>itemupdate</title>
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
		<form action="/bbs/Item/selectallup">
			<input type="hidden" name="findkey" value="">
			<input type="text" name="findvalue" style="border: 1; margin-left: 10%; width: 400px; height: 40px; border-radius: 25px; border-width: 3px; margin-top: 26px;">
			<button type="submit" style="border: 0px; background-color: white; position:relative; top: 8px;">
				<img src="/bbs/resources/image/image.png" style="height: 30px; width: 30px;">
			</button>
		</form>
		
		<hr style="width:300%; position: relative; right:100%; top:5px;">
		<hr style="width:300%; position: relative; right:100%;">
		
	</div>
	<br>
	<!---------------------------------------------------------------------------------------------------------------------------------------------->
	<!----코드작성---------------------------------------------------------------------------------------------------------------------------------->
	<br>
		<div style="text-align: center; width: 1300px;">
		<input type="button" value="all" onclick="location.href='/bbs/Item/selectallup?findkey=all'"       style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; ">
		<input type="button" value="top" onclick="location.href='/bbs/Item/selectallup?findkey=top'"       style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px;">
		<input type="button" value="bottom" onclick="location.href='/bbs/Item/selectallup?findkey=bottom'" style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px;">
		<input type="button" value="shoes" onclick="location.href='/bbs/Item/selectallup?findkey=shoes'"   style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px;">
	</div>
	<hr>
	
	<script type="text/javascript">
		function itemdelete(seq){
			if(confirm('정말삭제 하시겠습니까?')){
				location.href='/bbs/Item/delete?seq='+seq;
			}
			
		}
	</script>
	
	<div style="width: 1300px; text-align:left;">
		<c:forEach items="${list}" var="item" varStatus="status">
			<table style="float:left; margin-left: 60px; font-size: 15px; margin-bottom: 25px;" border="1">
				<tr>
					<th><img alt="이미지없음" src="/bbs/resources/upload/${item.itemimage }" onclick="location.href='/bbs/Item/selectone?seq='+${item.seq}" style="height: 300px; width: 250px;"> </th>
				</tr>
				<tr>
					<td>${item.seq}</td>
				</tr>
				<tr>
					<td>${item.category}</td>
				</tr>
				<tr>
					<td>${item.itemname}</td>
				</tr>
				<tr>
					<td>${item.itemsize}</td>
				</tr>
				<tr>
					<td>${item.itemprice}</td>
				</tr>
				<tr>
					<td>${item.itemcolor}</td>
				</tr>
				<tr>
					<td>${item.regdate}</td>
				</tr>
				<tr>
					<td>${item.itemimage}</td>
				</tr>
				<tr>
				<td><input type="button" value="수정" onclick="location.href='/bbs/Item/selectone?seq='+${item.seq}">
				<input type="button" value="삭제" onclick="itemdelete('${item.seq}')"></td>
				
				</tr>
			</table>
		</c:forEach>
	</div>
	<br>
		<hr style="width: 300%; right: 100%;">
		<div style="text-align: center; ">
		<c:if test="${pdto.startPage != 1 }">
			<input type="button" value="&#60&#60" onclick="location.href='/bbs/Item/selectallup?curPage=${pdto.startPage - 1}&findKey=${pdto.findKey }&findValue=${pdto.findValue}'" style="font-size:16px; background-color: white; border: 0px;">
		</c:if>
		
		<c:forEach begin="${pdto.startPage }"  end="${pdto.endPage }" var="i">
			<c:if test="${i eq pdto.curPage}"><input type="button" value="${i }" onclick="location.href='/bbs/Item/selectallup?curPage=${i}&findKey=${pdto.findKey }&findValue=${pdto.findValue}'" style="font-size:16px; width:35px; background-color: white; border: 0px; color: black;"></c:if>
			<c:if test="${i ne pdto.curPage}"><input type="button" value="${i }" onclick="location.href='/bbs/Item/selectallup?curPage=${i}&findKey=${pdto.findKey }&findValue=${pdto.findValue}'" style="font-size:16px; width:35px; background-color: white; border: 0px; color: gray;" ></c:if>
			
		</c:forEach>
		
		<c:if test="${pdto.endPage != pdto.totPage }">
			<input type="button" value="&#62&#62" onclick="location.href='/bbs/Item/selectallup?curPage=${pdto.endPage + 1}&findKey=${pdto.findKey }&findValue=${pdto.findValue}'" style="font-size:16px; background-color: white; border: 0px;">
		</c:if>
	</div>
	<br><br><br><br><br><br>
</body>
</html>
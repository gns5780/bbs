<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/basic_view_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
	*{margin:0;padding:0;}
		ul,li{list-style:none;}
		#slide{height:600px;position:relative;overflow:hidden;}
		#slide ul{width:400%;height:600px;transition:1s;}
		#slide ul:after{content:"";display:block;clear:both;}
		#slide li{float:left;width:1300px;height:600px;}
		#slide li:nth-child(1){background-image: url("/bbs/resources/main_slider/mainslider1.jpg");}
		#slide li:nth-child(2){background-image: url("/bbs/resources/main_slider/mainslider2.jpg");}
		#slide li:nth-child(3){background-image: url("/bbs/resources/main_slider/mainslider3.jpg");}
		#slide li:nth-child(4){background-image: url("/bbs/resources/main_slider/mainslider4.jpg");}
		#slide input{display:none;}
		#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
		#slide .pos{position:absolute;bottom:10px;left:0;margin-left: 650px;}
		#pos1:checked~ul{margin-left:0%;}
		#pos2:checked~ul{margin-left:-1300px;}
		#pos3:checked~ul{margin-left:-2600px;}
		#pos4:checked~ul{margin-left:-3900px;}
		#pos1:checked~.pos>label:nth-child(1){background:#666;}
		#pos2:checked~.pos>label:nth-child(2){background:#666;}
		#pos3:checked~.pos>label:nth-child(3){background:#666;}
		#pos4:checked~.pos>label:nth-child(4){background:#666;}
		
		td{
			height: 100px;
			width: 300px;
			padding: 15px;
		}
		.admin{
			background-color: gray;
			height: 100%;
			width: 100%;
			color: white;
			font-size: 22px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<script type="text/javascript">
		function left(){
			var val = document.querySelector('input[name="pos"]:checked').value;
			val = parseInt(val);
			val-=1;
			if(val<=0) val=4;
			document.querySelector('#pos'+val).checked = true;
			clearInterval(playslider);
			playslider = setInterval(function() {
				   right();
				}, 3000);
		}
		function right(){
			var val = document.querySelector('input[name="pos"]:checked').value;
			val = parseInt(val);
			val+=1;
			if(val>=5) val=1;
			document.querySelector('#pos'+val).checked = true;
			clearInterval(playslider);
			playslider = setInterval(function() {
				   right();
				}, 3000);
		}
		playslider = setInterval(function play() {
		   right();
		}, 3000);
		
	</script>
	
	
	<div id="slide">
		<div style="position: absolute;">
			<button value="left"  onclick="left()" style="position: relative; top: 250px; margin-left: 20px;">
				<img src="/bbs/resources/main_slider/left.png" style="width: 70px; height: 100px;">
			</button>
			
			<button value="right"  onclick="right()"
			style="float: right;  position: relative; top: 250px; left: 1110px;background-color: rgba( 255, 255, 255, 0.5 );">
				<!-- <H2 style="width: 70px; height: 100px;">&#62;</H2> -->
				<img src="/bbs/resources/main_slider/right.png" style="width: 70px; height: 100px;">
			</button>
		</div>
		<input type="radio" name="pos" id="pos1" value="1" checked>
		<input type="radio" name="pos" id="pos2" value="2">
		<input type="radio" name="pos" id="pos3" value="3">
		<input type="radio" name="pos" id="pos4" value="4">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label>
			<label for="pos2"></label>
			<label for="pos3"></label>
			<label for="pos4"></label>
		</p>
	</div>
	<br><br><br><br><br>
	<table style="margin-right: auto; margin-left: auto;">
		<tr>
			<td><button type="button" class="admin" onclick="location.href='/bbs/Item/iteminsert'">상품 등록</button></td>
			<td><button type="button" class="admin" onclick="boardmove();">고객센터</button>	</td>
		</tr>
		<tr>
			<td><button type="button" class="admin" onclick="location.href='/bbs/Item/selectallup'">상품 수정</button></td>
			<td><button type="button" class="admin" onclick="location.href='/bbs/Item/search'">검색어 순위</button></td>
		</tr>
		<tr>
			<td><button type="button" class="admin" onclick="location.href='/bbs/User/selectall'">전체회원정보 조회</button></td>
			<td><button type="button" class="admin" onclick="location.href='/bbs/Slider/insert'">메인 슬라이더 사진변경</button></td>
		</tr>
	</table>
	<br><br><br><br><br><br><br>
	
</body>
</html>
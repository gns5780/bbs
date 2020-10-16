<%@page import="org.spring.dto.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.spring.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/includeFile.jsp" %>
<%@include file="../include/basic_view_top.jsp" %>
<%@include file="../include/msg.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		
	</style>
<title>main</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;" id="Context">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
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
		
		
		
		function move_page(cpage){
			var fkey = '<c:out value="${pdto.findKey}"/>';
			var fvalue = '<c:out value="${pdto.findValue}"/>';
			clearInterval(playslider);
			 $.ajax({
			        type : "GET",
			        url : "/bbs/Item/selectall",
			        data :{"curPage" : cpage, "findKey" : fkey, "findValue" : fvalue},
			        dataType : "text",
			        error : function() {
			          alert('통신실패!!');
			        },
			        success : function(data) {
			          $('#Context').html(data);
			        }
			      });
		}
		function move_catagory(fkey){
			var fvalue = '<c:out value="${pdto.findValue}"/>';
			clearInterval(playslider);
			$.ajax({
			        type : "GET",
			        url : "/bbs/Item/selectall",
			        data :{"curPage" : "1", "findKey" : fkey, "findValue" : fvalue},
			        dataType : "text",
			        error : function() {
			          alert('통신실패!!');
			        },
			        success : function(data) {
			          $('#Context').html(data);
			        }
			      });
		}
		
		
	</script>
	<div id="slide">
		<div style="position: absolute;">
			<button value="left"  onclick="left()" style="position: relative; top: 250px; margin-left: 20px;">
				<img src="/bbs/resources/main_slider/left.png" style="width: 70px; height: 100px; cursor: pointer;">
			</button>
			
			<button value="right"  onclick="right()"
			style="float: right;  position: relative; top: 250px; left: 1110px;background-color: rgba( 255, 255, 255, 0.5 ); cursor: pointer;">
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
	<!---------메뉴창------------------------------------------------------------------------------------------------------------>
	<br>
		<div style="text-align: center; width: 1300px;">
		<!-- <input type="button" value="all" onclick="location.href='/bbs/Item/selectall?findKey=all'"       style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; ">
		<input type="button" value="top" onclick="location.href='/bbs/Item/selectall?findKey=top'"       style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px;">
		<input type="button" value="bottom" onclick="location.href='/bbs/Item/selectall?findKey=bottom'" style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px;">
		<input type="button" value="shoes" onclick="location.href='/bbs/Item/selectall?findKey=shoes'"   style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px;"> -->
		<input type="button" value="all" onclick="move_catagory('all');"       style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; cursor: pointer; ">
		<input type="button" value="top" onclick="move_catagory('top');"       style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px; cursor: pointer;">
		<input type="button" value="bottom" onclick="move_catagory('bottom');" style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px; cursor: pointer;">
		<input type="button" value="shoes" onclick="move_catagory('shoes');"   style="border:0px; background-color:white; font-size:20px; height:50px;width: 80px; color: gray; margin-left: 50px; cursor: pointer;">
	</div>
	<br>
	<!---------아이템 뿌리기------------------------------------------------------------------------------------------------------------>
			<c:forEach items="${list}" var="item" varStatus="status">
			<div style="width: 1300px; text-align:left;">
				<table style="float:left; margin-left: 60px; font-size: 15px; margin-bottom: 25px;">
					<tr>
						<th><img alt="이미지없음" src="/bbs/resources/upload/${item.itemimage }" onclick="alert('구현중');" style="height: 300px; width: 250px;"> </th>
					</tr>
					<%-- <tr>
						<td>${item.category}</td>
					</tr> --%>
					<tr>
						<td>${item.itemname}</td>
					</tr>
					<tr>
						<td>${item.itemsize}</td>
					</tr>
					<tr>
						<td>${item.itemprice}</td>
					</tr>
				</table>
			</div>
		</c:forEach>
		<br>
		<hr style="width: 100%;">
		<div style="text-align: center; ">
		<c:if test="${pdto.startPage != 1 }">
			<input type="button" value="&#60&#60" onclick="location.href='/bbs/Item/selectall?curPage=${pdto.startPage - 1}&findKey=${pdto.findKey }&findValue=${pdto.findValue}'" style="font-size:16px; background-color: white; border: 0px; cursor: pointer;">
		</c:if>
		
		<c:forEach begin="${pdto.startPage }"  end="${pdto.endPage }" var="i">
			<c:if test="${i eq pdto.curPage}"><input type="button" onclick="move_page(${i});" value="${i}" style="font-size:16px; width:35px; background-color: white; border: 0px; color: black; cursor: pointer;"></c:if>
			<c:if test="${i ne pdto.curPage}"><input type="button" onclick="move_page(${i});" value="${i}" style="font-size:16px; width:35px; background-color: white; border: 0px; color: gray; cursor: pointer;" ></c:if>
		</c:forEach>
		
		<c:if test="${pdto.endPage != pdto.totPage }">
			<input type="button" value="&#62&#62" onclick="location.href='/bbs/Item/selectall?curPage=${pdto.endPage + 1}&findKey=${pdto.findKey }&findValue=${pdto.findValue}'" style="font-size:16px; background-color: white; border: 0px; cursor: pointer;">
		</c:if>
	</div>
	<br><br><br><br><br><br>
	
</body>
</html>
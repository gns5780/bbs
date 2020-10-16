<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/basic_view_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectone</title>
</head>
<body style="width: 1300px; margin-left: auto; margin-right: auto;">
	<script type="text/javascript">
		function itemupdate(){
			if(confirm('수정 하시겠습니까?')){
				updateform.submit();
			}
		}
	</script>
	<div style="width: 1300px;">
		<h2 style="text-align: center;">상품수정</h2>
		<form action="/bbs/Item/update" method="post" name="updateform" enctype="multipart/form-data" style="text-align: center;">
			<table border="1" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td>순번</td>
					<th><input type="text" name="seq" readonly="readonly" value="${dto.seq }"></th>
				</tr>
				<tr>
					<td>카테고리</td>
					<th>
						<select name="category" style="height: 25px; width: 170px;" >
							<option value="top" <c:if test="${dto.category eq 'top'}"> selected</c:if>>상의</option>
							<option value="bottom" <c:if test="${dto.category eq 'bottom'}"> selected</c:if>>하의</option>
							<option value="shoes" <c:if test="${dto.category eq 'shoes'}"> selected</c:if>>신발</option>
						</select>
					</th>
				</tr>
				<tr>
					<td>이름</td>
					<th><input type="text" name="itemname" value="${dto.itemname }"></th>
				</tr>
				<tr>
					<td>사이즈</td>
					<th><input type="text" name="itemsize" value="${dto.itemsize }"></th>
				</tr>
				<tr>
					<td>가격</td>
					<th><input type="text" name="itemprice" value="${dto.itemprice }"></th>
				</tr>
				<tr>
					<td>색</td>
					<th><input type="text" name="itemcolor" value="${dto.itemcolor }"></th>
				</tr>
				<tr>
					<td>이미지파일</td>
					<th><img alt="" src="/bbs/resources/upload/${dto.itemimage }"> </th>
				</tr>
				<tr>
					<td>파일 수정시 선택</td>
					<th><input type="file" name="file"></th>
				</tr>
			</table>
			<input type="button" value="수정" onclick="itemupdate()" style="width: 390px; height: 30px; color:white; background-color: #3366FF">
		</form>
	</div>
	
</body>
</html>
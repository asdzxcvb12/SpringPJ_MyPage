<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
<script type="text/javascript">
	function oninsert() {
		var form = document.getElementById('form');
		form.action = "insert";
		form.submit();
	}
	
	function ondelete() {
		var form = document.getElementById('form');
		form.action = "delete";
		form.submit();		
	}
</script>
</head>
<body>
<form id="form" method="get">
	<table border="1">
		<tr>
			<td>이름</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td></td>
		</tr>

		<tr>
			<td><input type="text" name="name" id="name"></td>
			<td><input type="text" name="email" id="email"></td>
			<td><input type="text" name="phone" id="phone"></td>
			<td colspan="2" align="center">
			<input type="button" value="추가" onclick="javascript:oninsert()">
			</td>

		</tr>
		<c:forEach items="${result}" var="member">
			<tr>
				<td>${member._name}
				</td>
				<td>${member._email}</td>
				<td>${member._phone}</td>
				<td><input type="button" value="수정" onclick=""> 
				<input type="button" value="삭제" onclick="javascript:ondelete()"></td>
			</tr>
		</c:forEach>
	</table>

</form>
</body>
</html>
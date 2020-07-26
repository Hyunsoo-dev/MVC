<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

</head>
<body>

<form action="Mproc2" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="email" name="email"></td>
	</tr>
	<tr>
		<td>전화</td>
		<td><input type="tel" name="tel"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<td><input type="submit" value="회원가입"></td>
	</tr>
</table>
</form>

</body>
</html>
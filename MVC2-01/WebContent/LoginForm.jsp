<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css.css">
</head>
<body>

<div class="main">
	<form action="LoginProc.jsp" method="post" class="form">
		<table class="loginTable">
			<tr class="loginTable__tr">
				<td class="loginTable__td1">���̵�</td>
				<td class="loginTable__td2"><input type="text" name="id"></td>
			</tr>
			<tr class="loginTable__tr">
				<td class="loginTable__td1">��й�ȣ</td>
				<td class="loginTable__td2"><input type="password" name="password"></td>
			</tr>
			<tr class="loginTable__tr">
				<td colspan="2" class="loginTable__td3">
					<input type="submit" value="�α���">
				</td>	
			</tr>
		</table>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BoardDeleteForm</title>
</head>
<body>

<form action="BoardDeleteProcCon.do" method = "post">
		<table width = "600" border = "1">
			
			<tr height = "40">
				<td width = "120"> �н����� </td>
				<td width = "480" colspan = "3"> <input type = "password" name = "password" size = "60"></td>
			</tr>
			
			<tr height = "40">
				<td colspan = "4">
					<input type = "hidden" name = "num" value = "${dbean.num }">
					<input type = "hidden" name = "pass" value = "${dbean.password }">
					<input type = "submit" value = "�� ����">&nbsp;&nbsp;
					<input type = "button" value = "�� ��� ����" onclick = "location.href = 'BoardListCon.do'">
				</td>
			</tr>
			
		</table>
	</form>
	
</body>
</html>
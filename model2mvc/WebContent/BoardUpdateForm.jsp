<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BoardUpdateForm</title>
</head>
<body>
<form action="BoardUpdateProcCon.do" method = "post">
		<table width = "600" border = "1">
			<tr height = "40">
				<td width = "120"> 작성자 </td>
				<td width = "180"> ${dbean.writer } </td>
				<td width = "120"> 작성일 </td>
				<td width = "180"> ${dbean.reg_date } </td>
			</tr>
			<tr height = "40">
				<td width = "120"> 제목 </td>
				<td width = "480" colspan = "3"> <input type = "text" name = "subject" value = "${dbean.subject }" size = "60"></td>
			</tr>
			<tr height = "40">
				<td width = "120"> 패스워드 </td>
				<td width = "480" colspan = "3"> <input type = "password" name = "password" size = "60"></td>
			</tr>
			<tr height = "40">
				<td width = "120"> 글 내용 </td>
				<td width = "480" colspan = "3"> <textarea rows="10" cols="60" name = "content" >${dbean.content } </textarea> </td>
			</tr>
			<tr height = "40">
				<td colspan = "4">
					<input type = "hidden" name = "num" value = "${dbean.num }">
					<input type = "hidden" name = "pass" value = "${dbean.password }">
					<input type = "submit" value = "글 수정">&nbsp;&nbsp;
					<input type = "button" value = "글 목록 보기" onclick = "location.href = 'BoardListCon.do'">
				</td>
			</tr>
			
		</table>
	</form>
	


</body>
</html>
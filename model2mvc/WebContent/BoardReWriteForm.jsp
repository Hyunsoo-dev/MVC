<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "BoardReWriteProcCon.do" method = "post">
		<table width = "600" border = "1">
			<tr height = "40">
				<td width = "150"> 작성자 </td>
				<td width = "450"> <input type = "text" name = "writer" size = "60"></td>
			</tr>
			<tr height = "40">
				<td width = "150"> 제목 </td>
				<td width = "450"> <input type = "text" name = "subject" size = "60" value = "[답글]"></td>
			</tr>
			<tr height = "40">
				<td width = "150"> 이메일 </td>
				<td width = "450"> <input type = "email" name = "email" size = "60"></td>
			</tr>
			<tr height = "40">
				<td width = "150"> 비밀번호 </td>
				<td width = "450"> <input type = "password" name = "password" size = "60"></td>
			</tr>
			<tr height = "40">
				<td width = "150"> 글내용 </td>
				<td width = "450"> <textarea rows="10" cols="60" name = "content"></textarea>
			</tr>
			<!-- form 에서 사용자에게 입력받지 않고 데이터를 넘김 -->
			<tr height = "40">
				<td colspan = "2">
					<input type = "hidden" name = "ref" value = "${ref }">
					<input type = "hidden" name = "re_step" value = "${re_step }">
					<input type = "hidden" name = "re_level" value = "${re_level }">
					<input type = "submit" value = "답글쓰기 완료">&nbsp;&nbsp;
					<input type = "reset" value = "취소">&nbsp;&nbsp;
					<input type = "button" onclick = "location.href = 'BoardListCon.do'" value = "전체 글 보기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>게시글 보기</h2>
	<table width = "600" border = "1">
		<tr height = "40">
			<td width = "120"> 글 번호 </td>
			<td width = "180">${dbean.num } </td>
			<td width = "120"> 조회수 </td>
			<td width = "180"> ${dbean.readcount } </td>
		</tr>
		<tr height = "40">
			<td width = "120"> 작성자 </td>
			<td width = "180"> ${dbean.writer } </td>
			<td width = "120"> 작성일 </td>
			<td width = "180"> ${dbean.reg_date } </td>
		</tr>
		<tr height = "40">
			<td width = "120"> 이메일 </td>
			<td colspan = "3"> ${dbean.email } </td>
		</tr>
		<tr height = "40">
			<td width = "120"> 제목 </td>
			<td colspan = "3"> ${dbean.subject } </td>	
		</tr>
		<tr height = "80">
			<td width = "120"> 글 내용 </td>
			<td colspan = "3"> ${dbean.content } </td>
		</tr>
		<tr height = "40">
			<td colspan = "4"> 
				<input type  = "button" value = "답글쓰기" onclick = "location.href='BoardReWriteCon.do?num=${dbean.num }&ref=${dbean.ref }&re_step=${dbean.re_step }&re_level=${dbean.re_level }'">
				<input type = "button" value = "수정하기" onclick = "location.href='BoardUpdateCon.do?num=${dbean.num}'">
				<input type = "button" value = "삭제하기" onclick = "location.href='BoardDeleteCon.do?num=${dbean.num}'">
				<input type = "button" value = "목록보기" onclick = "location.href='BoardListCon.do'">
 			</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>

<c:if test="${msg != null}">
<script	>
alert("${msg}");
</script>
</c:if>
<form action="#" method ="post">
<table>
	<tr>
		<td colspan="5">
			<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
		</td>
	</tr>
	<tr>
		<td width = "50"> 번호 </td>
		<td width = "320"> 제목 </td>
		<td width = "100"> 작성자 </td>
		<td width = "150"> 작성일 </td>
		<td width = "80"> 조회수 </td>
	</tr>
		<c:set var="number" value="${number }" />
		
		<c:forEach var="bean" items="${v }">
	<tr>
		<td width = "50" align="left"> ${number }</td>
		<td width = "320" align=left>
			<c:if test="${bean.re_step > 1 }">
				<c:forEach var="j" begin="1" end="${(bean.re_step-1)*5 }">
					&nbsp;
				</c:forEach>
			</c:if>
			<a href="BoardInfoControl.do?num=${bean.num }"> ${bean.subject } </a>
				
		</td>
		<td width = "100" align="left"> ${bean.writer } </td>
		<td width = "150" align="left"> ${bean.reg_date } </td>
		<td width = "80" align="left"> ${bean.readcount } </td>
	</tr>
	<c:set var="number" value="${number-1 }"/> 
		</c:forEach>
		
</table>
<p>
<c:if test="${count > 0 }">
	<c:set var="pageCount" value="${count / pageSize + (count%pageSize == 0 ? 0 : 1) }"/>
	<c:set var="startPage" value="${1 }" />
	
	<c:if test="${currentPage%10 != 0}">
		<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"/>
		<c:set var="startPage" value="${result *10+1 }"/> 
	</c:if>
	
	<c:if test="${currentPage%10 == 0}">
		<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"/>
		<c:set var="startPage" value="${(result-1) *10+1 }"/> 
	</c:if>
	
	<c:set var="pageBlock" value="${10 }" />
	<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
	
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount }"/>
	</c:if>
	
	<c:if test="${startPage > 10 }" >
		<a href="BoardList.jsp?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	
		<a href="BoardList.jsp?pageNum=${i}">[${i}]</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
	
		<a href="BoardList.jsp?pageNum=${startPage + 10 }">[다음]</a>
	</c:if>
</c:if>
</form>

</body>
</html>
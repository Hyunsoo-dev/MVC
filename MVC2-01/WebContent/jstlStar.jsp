<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 
		*
	   ***
	  *****
	 *******
	********* 	
	
 -->



<c:forEach var="i" begin="0" end="4">	
	<!-- 공백  -->
	<c:forEach begin="1" end="${4-i}">
	
	 	&nbsp;
	 	 
	</c:forEach>
	
	<c:forEach  begin="1" end="${(2*i)+1}" >
		*		
	</c:forEach>
	<br>
</c:forEach>
	

</body>
</html>
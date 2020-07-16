<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
	<link rel="stylesheet" href="css.css">
</style>
</head>
<body>
<form action="ElCalculator.jsp" method="post">
	<table>
		<tr>
			<td><input type="text" name="num1" value="${param.num1} "><td>
			<td>
				<select name="exp1">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
				</select>
			<td>
			<td><input type="text" name="num2"  value="${param.num1}"><td>
			<td>=<td>
			<td>
			<%
				
				String exp1 = request.getParameter("exp1");
				if(exp1==null){
					exp1 = "+";
				}
				if(exp1.equals("+")){	
					
			%>
				<input type="text" value="${param.num1 + param.num2 }">
				
			<%
				
				}else if(exp1.equals("-")){
					 
			%>
				 <input type="text" value="${param.num1 - param.num2 }">
			<%
			
				}else if(exp1.equals("*")){
			%>
				<input type="text" value="${param.num1 * param.num2 }">
			<%		
				}else if(exp1.equals("/")){
			%>
				<input type="text" value="${param.num1 / param.num2 }">
			<%
				}
			%>
			<td>
			<td><input type="submit" value="°è»ê"><td>
		<tr>
	</table>
</form>
</body> 
</html>
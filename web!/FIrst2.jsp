<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[First.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
</head>
<body>
	<%
	session.setAttribute("name", "mang");
	
	
	%>
	<%
	String name =(String)session.getAttribute("name");
	
	%>
	
	<%=name %>
	
	
</body>
</html>
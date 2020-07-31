<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[gugudan.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
</head>
<body>
	<h1>gugudan.jsp</h1>
	
	<% 
	Date dt = new Date();
	out.println("날짜 "+dt.toLocaleString()+"<br>");
	int dan = 3;
	for(int i=0; i<10; i++){
		out.println(dan+"*"+i+"="+(dan*i)+"<img src=images/bar.gif>"+"<br>");	
		}
	
	%>
</body>
</html>
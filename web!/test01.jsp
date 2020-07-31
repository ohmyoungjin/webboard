<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[test01.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
</head>
<body>
	<h1>우리나라</h1>
	<h1>좋은나라</h1>
	<h1>금수나라</h1>
	<img src="images/bar.gif"> <br>
	<img src="images/bar.gif">
	
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
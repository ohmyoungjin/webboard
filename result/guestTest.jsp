<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestTest.jsp]  </title>
  <style type="text/css">
   
	*{ font-size: 20pt; }
	a{ font-size: 18pt; color:blue; text-decoration:none; }
	a:hover{ font-size:20pt; color:green;  text-decoration:none;  }
  </style>
 <jsp:useBean id ="dao" class = "net.tis.sql.GuestSQL"/>
</head>
<body>
	<% 
		ArrayList SK = dao.dbtest();
		for(int i =1; i<SK.size(); i++){
			out.println(SK.get(i));		
			if(i==5){
				out.println("<br>");
			}
		}
	  
	%>

</body>
</html>













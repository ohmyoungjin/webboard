<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_delete.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  #rsave{
	    font-size: 26pt; font-weight: bold;
	    background:lightgreen;   height:130px;
	  }
	</style>
</head>
<body>
 <%
  	Rnum = Integer.parseInt(request.getParameter("del"));
  	Rsabun = Integer.parseInt(request.getParameter("sab"));
 	
 	msg =" delete from guestreply where num  = "+ Rnum ;
 	ST = CN.createStatement();
 	ST.executeUpdate(msg);
 	%>
 	<script type="text/javascript">
 	alert("삭제됐습니다") 
 	location.href="guestDetail.jsp?ix=<%=Rsabun%>"
 	</script>
 
</body>
</html>







<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_editSave.jsp] </title>
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
   Rwriter = request.getParameter("writer");
   Rcontent = request.getParameter("content");
   Rsabun = Integer.parseInt(request.getParameter("sabun"));
   Rnum = Integer.parseInt(request.getParameter("num"));
   msg = "update guestreply set writer =? , content =? where num = ?";
   PST=CN.prepareStatement(msg);
   PST.setString(1,Rwriter);
   PST.setString(2,Rcontent);
   PST.setInt(3,Rnum);
   PST.executeUpdate();
 %>
 	<script type="text/javascript">
 	alert("수정됐습니다") 
 	location.href="guestDetail.jsp?ix=<%=Rsabun%>"
 	</script>
 	
</body>
</html>







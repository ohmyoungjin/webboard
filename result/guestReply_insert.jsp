<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_insert.jsp] </title>
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
   Rsabun = Integer.parseInt(request.getParameter("sabun"));
   Rwriter = request.getParameter("writer");
   Rcontent =request.getParameter("content");
   try{
   msg = "insert into guestreply values(guestreply_seq.nextval,?,?,?)"; 
   PST=CN.prepareStatement(msg);
   PST.setString(1,Rwriter);
   PST.setString(2,Rcontent);
   PST.setInt(3,Rsabun);
   PST.executeUpdate();
   }catch(Exception e ){System.out.println(e);}
   %>
   <script>
   alert("댓글이 저장됐습니다")
   location.href="guestDetail.jsp?ix=<%=Rsabun%>"
   </script>
   
</body>
</html>







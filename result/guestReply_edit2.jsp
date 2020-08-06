<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_edit.jsp] </title>
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
<script type="text/javascript">
	function sub(){
		document.edit_ok.submit();
	}

</script>
<body>
	<%Rsabun = Integer.parseInt(request.getParameter("up1")); 
	Rwriter = request.getParameter("up2"); 
	Rcontent = request.getParameter("up3"); 
	Rnum = Integer.parseInt(request.getParameter("up4")); 
	%>

 	<form method="post" action="guestReply_editSave.jsp" name = "edit_ok">
 	번호: 
 	<input type ="text" name = "num" value =<%=Rnum %>>
 	<br>
 	사번: 
 	<input type ="text" name = "sabun" value =<%=Rsabun %>>
 	<br>
 	저자:
 	<input type ="text" name = "writer" value =<%=Rwriter %>> 
 	<br>
 	내용:
 	<textarea rows="3" cols="27" name="content" ><%=Rcontent%></textarea>
 	<br>
 	<input type ="submit" value = "수정하기">
 	
 	</form>  
 <a href="guestDetail.jsp?ix=<%=Rsabun %>">[돌아가기]</a>
 	
</body>

</html>







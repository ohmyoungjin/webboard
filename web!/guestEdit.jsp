<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file = "ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[First.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<%
	Gdata =request.getParameter("tis");
	msg = "select*from guest where sabun="+Gdata;
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
	while(RS.next()==true){
	Gsabun=RS.getInt("sabun");
	}
	%>
	<form action ="guestEditSave.jsp">
	사번:<input type="text" name="sabun" value =<%=Gsabun %> readonly="readonly"> <br>
   	바꾸고 싶은 곳:<input type="text" name="up" > <br>
	바꾸기:<input type="text" name="title" > <br>
	<input type ="submit" value="수정하기">  
	</form>
</body>
</html>
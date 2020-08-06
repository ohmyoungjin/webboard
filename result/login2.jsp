<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file ="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[login.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
</head>
<body>
	<form method="post" action="loginList.jsp">
	아이디 : <input type="text" name ="id"><br>
	비밀번호 : <input type="password" name ="pass"><br>
	<input type ="submit" value="등록하기"> 
	
	</form>
	
</body>
</html>
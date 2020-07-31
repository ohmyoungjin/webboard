<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file = ssi.jsp %>

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
	String Gid = request.getParameter("id");
	String Gpass =request.getParameter("pass");
	
	
	session.setAttribute("id", Gid);
	session.setAttribute("pass", Gpass);
	
	msg = "select count(*)as cnt from login where id=? and password=?";
	PST=CN.prepareStatement(msg);
	PST.setObject(1,request.getAttribute("id"));
	PST.setObject(2,request.getAttribute("pass"));
	RS=PST.executeQuery();
		if(RS.next()==true){
			if(RS.getInt("cnt")>0)
				{
				%>
				<script type="text/javascript">
		    	alert("로그인 성공했습니다!");
				location.href="guestList.jsp";
			  	</script>
				
			<% }
			 else{
			%>
			<script type="text/javascript">
	    	alert("아이디 비밀번호를 확인해주십시오!");
			location.href="guestlogin.jsp";
		  	</script>
		<%} 
		}
	%>
	
	
	
	
</body>
</html>
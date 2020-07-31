
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file ="ssi.jsp" %>
<%@page import="net.tis.sql.GuestSQL"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestDelete.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
	</style>
</head>
<body>

<script type="text/javascript">


    
	<%
    	try{
    		String data = request.getParameter("de");

    		sql.dbDelete(data);
    		//Gsabun=Integer.parseInt(request.getParameter("de"));
    	}catch(Exception e){
    		System.out.println(e+"의 이유로 실패하였습니다");
    	}
		response.sendRedirect("guestList.jsp");	
    %>
    


</script>
	
	
</body>
</html>
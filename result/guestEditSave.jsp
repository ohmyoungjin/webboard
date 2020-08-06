<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file = "ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestEditSave.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
<script type="text/javascript">
</script>	
</head>	
<body>
	<%
	Gsabun =Integer.parseInt(request.getParameter("sabun"));
	Gdata =	request.getParameter("up");
	Gtitle = request.getParameter("title");
	
	
	
	try{
	System.out.println(Gdata);
	System.out.println(Gtitle);
	System.out.println(Gsabun);
	
	msg="update guest set "+Gdata+"="+"+? where sabun ="+Gsabun;
	PST=CN.prepareStatement(msg);
	PST.setString(1,Gtitle);
	PST.executeUpdate();
	}catch(Exception e){ }
	%>
	<script type="text/javascript">
	alert("<%=Gsabun %>"+"사번데이터는 수정 됐습니다");
	location.href="guestList.jsp";
	</script>
</body>
</html>
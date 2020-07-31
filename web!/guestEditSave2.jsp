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
	Gname =	request.getParameter("name");
	Gtitle = request.getParameter("title");
	Gpay = Integer.parseInt(request.getParameter("pay"));
	Gemail = request.getParameter("email");
	
	
	
	try{
	System.out.println(Gdata);
	System.out.println(Gtitle);
	System.out.println(Gsabun);
	
	msg="update guest set name=?,title=?,pay=?,email=? where sabun ="+Gsabun;
	PST=CN.prepareStatement(msg);
	PST.setString(1,Gname);
	PST.setString(2,Gtitle);
	PST.setInt(3,Gpay);
	PST.setString(4,Gemail);
	PST.executeUpdate();
	}catch(Exception e){ }
	%>
	<script type="text/javascript">
	alert("<%=Gsabun %>"+"사번데이터는 수정 됐습니다");
	location.href="guestList.jsp";
	</script>
</body>
</html>
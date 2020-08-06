<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file ="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
	 	
	Gid = mr.getParameter("id");
	Gpassword = mr.getParameter("password1");
	Gname = mr.getParameter("name");
	Gnickname = mr.getParameter("nickname");
	Gfile =	mr.getFilesystemName("file1");
	System.out.print(Gfile);
	msg = "insert into mang values(?,?,?,?,?)";
	try {
		PST=CN.prepareStatement(msg);
		PST.setString(1, Gid);
		PST.setString(2, Gpassword);
		PST.setString(3, Gname);
		PST.setString(4, Gnickname);
		PST.setString(5, Gfile);
		PST.executeUpdate();
	/* Gfile =	mr.getParameter("file1");
	dto.setId(Gid);
	dto.setPassword(Gpassword);
	dto.setName(Gname);
	dto.setGfile(Gfile); */
	}catch(Exception e){
		System.out.print(e);
	}
	%>
	<script type="text/javascript">
		alert("회원가입성공 !")
		location.href="login2.html";
		
	</script>
</body>
</html>
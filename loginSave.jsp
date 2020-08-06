<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="ssi2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login~</title>
</head>
<body>
<script type="text/javascript">
						
	<%
		Gid=request.getParameter("id_ck");
		Gpassword=request.getParameter("pass_ck");
		System.out.println("넘어온아이디값 : "+Gid);
		System.out.println("넘어온 비밀번호값: "+Gpassword);
		
		msg = "select count(*)as cnt from mang where id_ck='"+Gid+"' and pw_ck='"+Gpassword+"'";
		try{
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true){Gtotal=RS.getInt("cnt");}
				if(Gtotal>0){%>
				alert("로그인성공!");
				location.href="boradList.jsp";	
				<% 	
				}else{ %>
					alert("아이디비밀번호를 확인해주세요!");
					location.href="login2.html";
			<%}
		}catch(Exception e){
			System.out.println("loginsave" +e);
		}
		%>
			</script>
	
</body>
</html>
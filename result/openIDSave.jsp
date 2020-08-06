<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [openIDSave.jsp] </title>
  <style type="text/css">
	*{ font-size: 26pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	</script>
</head>
<body>
  <p>
  
 <%
   //openIDSave.jsp 단독실행하면에러발생 
 try{
  Gdata=request.getParameter("userid");
  msg="select count(*) as cnt from guest where sabun = " + Gdata;
  ST=CN.createStatement();
  RS=ST.executeQuery(msg);
  if(RS.next()==true){ Gtotal = RS.getInt("cnt") ;}
  if(Gtotal>0){
  	%>
  	<script type="text/javascript">
  		alert("<%=Gdata %>"+"사번데이터는 이미 등록되어있습니다");
  		location.href="openID.jsp?idx="+"";
  		//open_form.userid.value="";
 
  	</script>
  	<%
  }else{%>
  
  	<script type="text/javascript">
		alert("<%=Gdata %>"+"사번데이터는 사용할수있습니다");
		window.opener.myform.sabun.value = <%= Gdata%>;
		window.opener.myform.idDuplication.value = "idCheck";
		close();
	</script>
  <%	
  }
 }catch(Exception ex){ System.out.println("에러 "+ex); }
%>	


</body>
</html>











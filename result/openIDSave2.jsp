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
	
	
</head>
<body>
  <p>
  
 <%
   //openIDSave.jsp 단독실행하면에러발생 
 try{
	String idc="idCheck"; 
	Gdata =request.getParameter("userid");
	msg = "select count(*)as cnt from guest where sabun="+Gdata;
  	ST=CN.createStatement();
  	RS=ST.executeQuery(msg);
  	if(RS.next()==true){
  		if(RS.getInt("cnt")>0){
  			%><script type="text/javascript">
  				
  				alert("아이디가 중복됐습니다")
  				location.href="openID.jsp?tis="+"";
  			</script>
  		
  		<% }else{%>
  			<script type="text/javascript">
  
				alert("사용하셔도 좋습니다")
				opener.myform.idDuplication.value="aa";
				opener.myform.title.value="aa";
				opener.myform.sabun.value=<%=Gdata%>;
				location.href="guestWrite.jsp?idx"+<%=Gdata%>;
				self.close();
			</script>
  		<% }
 }
	 
	 
 }catch(Exception ex){ System.out.println("에러 "+ex); }
%>	


</body>
</html>











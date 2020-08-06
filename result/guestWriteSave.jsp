<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave.jsp] </title>
  <style type="text/css">
	*{ font-size: 26pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	
</head>
<body>
  <p>
  <jsp:useBean id ="ob" class = "net.tis.sql.GuestSQL"/>
  <jsp:useBean id ="dto" class = "net.tis.sql.GuestDTO"/>
  
  
 <%
   //guestWriteSave.jsp 단독실행하면에러발생 
   int Gsabun = Integer.parseInt(request.getParameter("sabun"));
   String Gname = request.getParameter("name");
   String Gtitle = request.getParameter("title") ;
   int Gpay = Integer.parseInt(request.getParameter("pay"));
   String Gemail = request.getParameter("email");
   
    dto.setSabun(Gsabun);
    dto.setName(Gname);
    dto.setTitle(Gtitle);
    dto.setPay(Gpay);
    dto.setEmail(Gemail);
    
	ob.dbSelectcn(Gsabun);
	if(ob.dbSelectcn(Gsabun)>0){%>
		alert("중복된 값입니다")
		location.href="guestWrite.jsp"
		</script>
		<%
	}else if(ob.dbSelectcn(Gsabun)==0){
   
 	ob.dbInsert(dto);
	response.sendRedirect("guestList.jsp");}
%>

   

  <p>
  <a href="guestWrite.jsp">[등록]</a>
  <a href="index.jsp">[index]</a>
  <a href="guestList.jsp">[전체출력]</a><p><br>
</body>
</html>











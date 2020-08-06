<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestDetail.jsp]  </title>
  <style type="text/css">
	*{ font-size: 15pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
  <script type="text/javascript">
  </script>
  <jsp:useBean id = "dao" class = "net.tis.sql.GuestSQL"/>
</head>
<body>
  <%
    Gsabun = Integer.parseInt(request.getParameter("ix"));
  	System.out.println("넘어온 Gsabun=" +Gsabun);
  	
  	
	GuestDTO bean = dao.dbDetail(Gsabun);
	
	
		
	

	
     %>
 <p>
 <table width="900" border="1" cellspacing="0" cellpadding="5">
            <tr align="center">
                <td colspan="2"> <font color="pink">[<%=bean.getSabun()%>]</font>님의 상세페이지  </td>
               
            </tr>

            <tr> 
                <td rowspan="5" align="center"> <img src="./images/a1.png"> </td>
                <td>이름:<%=bean.getName() %></td>
            </tr>
            <tr>  
                <td>제목:<%=bean.getTitle() %></td>
            </tr>
            <tr> 
                <td>날짜:<%=bean.getWdate() %></td>
            </tr>
            <tr> 
                <td>급여:<%=bean.getPay() %></td>
            </tr>   
            	<td>메일:<%=bean.getEmail() %>
            <tr align="center">
                <td  colspan="2">                 
                    <a href="guestEdit2.jsp?tis=<%=bean.getSabun() %>">[수정]</a>
                    <a href="guestDelete.jsp?idx=<%=bean.getSabun()%>">[삭제]</a>
                    <a href="guestWrite.jsp">[등록]</a>
 					<a href="index.jsp">[index]</a>
					<a href="guestList.jsp">[전체출력]</a>
                </td>
            </tr> 
 <p>
     <jsp:include page ="guestReply.jsp"> 
      	<jsp:param name ="Gidx" value="<%=bean.getSabun() %>"/>
      </jsp:include>
	
	 
 </table>
 
 		
 <br>
 
 
 <p><br>
</body>
</html>





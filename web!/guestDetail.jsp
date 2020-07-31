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
</head>
<body>
  <%
    Gtitle = request.getParameter("ix");
  	System.out.println("넘어온 Gtitle=" +Gtitle);
    msg="select * from guest where title =  '" + Gtitle+"'" ;
    ST=CN.createStatement();
    RS=ST.executeQuery(msg); //조회한 한건 결과를 RS기억 

    if(RS.next()==true) {
     Gsabun = RS.getInt("sabun");
     Gname = RS.getString("name");
     Gtitle = RS.getString("title");
     Gwdate = RS.getDate("wdate");
     Gpay = RS.getInt("pay");
     Gemail = RS.getString("email");
     
    }
     %>
 <p>
 <table width="900" border="1" cellspacing="0" cellpadding="5">
            <tr align="center">
                <td colspan="2"> <font color="pink">[<%=Gsabun%>]</font>님의 상세페이지  </td>
               
            </tr>

            <tr> 
                <td rowspan="5" align="center"> <img src="./images/a1.png"> </td>
                <td>이름:<%=Gname %></td>
            </tr>
            <tr>  
                <td>제목:<%=Gtitle %></td>
            </tr>
            <tr> 
                <td>날짜:<%=Gwdate %></td>
            </tr>
            <tr> 
                <td>급여:<%=Gpay %></td>
            </tr>   
            	<td>메일:<%=Gemail %>
            <tr align="center">
                <td  colspan="2">                 
                    <a href="guestEdit2.jsp?tis=<%=Gsabun %>">[수정]</a>
                    <a href="guestDelete.jsp?idx=<%=Gsabun%>">[삭제]</a>
                    <a href="guestWrite.jsp">[등록]</a>
 					<a href="index.jsp">[index]</a>
					<a href="guestList.jsp">[전체출력]</a>
                </td>
            </tr> 
 <p>
     <jsp:include page ="guest_reply.jsp"> 
      	<jsp:param name ="Gidx" value="<%=Gsabun %>"/>
      </jsp:include>
	
	 
 </table>
 
 		
 <br>
 
 
 <p><br>
</body>
</html>





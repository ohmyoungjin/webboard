<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file ="ssi2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	 <table width="1200" border="1" cellspacing="0">
   		 <tr align="center">
   		 <td colspan="3">제목</td>
   		 <td>작성일자</td>
   		 <td>작성자</td>
   		 <td>조회</td>
   		 <tr>
   		
   		 
	<%
	msg="select*from(select rownum,b.title,b.wdate,b.nickname,b.hit,m.b_file from board b left join mang m on b.nickname=m.nickname)";
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
	while(RS.next()==true){
	//msg = "select rownum,b.*from board b";

		//RS3=ST3.executeQuery(msg3);
		
		%>
		
		<td><%=RS.getInt("rownum") %></td>
		<td colspan="2"><%=RS.getString("title")%></td>
		<td><%=RS.getDate("wdate") %></td>
		<td><img src="./images/<%=RS.getString("b_file") %>" width="30" height="30"> <%=RS.getString("nickname") %></td>
		<td><%=RS.getInt("hit") %></td>
		<tr>
	<%}
	//while end%>
			<td colspan="6">[i]</td>
	</table>
	
	<a href="boardWirte.jsp">[글쓰기]</a>
</body>
</html>
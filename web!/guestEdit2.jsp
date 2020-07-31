<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file = "ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[First.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<%
	Gdata=request.getParameter("tis");
	msg="select*from guest where sabun=" + Gdata;
	
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);

	if(RS.next()==true){
		Gsabun=RS.getInt("sabun");
		Gname =RS.getString("name");
		Gtitle=RS.getString("title");
		Gpay=RS.getInt("pay");
		Gemail=RS.getString("email");
	}
	%>
	<form action ="guestEditSave2.jsp">
     사번:<input type="text" name="sabun" value=<%=Gsabun %> readonly="readonly"> <br>
    이름:<input type="text" name="name" value=<%=Gname %>> <br>
    제목:<input type="text" name="title" value=<%=Gtitle %>> <br>
    급여:<input type="text" name="pay" value=<%=Gpay %>> <br>
    메일:<input type="text" name="email" value=<%=Gemail %> > <br>
	<input type ="submit" value="수정하기">  
	</form>
</body>
</html>
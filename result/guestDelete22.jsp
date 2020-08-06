<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file ="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestDelete.jsp]</title>
<style type="text/css">
	*{font-size:24pt;}
	</style>
</head>
<body>

<script type="text/javascript">
	<%Gdata=request.getParameter("idx");	
	String temp =(String)session.getAttribute("naver");
	if(temp == null || temp == "" ){%> 
		location.href="login.jsp"
		alert("삭제할 권한이없습니다 로그인 해주세요");
	<%	
	}else{
	%>
	    if (confirm("정말로 삭제하겠습니까?!")) {
	    	location.href="guestDelete2.jsp?de=<%=Gdata%>";
	    	alert("삭제 됐습니다!");
	    	
	    } else {
	    	alert("삭제를 취소하셨습니다!");
	    	location.href="guestList.jsp";
	    	} 
    
	<%}	%>



</script>
	
	
</body>
</html>
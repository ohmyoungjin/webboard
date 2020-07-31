<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestList.jsp]</title>
<style type="text/css">
#pline {
	margin-top: 35px;
}

* {
	font-size: 16pt;
}

a {
	font-size: 18pt;
	color: green;
	text-decoration: none;
}

a:hover {
	font-size: 20pt;
	color: blue;
	text-decoration: none;
	}
	.mang{background:none; border:none;}

</style>

<script type="text/javascript">

	function pagegood(){
		document.page.keyfield.value=""
		page.keyfield.focus()
	}

  </script>
</head>
<body>

<jsp:useBean id ="sql1" class = "net.tis.sql.GuestSQL"/>
<jsp:useBean id ="dto1" class = "net.tis.sql.GuestDTO"/>
<%
	sql1.GGtotal();
	GGtotal = sql1.GGtotal();
   //페이징,검색,댓글
  
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	Date da =new Date();
   //제목옆에 60분 =1시간 전에 올라온 댓글 
  	String pnum;
   int pageNum, pagecount;
   int start , end;
   int startpage , endpage;
   int tmp;
   
   String sqry=" ";
   String skey="",sval ="b";
   String returnpage ="아직은몰라용";
   
   skey=request.getParameter("keyfield");
   sval=request.getParameter("keyword");
   System.out.println("넘어온 필드! = " +skey + "키워드=" +sval );
   if(skey==null || skey=="" || sval==null || sval==""){
  	skey="";
   	sval="" ; 
   	sqry = " where name like '%%' ";
   }else{
  	 sqry = " where "+ sval +" like '%" + skey +"%'";
   }
	
	
   msg="select count(*) as cnt from guest "  + sqry;
   ST=CN.createStatement();
   RS=ST.executeQuery(msg);
   RS.next(); //if, while 없이 이동
   Gtotal = RS.getInt("cnt"); //Gtotal는 조회갯수를 기억합니다
  
 //////////////////////////////
 	
 	
 	returnpage = "&keyword="+sval+"&keyfield=" +skey; 
 	//msg = "select*from(select rownum rn,a.*from (select*from guest order by sabun)a "+sqry+")where rn between " +start+ " and "+end; ;
 	
	sql1.dbPaging(request.getParameter("pageNum")); //-- 1순위
	
	
 	
 	
 
 	
 //조회한전체결과를 RS기억 
 %>

	<p id="pline">
	<table width="900" border="1" cellspacing="0">
		<tr align="right">
			<td colspan="7">총레코드갯수: <%=Gtotal %>/<%=GGtotal %> &nbsp;&nbsp;
			</td>
		</tr>

		<tr bgcolor="yellow" align="center">
			<td>행번호</td>
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>
			<td>삭제!</td>
		</tr>

		<%
	
  //guestList.jsp문서는 단독실행가능 
    ArrayList<GuestDTO> LG = sql1.dbSelect();
  	for(int i=0;i<LG.size();i++) {
		dto = LG.get(i);
   
	%>
		<tr onmouseover="style.backgroundColor='rgb(0,200,200)'" 
			onmouseout="style.backgroundColor='' ">
			<td><%= dto.getGGrn() %></td>
			<td><%= dto.getSabun() %></td>
			<td><%= dto.getName() %></td>
			<td><a href="guestDetail.jsp?ix=<%= dto.getName()%>"><%=dto.getName()%></a><font style= 'font-size:12pt; color:red;'></font>
			</td>
			<td><%=dto.getPay() %></td>
			<td><%=dto.getHit()%></td>
			<td align="center"><button type="button" class="mang"
              onclick="location.href='guestDelete.jsp?del=<%=dto.getSabun()%>'"><img src="images/delete.png"></td>
		</tr>
		<% } %>
	
	<tr>
		<td colspan="7" align="center">
		<% 
		if(sql1.startpage>10){
		out.println("<a href=guestList.jsp?pageNum="+(sql1.startpage-1)+returnpage+">[이전]</a>");
		}
		
		for(int i=sql1.startpage; i<=sql1.endpage; i++){
			if(i==sql1.pageNum){
				out.println("<font style='font-size:20pt; color:red'>["+i+"]</font>");
			}else{
				out.println("<a href=guestList.jsp?pageNum="+i+returnpage+">["+i+"]</a>");
				}
			if(i==sql1.pagecount+1){
				break;
			}
			}
			//if(endpage>pagecount)
			//{
			//	out.println("<a href=guestList.jsp?pageNum="+i+">["+i+"]</a>");
			//}
			//else{
			//	out.println("<a href=guestList.jsp?pageNum="+i+">["+i+"]</a>");
		//	}
		
		if(sql1.pagecount>sql1.startpage){
			out.println("<a href=guestList.jsp?pageNum="+(sql.endpage+1)+returnpage+">[다음]</a>");
		}
		%>
	</tr>
		</td>
		<tr>
		<td colspan="7" align="center">
		<a href="guestWrite.jsp">[등록]</a>
		<a href="index.jsp">[index]</a>
		<a href="login.jsp">[로그인]</a>
		<a href="guestList.jsp">[전체출력]</a>
		
		</td>
	</tr>
	<tr>
		<td colspan="7" align="center">
			<form action="guestList.jsp" name ="page">
				검색:
				<select name="keyword" onchange ="pagegood()">
					<option value="">검색</option>
					<option value="sabun" 
                        <%if(sval.equals("sabun")){out.println("selected");}
                        %>>사번검색</option>                     
                     <option value="name" 
                        <%if(sval.equals("name")){out.println("selected");}
                        %>>이름검색</option>
                     <option value="title"
                        <%if(sval.equals("title")){out.println("selected");}
                        %>>제목검색</option>
				</select>
				<input type="text" name="keyfield" size="10" placeholder="검색어입력" value="<%=skey%>">
				
				
				<input type="submit" value="검 색 ">
			</form>
		</td>
	</tr>
	</table>
	
</body>
</html>





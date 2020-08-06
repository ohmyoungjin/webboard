<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat"%>      
<%@ page import="java.util.Date" %> 
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList.jsp]  </title>
  <style type="text/css">
   
	*{ font-size: 20pt; }
	a{ font-size: 18pt; color:blue; text-decoration:none; }
	a:hover{ font-size:20pt; color:green;  text-decoration:none;  }
  </style>
	
  <script type="text/javascript">
  </script>
</head>
<body>
 <jsp:useBean id ="dao" class = "net.tis.sql.GuestSQL"/>


 <%
 ///////////////////////////////////////////////////
 //조건상관없이 총레코드데이터갯수
 msg="select count(*) as cnt from guest " ; 
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 RS.next(); 
 GGtotal = RS.getInt("cnt"); //Gtotal = 316기억 
 ///////////////////////////////////////////////////

 
 
 //2020-07-28-목요일  페이징,검색,댓글 
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
 Date dt = new Date( );
  	
 
  String pnum; //<a href="guestList.jsp?pageNum=14"> [14] </a>
  int pageNUM, pagecount;  
  int start, end;
  int startpage, endpage ;
  int tmp; 
 
  String sqry=" ";
  String skey="", sval="" ;
  String returnpage="";
  
  skey = request.getParameter("keyfield");
  sval = request.getParameter("keyword");
  System.out.println("넘어온 필드=" + skey + " 키워드=" + sval);
  if(skey==null || skey=="" || sval==null || sval==""){
  	skey="";
  	sval="" ; 
  	sqry = " where name like '%%' "; //검색필드,키워드 없을때 모두출력
  }else{
  	sqry = " where "+ skey +" like '%" + sval +"%'";
  }
 
  returnpage="&keyfield="+skey+"&keyword="+sval;
  System.out.println(returnpage); ////쉬는시간 조별,개인별,직접질문 
 ///////////////////////////////////////////////////////////////////
 //검색레코드갯수 
 msg="select count(*) as cnt from guest "  + sqry;
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 RS.next(); //if, while 없이 이동
 Gtotal = RS.getInt("cnt"); //Gtotal는 조회갯수를 기억합니다
  
  ///////////////////////////////////////////////////////////////////
  
  pnum = request.getParameter("pageNum");  //[14]클릭하면 문자로 14로 기억
  if( pnum==null || pnum==""){ pnum="1"; }
  pageNUM = Integer.parseInt(pnum);        //[14]클릭하면 숫자로 14로 기억
  //System.out.println("클릭한 페이지 = " + pageNUM);
  
  start = (pageNUM-1)*10+1 ; //[14]클릭  시작행 131
  end = (pageNUM*10) ; //[14]클릭  끝행 140
  
  //[이전] [11]  ~[14]클릭~~ [20][다음]
  tmp = (pageNUM-1)%10 ; //14-1%10 결과은 3  
  startpage = pageNUM-tmp ; //11   31
  endpage = startpage+9 ; //20     40
  
  //페이지갯수를 구해야 이전,다음 이동이 가능합니다
  //총페이지수 Gtotal=316  pagecount=32
  if( Gtotal%10==0 ) { pagecount = Gtotal/10; }
  else { pagecount = (Gtotal/10)+1; }
  
  if(endpage>pagecount) { endpage=pagecount; }
     
      
  ///////////////////////////////////////////////////////////////
 %>
 
 <table width="1200" border="1" cellspacing="0" align="center">
   <tr align="center">
   	 <td colspan="7">
   	   <a href="index.jsp">[index]</a> 
   	   <a href="login.jsp">[로그인]</a> &nbsp;
   	     총레코드갯수:<%=Gtotal %> /<%=GGtotal %> &nbsp;&nbsp;
   	  </td>
   
   
   <tr bgcolor="yellow">
    <td>행번호</td> <td>사번</td> <td>이름</td> 
    <td>제목</td>   <td>날짜</td> <td>조회수</td> <td>삭제</td>
   </tr>

<%
	
  //guestList.jsp문서는 단독실행가능 
   ArrayList<GuestDTO> LG = dao.dbSelect(sqry,start,end);
  	for(int i=0;i<LG.size();i++) {
		dto = LG.get(i);
	String msg3 = " select count(*)as cnt from guest g inner join guestreply r on r.sabun = g.sabun and r.sabun = " +dto.getSabun(); 
	ST3=CN.createStatement();
	RS3=ST.executeQuery(msg3);
	if(RS3.next()==true)
	System.out.println(RS3.getInt("cnt"));
%>   
   <tr onmouseover="style.backgroundColor='rgb(0,200,200)'" 
			onmouseout="style.backgroundColor='' ">
			<td><%= dto.getGGrn() %></td>
			<td><%= dto.getSabun() %></td>
			<td><%= dto.getName() %></td>
			<td><a href="guestDetail.jsp?ix=<%= dto.getSabun()%>"><%=dto.getName()%></a><font style= 'font-size:12pt; color:red;'>[<%=RS3.getInt("cnt") %>]</font>
			</td>
			<td><%=dto.getPay() %></td>
			<td><%=dto.getHit()%></td>
			<td align="center"><button type="button" class="mang"
              onclick="location.href='guestDelete.jsp?idx=<%=dto.getSabun()%>'"><img src="images/delete.png"></td>
		</tr>
<% } %>  
			
 <tr>
   <td colspan="7" align="center">
    <%
    //이전
     if ( startpage > 10 )  { //[1] > 10 만족하지 않아서 [이전][1] ~  
   	  out.println("<a href=guestList.jsp?pageNum="+(startpage-10)+returnpage+">[이전]</a>");	 
   	 }
    
      for(int i=startpage;i<=endpage; i++){
      	if(i==pageNUM){
      		out.println("<font style='font-size:22pt; color:red'>["+i+"]</font> ");	
      	}else{
   	     out.println("<a href=guestList.jsp?pageNum="+i+returnpage+">["+i+"]</a>");
      	}
   	  }//for end
    
      
   	 //다음
   	 if ( endpage < pagecount )  { //[10] < 32크면
   	  out.println("<a href=guestList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");	 
   	 }
    %> 
   </td>
 </tr> 
  
 <tr>
   <td colspan="7" align="center">  
     <form action="guestList.jsp">
           검색:
       <select name="keyfield">
         <option value="">-----검색키워드-----</option>
     	 <option value="name">이름검색</option> 
     	 <option value="title">제목검색</option> 
     	 <option value="">내용검색</option> 
     	</select>
     	<input type="text" name="keyword" size="10" placeholder="검색어입력">
     	<input type="submit" value=" 검 색 "> 
     </form>
   </td>
 </tr> 
 
 </table>		
</body>
</html>













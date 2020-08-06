
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWrite.jsp 입력화면]  </title>
  <style type="text/css">
   *{ font-size: 20pt; }
   a{ font-size: 20pt; color:green; text-decoration:none; }
   a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
   <%String Gmsg = request.getParameter("ts"); %>
   

   <script type="text/javascript">
      var Gflag=false;
      
      function nullCheck(){
         //돔 = DOM 모댈 객체 document, window, location, history 생략 가능
         var a = document.myform.sabun.value;
         var b = document.myform.name.value;
         var c = document.myform.title.value;
         var d = document.myform.pay.value;
        // var sb = document.myform.sabun_ch.value;
         var len_d= /^([0-9]{2,2})$/
         if(a==null || a==""){
            //alert("사번 데이터를 입력하세요");
             document.getElementById("sabun_ch").innerHTML="<font style='font-size:12pt; color:red'>*사번데이터를 입력하세요*</font>";
            myform.sabun.focus();
            return;
         }else{
            document.getElementById("sabun_ch").innerHTML="";
            myform.name.focus();   
         }
         if(b==null || b==""){
            //alert("이름 데이터를 입력하세요");
            document.getElementById("name_ch").innerHTML="<font style='font-size:12pt; color:red'>*이름데이터를 입력하세요*</font>";
            myform.name.focus();
            return;
         }else{
            document.getElementById("name_ch").innerHTML="";
            myform.title.focus();   
         }
         if(c==null || c==""){
            //alert("제목 데이터를 입력하세요");
            document.getElementById("title_ch").innerHTML="<font style='font-size:12pt; color:red'>*제목데이터를 입력하세요*</font>";
            myform.title.focus();
            return;
         }else{
            document.getElementById("title_ch").innerHTML="";
            myform.pay.focus();   
         }
         if(d==null || d==""){
            //alert("급여 데이터를 입력하세요");
            document.getElementById("pay_ch").innerHTML=sb;
            myform.pay.focus();
            return;
         }else if(len_d.test(d)==false){
        	document.getElementById("pay_ch").innerHTML="<font style='font-size:12pt; color:red'>*숫자2개를 입력하세요*</font>";
         	return;
         	myform.pay.focus();
         }else{
            document.getElementById("pay_ch").innerHTML="";
            myform.email.focus();   
         }
        
        
         
         var check = myform.idDuplication.value;
         if(check != "idCheck"){
        	  document.getElementById("sabun_ch").innerHTML="<font style='font-size:12pt; color:red'>*중복을 확인하세요*</font>";
            return;
         }
         
         
         
         document.myform.submit(); // action 속성의 문서랑 연결됨
      }
      
      function info(){
         window.open("popup.jsp","??","width=350,height=550,left=400,top=200");
      }
      
      function idCheck(){
         
         var len_sabun= /^([0-9]{4,4})$/
         var a=document.myform.sabun.value;
         Gsabun=a;
         if(len_sabun.test(a)==false){
        	document.getElementById("sabun_ch").innerHTML="<font style='font-size:12pt; color:red'>*사번데이터 숫자 4자리를 입력하세요*</font>";
            myform.sabun.focus();
            return;
         }
         else{
        	 document.getElementById("sabun_ch").innerHTML="";
         }
         open("openID.jsp?idx="+a,"bb","width=500,height=170,left=600,top=200");
         
      }
      
      function inputIdChk(){
    	  document.myform.idDuplication.value="idUncheck";
      }
   </script>
</head>
<body>

 <p>
 guestWrite.jsp문서 입력화면 <p>
 
 <form name="myform" method="get" action="guestWriteSave.jsp">
    사번:<input type="text" name="sabun" maxlength="4" size="10" onkeydown="inputIdChk()">
      <input type="button" onclick="idCheck();" value="ID중복">
       <span id="sabun_ch" ></span>  
      <br>
    이름:<input type="text" name="name" ><span id="name_ch"></span> <br>
    제목:<input type="text" name="title" value="rain"><span id="title_ch"></span> <br>
    급여:<input type="text" name="pay" value="24"><span id="pay_ch"></span> <br>
    메일:<input type="text" name="email" value="bc@ti.org" > <br>
      <input type="button" onclick="nullCheck();" value="등록하기">
      <input type="hidden" name="idDuplication" value="idUncheck">
      <input type="reset" value="입력취소">
 </form>
   
 <br>
 <a href="guestWrite.jsp">[등록]</a>
 <a href="index.jsp">[index]</a>
 <a href="login.jsp">[로그인]</a>
 <a href="guestList.jsp">[전체출력]</a>
 <p><br>
 <jsp:include page="guest_footer.jsp"></jsp:include>
</body>
</html>



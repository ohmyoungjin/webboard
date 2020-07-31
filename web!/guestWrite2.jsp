
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWrite2.jsp 입력화면]  </title>
  <style type="text/css">
	*{ font-size: 20pt; }
	a{ font-size: 20pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	var Gflag = false;
	
	function nullCheck(){
		var a = document.myform.sabun.value;
		var b = document.myform.name.value;
		var c = document.myform.title.value;
		var d = document.myform.pay.value;
		var e = document.myform.idDuplication.value;
		var aSize = document.myform.sabun.value.length;
		var openwin;
		if(a==null || a==""){
			myform.sabun.focus();
		}
		if(b==null || b==""){
			alert("이름 데이터를 입력하시오");
			myform.name.focus();
			return;
		}else{myform.title.focus();}
		
		
		if(c==null || c==""){
			alert("제목 데이터를 입력하시오");
			myform.title.focus();
			return;
		}else{myform.pay.focus();}
		
		var len_d = /^[0-9]{2}/
		if(d == null || d==""){
			document.getElementById("pay_ch").innerHTML="<font style='font-size:12pt;' color='red'>*급여를 입력해주십시오</font>";
			myform.pay.focus();
		}
		
		else if(len_d.test(d)==false){
			document.getElementById("pay_ch").innerHTML="<font style='font-size:12pt;' color ='red'>*급여는 2자리숫자만 입력해주시오</font>";
			myform.pay.focus();
			return;
		}else{
			document.getElemetById("pay_ch").innerHTML="";
			myform.email.focus();
			}
		
		if(document.myform.idDuplication.value != "aa");
		{				
			document.getElementById("sabun_ch").innerHTML="<font style='font-size:12pt;' color='red'>*아이디 중복체크를 해주십시오.</font>";
			
			return;
		}	
	  document.myform.submit();
	}//end
	
	function idCheck(){
		a = document.myform.sabun.value;
		len_sabun= /^[0-9]{4}/
		if(len_sabun.test(a)==false){
			document.getElementById("sabun_ch").innerHTML="<font style='font-size:12pt' color='red'>*사번은 4자리숫자입력해라</font>";
			myform.sabun.focus();
			return;
		}
		else{ document.getElementById("sabun_ch").innerHTML="";}
		
		openwin = open("openID.jsp?tis="+a,"","width=500,height=150,left=500,top=200");
		
	}//end
	
	function info(){
		//1파일명,2명명,3크기위치
		window.open("popup.jsp","맹이","width=400,height=600,left=300,top=300")	;
	}//end
	
	</script> 
</head>
<body>
 
 <p>
 guestWrite.jsp문서 입력화면 <p>
 
 <form name="myform" method="post" action="guestWriteSave.jsp">
    사번:<input type="text" name="sabun" maxlength="4"> 
		<input type="button" onClick="idCheck();" value="ID중복">
		<span id="sabun_ch"></span><br>
    이름:<input type="text" name="name" value="kim"> <br>
    제목:<input type="text" name="title" value="hi"> <br>
    급여:<input type="text" name="pay" value=""> 
    	<span id="pay_ch"></span><br>
    메일:<input type="text" name="email" value="bc@ti.org" > 
    	<span id="email_ch"></span><br>
      <input type="button" onclick = "nullCheck();" value="등록하기">
      <input type="reset" value="입력취소">
      <input type="hidden" name ="idDuplication" value="idUncheck">
      
 </form>
	
 <br>
 <a href="guestWrite.jsp">[등록]</a>
 <a href="index.jsp">[index]</a>
 <a href="guestList.jsp">[전체출력]</a>
 <p><br>
</body>
</html>




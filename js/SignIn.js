
	function idcheck() {
		var a = document.Signin.id.value;
		var b = document.Signin.password1.value;
		var c = document.Signin.password2.value;
		var d = document.Signin.name.value;
		var e = document.Signin.nickname.value;
		var id_leng= /^([0-9]{2,2})$/ 
		if(a==null || a==""){
			 id_ch.innerHTML="<font style='font-size:12pt; color:red'>*아이디를 입력하세요*</font>";
			 document.Signin.id.focus();
			 return;
		}else{
			id_ch.innerHTML="";
			Signin.password1.focus();

		}
		
		if(b==null || b==""){
			password1_ch.innerHTML="<font style='font-size:12pt; color:red'>*비밀번호를 입력하세요*</font>";
            document.Signin.password1.focus();
            return;
         }else{
            password1_ch.innerHTML="";
            document.Signin.password2.focus();   
         }
		if(c==null || c==""){
			 password1_ch.innerHTML="<font style='font-size:12pt; color:red'>*비밀번호를 입력하세요*</font>";
			 document.Signin.password2.focus();
			 return;
		}else{
			password1_ch.innerHTML="";
			Signin.name.focus();
		}
		if(b!=c){
			 password2_ch.innerHTML="<font style='font-size:12pt; color:red'>*두개의비밀번호는 같아야합니다*</font>";
			 document.Signin.password1.focus();
			 return;
		}else{
			password2_ch.innerHTML="";
			Signin.name.focus();
		}
		if(d==null || d==""){
			 name_ch.innerHTML="<font style='font-size:12pt; color:red'>*이름을 입력하세요*</font>";
			 document.Signin.name.focus();
			 return;
		}else{
			name_ch.innerHTML="";
			Signin.nickname.focus();
		}
		if(e==null || e==""){
			 nickname_ch.innerHTML="<font style='font-size:12pt; color:red'>*닉네임을 입력하세요*</font>";
			 document.Signin.nickname.focus();
			 return;
		}
		
		document.Signin.submit();
		
	}//end
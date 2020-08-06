<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<script src="js/SignIn.js"></script>
<style>
.mang {
	color: red;
	margin-left: 20px
}


.mang2 {
	margin: auto;
	width: 800px;
	background-color: white;
}

.mang3 {
	color: gray;
	width: 500px;
	height: 50px;
	margin-left: 20px;
}

.mang4 {
	color: gray;
	width: 300px;
	height: 50px;
	margin-left: 20px
}

.mang5 {
	width: 190px;
	height: 50px;
	margin-left: 20px
}

.mang6 {
	width: 600px;
	height: 150px;
	margin-left: 20px
}

.mang7 {
	width: 100px;
	height: 50px;
	border: 1px solid;
}

.mang8 {
	background-color: lightskyblue;
	width: 100px;
	height: 50px;
	border: 1px solid;
}

.main {
	margin-left: 20px
}
</style>
</head>
<body>

	<div style="background-color: silver; width: 700px">
		<form name="Signin" action="SignInSave.jsp" method="post" enctype="multipart/form-data">
			<h2 align="center">회원가입</h2>
			<h4 align=right>
				<div class="mang" style="margin-right: 70px;">*표시는 필수 입력 항목입니다</div>
			</h4>

			<div class="mang2">
				<p></p>
				<div class="main">
					<font style="color: gray"> 본인 예약만 가능합니다<br> *만 14세 미만
						소아청소년 회원가입시, 보호자(법적 대리인)의 본인 인증이 필요합니다.
					</font>
				</div>
				<p></p>
				<div>
					<font class="mang">*</font>아이디<br> 
					<input type="text" class="mang3" name="id" > 
					 <input type="button" onclick="idCheck();" value="ID중복">
					<span id="id_ch"></span>
				</div>

				<p></p>
				<div>
					<font class="mang">*</font>비밀번호<br> 
					<input type="password"	class="mang3" name="password1">
					<P></P>
					<input type="password" class="mang3" name = "password2">
					<span id="password1_ch"></span>
					<br>
					<span id="password2_ch"></span>
				</div>
				<p></p>

				<div >
					<font class="mang">*</font>이름<br> 
					<input type="text" value="" class="mang4" name="name">
					<span id="name_ch"></span>
				</div>
				<p></p>
				<div >
					<font class="mang">*</font>닉네임<br> <input type="text" value="" class="mang4" name="nickname">
					 <input type="button" value="닉네임중복">
					 <span id="nickname_ch"></span>
				</div>
				<br>
				아이콘설정 : <input type="file" name="file1">
				<br>
				<div align="center">
					<input type="button" value="확인" class="mang8" onclick="idcheck()">
					<input type="button" value="취소" class="mang7">
				</div>

			</div>
			<p></p>


			<br>

			
			</p>
		</form>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
<style>
	ul>li{line-height:3rem; list-style:none;}
	.input1 {
		width:300px;
		height:40px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
</style>
</head>
<body>

	<h2>Member Login</h2>

	<form action="./member_form_ok2.jsp" method="post" autocomplete="off">
		<hr>
		<ul>
			<li><input class="input1" type="text" name="memberID" placeholder="아이디 입력"  required></li>
			<li><input class="input1" type="password" name="memberPW" placeholder="비밀번호 입력"  required></li>
		</ul>
		<hr>
		
		<!-- Submit -->
		<input type="submit" value="전송">
	</form>

</body>
</html>
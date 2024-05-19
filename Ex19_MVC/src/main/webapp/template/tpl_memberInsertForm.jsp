<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 입력 폼 페이지</title>
<style>
	ul>li{line-height:3rem;list-style:none;}
	.input1{
		width:300px;
		height:40px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
</style>
</head>
<body>

	<h2>Member Insert Form</h2>
	<form action="/Ex19_MVC/memberInsert.do" method="POST" autocomplete="off">
		<hr>
		<ul>
			<li><input class="input1" type="text" name="id" placeholder="아이디 입력" required></li>
			<li><input class="input1" type="password" name="pw" placeholder="비밀번호 입력" required></li>
			<li><input class="input1" type="text" name="name" placeholder="이름 입력" required></li>
			<li><input class="input1" type="text" name="email" placeholder="이메일 입력" required></li>
			<li><input class="input1" type="text" name="phone" placeholder="전화번호 입력" ></li>
		</ul>
		<hr>
		<input type="submit" value="입력">
		<button onclick="location.href='/Ex19_MVC/memberList.do';return false;">회원 리스트</button>
	</form>
</body>
</html>
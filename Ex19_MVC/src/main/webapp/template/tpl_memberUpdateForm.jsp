<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 수정 폼 페이지</title>
<style>
	ul>li{line-height:3rem;list-style:none;}
	.input1{
		width:300px;
		height:40px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
	.input2{
		color:#bbb;
		border:none;
	}
</style>
</head>
<body>

	<h2>Member Update Form</h2>
	<form action="/Ex19_MVC/memberUpdate.do" method="POST" autocomplete="off">
		<hr>
		<ul>
			<li><input class="input1 input2" type="text" name="id"  value="${record.id}" readonly>readonly</li>
			<li><input class="input1" type="password" name="pw"  value="${record.pw}"></li>
			<li><input class="input1" type="text" name="name"  value="${record.name}"></li>
			<li><input class="input1" type="text" name="email"  value="${record.email}"></li>
			<li><input class="input1" type="text" name="phone"  value="${record.phone}"></li>
		</ul>
		<hr>
		<input type="submit" value="수정">
		<button onclick="location.href='/Ex19_MVC/memberList.do';return false;">회원 리스트</button>
	</form>
</body>
</html>
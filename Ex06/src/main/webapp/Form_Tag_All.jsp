<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex06</title>
<style>
	ul>li {line-height:2.5rem;}
</style>
</head>
<body>

	<h1>Member Form</h1>

	<form action="./Form_Tag_All_ok.jsp" method="post" autocomplete="off">
		<hr>
		<ul>
			<li>
				<!-- Text Form -->
				아이디 : <input type="text" name="id">
			</li>
			<li>
				<!-- Radio Form -->
				좋아하는 동물은? :
				<input type="radio" name="animal" value="호랑이"> 호랑이
				<input type="radio" name="animal" value="사자"> 사자
				<input type="radio" name="animal" value="코끼리"> 코끼리
				<input type="radio" name="animal" value="악어"> 악어
			</li>
			<li>
				<!-- Checkbox Form -->
				좋아하는 과일은? :
				<input type="checkbox" name="fruit" value="사과"> 사과
				<input type="checkbox" name="fruit" value="수박"> 수박
				<input type="checkbox" name="fruit" value="비나나"> 바나나
				<input type="checkbox" name="fruit" value="배"> 배
			</li>
			<li>
				<!-- Select Form -->
				좋아하는 애완동물은? :
				<select name="pet" id="pet-select">
					<option value="">-- Please choose an option --</option>
					<option value="dog">Dog</option>
					<option value="cat">cat</option>
					<option value="panda">Panda</option>
					<option value="hamster">Hamster</option>
					<option value="spider">Spider</option>
				</select>
			</li>
			<li>
				<!-- Textarea Form -->
				회원가입 이유를 적어주세요!
				<br>
				<textarea name="content"  rows="5" cols="60"  style="resize:none"></textarea>
			</li>
		</ul>
		<hr>
		
		<!-- Submit -->
		<input type="submit" value="전송">
	</form>

</body>
</html>
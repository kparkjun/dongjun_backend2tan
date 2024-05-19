<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex04_Form</title>
</head>
<body>

	<form action="./Form_ok.jsp"  method="post">
	
		<input type="radio" name="animal" value="tiger">호랑이
		<input type="radio" name="animal" value="lion">사자
		<input type="radio" name="animal" value="elephant">코끼리
		<input type="radio" name="animal" value="alligator">악어
		<hr>
		
		<input type="checkbox"  name="fruit" value="apple">사과
		<input type="checkbox" name="fruit" value="watermelon">수박
		<input type="checkbox" name="fruit" value="banana">바나나
		<input type="checkbox" name="fruit" value="pear">배
		<hr>
		
		<input type="submit" value="전송">
		
	</form>

</body>
</html>
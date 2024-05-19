<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sampleForm</title>
</head>
<body>
		
		<h1>Sample Form</h1>
		<hr>
		<form  action="./sampleForm_ok.jsp?schoolName=한국대학교"  method="POST">
			<ul>
				<li>번호(정수) : <input type="text" name="num"></li>
				<li>이름(문자) : <input type="text" name="name"></li>
				<li>점수(실수) : <input type="text" name="score"></li>
			</ul>
			<input type="submit" value="전송">
		</form>
		<hr>
</body>
</html>
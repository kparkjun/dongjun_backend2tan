<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sampleForm_ok</title>
</head>
<body>

	<%
		// 한글 깨짐 처리를 위한 인코딩 지정
		request.setCharacterEncoding("utf-8");
	
		// 전송된 값 변수에 저장
		String schoolName= request.getParameter("schoolName");
		 int num=Integer.parseInt(request.getParameter("num"));
		 String name=request.getParameter("name");
		 float score=Float.parseFloat(request.getParameter("score"));
		/* String numStr=request.getParameter("num");
		int num=Integer.parseInt(numStr); */
		
		// out 내장 객체를 사용하여 테스트 출력
		//out.println("번호 : "+num+"<br>");
		//out.println("이름 : "+name+"<br>");
		//out.println("점수 : "+score);
	%>
	<h1><%=schoolName%> <span style="text-decoration:underline"><%=name%></span> 학생의 성적</h1>
		<hr>
		<form>
			<ul>
				<li>번호(정수) :<%=num%></li>
				<li>이름(문자) : <%=name%></li>
				<li>점수(실수) : <%=score%></li>
			</ul>
		</form>
		<hr>

</body>
</html>
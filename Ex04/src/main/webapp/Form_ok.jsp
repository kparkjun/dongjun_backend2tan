<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex04_Form_ok</title>
</head>
<body>

	<%
		// 전송된 폼 값들 받기
		String animal=request.getParameter("animal");
		// String fruit=request.getParameter("fruit");
		String fruits[]=request.getParameterValues("fruit");
		
		// 출력
		out.println(animal+"<br>");
		//out.println(fruit+"<br>");
		//out.println(fruits);
		
		// 향상된 for 반복문으로 출력
		for(String fruit:fruits) {
			// System.out.println(fruit);
			// out.println(fruit+"<br>");
			out.println(fruit);
		}
		
	%>

</body>
</html>
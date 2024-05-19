<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Enumeration" %>
 <% request.setCharacterEncoding("utf-8"); %>
 
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 여러 개 값을 선택할 수 있는 체크박스로 전송한 값 받기(name이 다른 경우) --> Enumeration 사용
		request.getParameterNames();
		Enumeration<String> enums=request.getParameterNames();
		// <String> 안써주면 노랑 밑줄 출력(경고)
		// request.getParameter(String name); --> 매갯값이 필요
		//out.println(enums);
		
		// enum 변수가 값을 가지고 있다면 --> true
		// hasMoreElements() 메서드 --> 요소가 더 남아있는지 확인해서, 읽어 올 요소가 더 있으면 true, 없으면 false를 반환
		// nextElements() 사용시 주의 --> 이 메서드를 호출하기 전에 먼저 hasMoreElements()를 호출해서 읽어 올 요소가 남아있는지를 꼭 체크
		while(enums.hasMoreElements()){
			String name=(String) enums.nextElement();
			//out.println(name+"<br>");
			
			// iphone만 검색(추출)
			if(name.startsWith("iphone")){
				String value=request.getParameter(name);
				out.println(value);
			}
			
		}
	%>

</body>
</html>


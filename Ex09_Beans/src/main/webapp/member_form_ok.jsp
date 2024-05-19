<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
</head>
<body>

	<%!
		// 샘플 아이디
		private static final String sampleID="관리자";
		private static final String samplePW="1234";
		
		public boolean returnValue=false;
	%>

	<%
		// 한글 깨짐 인코딩 지정
		request.setCharacterEncoding("utf-8");
		
		// 데이터 받기
		String memberID=request.getParameter("memberID");
		String memberPW=request.getParameter("memberPW");
		
		// 출력
		out.println("sampleID : "+sampleID+"<br>");
		out.println("samplePW : "+samplePW+"<br><hr>");
		out.println("memberID : "+memberID+"<br>");
		out.println("memberPW : "+memberPW+"<br><hr>");
		
		// 입력 정보가 관리자가 맞으면 true 출력
		if(memberID.equals(sampleID)&&memberPW.equals(samplePW)){
			returnValue=true;
		}
		
		// 최종 출력
		out.println("관리자 아이디가 맞나요? => "+returnValue);
	%>

</body>
</html>
<%@page import="com.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 페이지</title>
</head>
<body>
	<h2>MemberController.doHandle() => /memberList.do 리스트 페이지 호츌</h2>
	<hr>
	<%
		@SuppressWarnings("unchecked")
		List<MemberVO> dataList=(List<MemberVO>)request.getAttribute("dataList");
	
		// 데이터가 있을 때
		if(!dataList.isEmpty()){
			// 향상된 for문 사용해서 반복 출력
			out.println("<ul style='line-height:2rem'>");
			for(MemberVO m:dataList){
				out.println("<li>"+m+"</li>");
			}
			out.println("</ul>");
		}
		else{
			out.println("데이터가 없습니다.");
		}
		
	%>
	<hr>
	<button onclick="location.href='memberInsertForm.do';">입력</button>
	<button onclick="location.href='memberDelete.do';">삭제</button>

</body>
</html>
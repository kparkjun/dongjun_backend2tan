<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="db" class="member.site.com.MemberDAO" scope="application" />
<%
	// 전체 삭제
	db.deleteAll();
%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Member Delete All</h2>
	<hr>
		<p>모든 요소가 삭제되었습니다.</p>
		<button onclick="location.href='member_list.jsp';">리스트 페이지로 이동하기</button>
	<hr>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 넘어온 ID값 받기
	String id=request.getParameter("id");
%>

<jsp:useBean id="db" class="member.site.com.MemberDAO" scope="application" />
<%
	// 삭제
	db.delete(id);

	// 페이지 이동 -> response.sendRedirect()
	response.sendRedirect("http://localhost/Ex11_CRUD/member_list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
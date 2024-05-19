<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
    
<jsp:useBean id="member" class="member.test.com.MemberVO" />    
<jsp:setProperty name="member"  property="*" />

<%
	// 테스트 출력
	out.println(member.getId()+"<br>");
	out.println(member.getPw()+"<br>");
	out.println(member.getName()+"<br>");
	out.println(member.getEmail()+"<br>");
	out.println(member.getPhone()+"<br>");
	
	// 테스트 출력이 잘 성공되었다면 아래에서 잔달된 값들을 DB에 입력 -> 이때, MemberDB를 유즈빈으로 불러와서 사용
	
%>
 
 <jsp:useBean id="db" class="member.test.com.MemberDAO" scope="application" />
 <%
 	db.add(member); // 전달된 한 명의 회원 정보를 DB에 임력하는 순간
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
</head>
<body>

	<h2>입력하신 정보가 DB에 등록되었습니다.</h2>
	<hr>
	<ul>
		<li>아이디 : <jsp:getProperty property="id" name="member"/></li>
		<li>비밀번호 : <jsp:getProperty property="pw" name="member"/></li>
		<li>이름 : <jsp:getProperty property="name" name="member"/></li>
		<li>이메일 : <jsp:getProperty property="email" name="member"/></li>
		<li>전화번호 : <%=member.getPhone() %></li>
	</ul>
	<hr>
	<button onclick="location.href='member_list.jsp';">회원 리스트 페이지로 이동하기</button>
</body>
</html>
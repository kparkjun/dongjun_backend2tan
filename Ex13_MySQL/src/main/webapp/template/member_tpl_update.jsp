<%@page import="member.site.com.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<%
	String id=request.getParameter("id");
	out.println(id);
%>

<jsp:useBean id="db" class="member.site.com.MemberDAO" />
<%
	
	MemberVO member=db.getMember(id);
	out.println(member);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
<style>
	ul>li{line-height:3rem;list-style:none;}
	.input1{
		width:300px;
		height:30px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
</style>
</head>
<body>

	<h2>Member Update</h2>
	<form action="./action/member_update_ok.jsp" method="post" autocapitalize="off">
		<hr>
			<ul>
				<li><input class="input1" type="text" name="id" value="<%=member.getId() %>" readonly> readonly</li>
				<li><input class="input1" type="password"  name="pw"  value="<%=member.getPw()%>" readonly> readonly</li>
				<li><input class="input1" type="text" name="name"  value="<%= member.getName()%>" ></li>
				<li><input class="input1" type="text" name="email"  value="<%=member.getEmail() %>" ></li>
				<li><input class="input1" type="text" name="phone"  value="<%=member.getPhone() %>" ></li>
			</ul>
		<hr>
		<input type="submit" value="수정">
		<button onclick="location.href='member_control.jsp?action=list';return false">회원 리스트</button>
	</form>
</body>
</html>
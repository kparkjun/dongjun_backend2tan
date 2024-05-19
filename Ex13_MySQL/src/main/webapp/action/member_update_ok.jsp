<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="member.site.com.MemberVO" />
<jsp:setProperty name="member" property="*" />
<%
	// 테스트 출력
	out.println(member.getId()+"<br>");
	out.println(member.getPw()+"<br>");
	out.println(member.getName()+"<br>");
	out.println(member.getEmail()+"<br>");
	out.println(member.getPhone()+"<br>");
	out.println(member);
%>

<jsp:useBean id="db" class="member.site.com.MemberDAO" />
<%
	// db,updateDB() 메서드 호출
	boolean res=db.updateDB(member);
	out.println(res);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 완료</title>
</head>
<body>

	<%
		if(!res){
			out.println("<h2>업데이트 실패~!!</h2>");
		}
		else{
			%>
			<h2>입력하신  정보로 DB Update 되었습니다.</h2>
			<hr>
				<ul>
					<li>아이디 : <jsp:getProperty property="id" name="member"/></li>
					<li>비밀번호 : <jsp:getProperty property="pw" name="member"/></li>
					<li>이름 :<%=member.getName() %></li>
					<li>이메일 : <%=member.getEmail() %></li>
					<li>전화번호 : <%=member.getPhone() %></li>
				</ul>
			<hr>
			<button onclick="location.href='../member_control.jsp?action=list';">회원 리스트 페이지로 이동하기</button>
			<%
		}
	%>

</body>
</html>
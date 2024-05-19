<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="member.site.com.MemberVO" />
<jsp:setProperty name="member" property="*"  />
<%
	// 테스트 출력
	out.println(member.getId()+"<br>");
	out.println(member.getPw()+"<br>");
	out.println(member.getName()+"<br>");
	out.println(member.getEmail()+"<br>");
	out.println(member.getPhone()+"<br>");
	
	// toString() 메서드 만들어놓고 출력
	out.println(member+"<hr>");
%>    

<jsp:useBean id="db" class="member.site.com.MemberDAO" scope="application" />
 <%
 // 수정
// 	out.println("수정한 회원의 인덱스는? => "+db.update(member));
 int res=db.update(member);
 out.println("수정한 회원의 인덱스는? => "+res);
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
<script>
	window.onload=function(){
		setTimeout(function(){
			location.href="/Ex12_CRUD2/member_control.jsp?action=list";
		},3000);
		};
	
</script>
</head>
<body>

</body>
</html>
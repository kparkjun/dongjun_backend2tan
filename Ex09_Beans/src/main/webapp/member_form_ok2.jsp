<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <jsp:useBean id="member" class="member.project.com.MemberBean" />
 <jsp:setProperty name="member"  property="*" />
 
 <%
 	out.println(member.getMemberID());
 	out.println(member.getMemberPW());
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		if(!member.checkMember()){
			out.println("관리자 아이디가 아닙니다. X");
		}
		else{
			out.println("관리자 아이디가 맞습니다. O");
		}
	%>

</body>
</html>
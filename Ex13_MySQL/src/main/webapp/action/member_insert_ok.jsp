<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

 <jsp:useBean id="member"  class="member.site.com.MemberVO" />   
 <jsp:setProperty name="member" property="*" />
 
 <%
 	// 테스트 출력
 	out.println(member.getId()+"<br>");
 	out.println(member.getPw()+"<br>");
 	out.println(member.getName()+"<br>");
 	out.println(member.getEmail()+"<br>");
 	out.println(member.getPhone()+"<br>");
 	
 	// 테스트 출력이 잘 성공되었다면 아래에서 전달된 값들을 DB에 입력 -> 이때, MemberDAO를 유즈빈으로 불러와서 사용
 %>
 
 <jsp:useBean id="db" class="member.site.com.MemberDAO" scope="application" />
 <%
 
 	// 중복 ID 체크 -< 동일한 아이디 회원이 있는지 체크
 	boolean isID=db.checkID(member.getId());
	//	out.println("중복 ID 체크 결과는? => "+isID);
	
	// 중복된 아이디가 있다면..
	if(isID){
		out.println(
				"<script>"+
				"alert('입력하신 ID는 중복된 아이디입니다.');"+
				"histroy.back();"+
				"</script>"
		);
	}
	else{
		int res=	db.insertDB(member); // 전달된 한 명의 회원 정보를 DB에 입력하는 순간
	 	out.println("DB 입력 성공은? => "+res); // true
	}
 
 	
 	
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 처리</title>
</head>
<body>

	<h2>입력하신 정보가 DB에 입력되었습니다.</h2>
	<hr>
		<ul>
			<li>아이디 : <jsp:getProperty name="member" property="id" /></li>
			<li>비밀번호 : <jsp:getProperty name="member" property="pw" /></li>
			<li>이름 : <%=member.getName()%></li>
			<li>이메일 : <%=member.getEmail()%></li>
			<li>전화번호 : <%=member.getPhone()%></li>
		</ul>
	<hr>
	<button onclick="location.href='../member_control.jsp?action=list';">회원 리스트 페이지로 이동하기</button>
</body>
</html>
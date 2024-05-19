<%@ page import="member.site.com.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:useBean id="db" class="member.site.com.MemberDAO"   scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
<style>
	ul>li{line-height:2rem;}
</style>
<script>
	function deleteAllonClick(){
		const res=confirm("전체 삭제하시겠습니까?");
		if(res){
		window.location.href="member_deleteAll_ok.jsp";
		}
	}
	
</script>
</head>
<body>

	<h2>Member List</h2>
	<hr>
	<ul>
		<%
		out.println("<p>현재 사이즈 : "+db.getSize()+"</p>");
				for(MemberVO m:db.getList()){
			out.println("<li>"+m.getId()+"("+m.getName()+") : "+m.getEmail()+", "+m.getPhone()+", 비밀번호("+m.getPw()+")");
			//out.println("[ <a href='member_join.jsp?id=batman'>Update</a>]");
			out.println("<button onclick='location.href=\"member_join.jsp?id="+m.getId()+"\";'>Update</button>");
			out.println("<button onclick='location.href=\"member_delete_ok.jsp?id="+m.getId()+"\";'>Del</button>");
			out.println("</li>");
				}
		%>
		<!-- <li>superman(슈퍼맨) : superman@gmail.com, 010-1234-5678, 비밀번호(1234)</li> -->
	</ul>
	<hr>
	<button onclick="location.href='member_join.jsp';">회원 입력</button>
	<button onclick="deleteAllonClick();">전체 삭제</button>
</body>
</html>
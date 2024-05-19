<%@page import="member.site.com.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="member.site.com.MemberDAO"  />   
<%
	// 넘어온 페이지 값이 없으면 => 1
	String _page=request.getParameter("page");
	
	// 일단 처음에 접속하면 1페이지로 셋팅
	int cPage=1;
	
	// 페이지 값이 널이 아니면 해당 페이지 값을 셋팅
	if(_page!=null){
		cPage=Integer.parseInt(_page);
	}
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
<style>
	main{
		border:0px solid red;
		width:80%;
		margin: 0 auto;
	}
	table{
		width:100%;
		border:2px solid #444;
		border-collapse:collapse; /* 샐 사이 여백을 없애줌 */
	}
	th,td{
		border:1px solid #444;
		padding:10px;
		text-align:center;
	}
	caption{
		padding:30px;
		font-size:1rem;
		font-weight:bold;
		text-transform:uppercase;
		
	}
	h2{
		/* letter-spacing:-0.04rem; */
	}
</style>
</head>
<body>
	
	<main>
		<h2>Member List with Paging</h2>
		<hr>
		<table border=1>
			<caption>Current Page : <%=cPage %></caption>
			<tr>
				<th>#</th>
				<th>id</th>
				<th>password</th>
				<th>name</th>
				<th>email</th>
				<th>phone</th>
				<th>level</th>
			</tr>
			<!-- 반복문을 사용하여 dataList 출력하기 -->
			<%
				for(MemberVO m:db.listDB()){
			%>
				<tr>
					<td><%=m.getIdx() %></td>
					<td><%=m.getMemberId() %></td>
					<td><%=m.getMemberPw() %></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getMemberEmail() %></td>
					<td><%=m.getMemberPhone() %></td>
					<td><%=m.getMemberLevel() %></td>
				</tr>
			<%		
				}
			%>
		</table>
		<hr>
		<a href="<%=application.getAttribute("ROOTPATH") %>/member_control.jsp?action=list	&page=<%=cPage-1%>">◀ 이전 페이지</a> 
		
		&nbsp;&nbsp;&nbsp; 
		
		<a href="<%=application.getAttribute("ROOTPATH") %>/member_control.jsp?action=list	&page=<%=cPage+1%>">다음 페이지 ▶</a>
		<hr>
	</main>
	
</body>
</html>
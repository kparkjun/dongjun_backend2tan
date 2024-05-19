<%@ page import="java.util.ArrayList" %>
<%@ page import="member.site.com.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:useBean id="db" class="member.site.com.MemberDAO"   scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리스트 페이지</title>
<style>
	ul>li{line-height:2rem;}
</style>

</head>
<body>

	<h2>Member List</h2>
	<hr>
	<ul>
		<%
				//ArrayList<MemberVO> dataList=db.listDB();
		
				/* for(int i=0;i<dataList.size();i++){
					out.println("<li>"+dataList.get(i).getId()+"</li>");
				} */
				/* for(MemberVO m:dataList){
					out.println("<li>"+m+"</li>");
				} */
				
				/* for(MemberVO m:dataList){
					out.println("<li>"+m.getId()+"("+m.getName()+") : "+m.getEmail()+", "+m.getPhone()+", 비밀번호("+m.getPw()+")");
					out.println("<button onclick='location.href=\"member_control.jsp?action=update&id="+m.getId()+"\";'>Update</button>");
					out.println("<button>Del</button>");
					out.println("</li>");
				} */
				
		%>
		<!-- 반복문을 사용하여 dataList 출력하기 -->
		<%
			for(MemberVO m:db.listDB()){
			%>
				<li>
				<%=m.getId() %>(<%=m.getName()%>) : <%=m.getEmail() %>, <%=m.getPhone() %>, 비밀번호(<%=m.getPw() %>)
				&nbsp;
				<button onclick="location.href=' member_control.jsp?action=update&id=<%=m.getId()%>';">Update</button>
				<button onclick="location.href=' member_control.jsp?action=delete&id=<%=m.getId()%>';">Delete</button>
				</li>
			<%
				}			
		%>
	</ul>
	<hr>
	<button onclick="location.href='member_control.jsp?action=insert';">회원 입력</button>
	<button onclick="location.href='member_control.jsp?action=deleteAll';">전체 삭제</button>
</body>
</html>
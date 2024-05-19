<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id=request.getParameter("id");
	out.println(id);
%>

<jsp:useBean id="db" class="member.site.com.MemberDAO" />
<%
	// db.deleteDB() 메서드 호출
	if(db.deleteDB(id)){
		out.println("<script>");
		out.println("alert('전체 삭제가 성공적으로 완료되었습니다.');");
	//	out.println("location.href='../member_control.jsp?action=list';");
		out.println("location.replace('../member_control.jsp?action=list');");
		out.println("</script>");
	}
%>
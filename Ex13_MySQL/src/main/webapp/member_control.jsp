<!-- 수정을 위해서 해줘야 하는 것들!

새롭게 만들어줘야 하는 파일들
template/member_tpl_update.jsp
action/member_update_ok.jsp							MemberDAO.java : updateDB()
																										 public MemberVO getMember(String id)
기존에 있는 파일들 수정
MemberDAO.java
member_control.jsp (update)
member_tpl_list.jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="./common.jsp" %> --%>
<% request.setCharacterEncoding("UTF-8"); %>    

<%
	// 루트 패스 출력
	String ROOTPATH=(String)application.getAttribute("ROOTPATH");
	if(ROOTPATH!=null){
		out.println("ROOTPATH => "+ROOTPATH);
	}
	
	// 넘어오는 액션 값 받기
	String action=request.getParameter("action");
	if(action==null){
		out.println("action 값을 넣어주세요!");
		return;
	}
	
	// 분기 처리
	switch(action){
	
		case "insert":
			%><jsp:include page="./template/member_tpl_insert.jsp" /><%
			break;
		case "list":
			%><jsp:include page="./template/member_tpl_list.jsp" /><%
			break;
		case "update":
			%><jsp:include page="./template/member_tpl_update.jsp"/><%
			break;
		case "delete":
		case "deleteAll":
			%><jsp:include page="./template/member_tpl_delete.jsp"/><%
			break;
		default:
			out.println("요청 파라미터 값을 다시 확인해주세요!");
	}
	%>
    

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "./common.jsp" %>
<% request.setCharacterEncoding( "UTF-8" ); %>

<%
	// 루트 패스 출력
	String ROOTPATH = (String) application.getAttribute( "ROOTPATH" );
	if ( ROOTPATH != null ) {
		// out.println( "ROOTPATH => " + ROOTPATH );
	}
	
	// 넘어오는 액션 값 받기
	String action = request.getParameter( "action" );
	if ( action == null ) {
		out.println(
			"<script>" + 
			"alert('액션 값이 없는 잘못된 경로입니다.');" +
			"history.back();" +
			"</script>"
		);
		return;
	}
	
	// 분기 처리
	switch ( action ) {
	
		case "list":
			%><jsp:include page = "./template/member_tpl_list.jsp" /><%
			break;
		
		default:
			out.println( "요청 파라미터 값을 다시 확인해주세요!" );
	}
%>















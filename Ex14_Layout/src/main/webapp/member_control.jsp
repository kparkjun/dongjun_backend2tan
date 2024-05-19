<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./common.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	// 루트 패스 출력 테스트
	//String ROOTPATH=(String)application.getAttribute("ROOTPATH");

	// 넘어오는 액션 값 받기
	String action=request.getParameter("action");
	if(action==null){
		out.println("action 값을 넣어주세요!");
		return;
	}
	
	// 분기 처리
	switch(action){
	
	case "list":
		%><jsp:include page="./template/member_tpl_list.jsp" /><%
		break;
		
	case "insert":
		%><jsp:include page="./template/member_tpl_insert.jsp" /><%
		break;
		
	default:
		out.println("요청 파라미터 값을 다시 확인해주세요!");
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file="./common.jsp" %> --%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	// 공통 변수 PATH1 출력해보기
	String PATH1=(String) application.getAttribute("PATH1");
	
	// application scope에 "PATH1" 변수가 존재하지 않으면
	if(PATH1!=null){
		out.println("PATH1 value : "+PATH1);
	}
	/* else{
		application.setAttribute("PATH1","Ex12_CRUD2");
		PATH1=(String) application.getAttribute("PATH1");
	} */

%>

<%
	// 넘어온 action(또는 command) 값 받아서 분기 처리
	String action=request.getParameter("action");

	// 액션이 null 이면..
	if(action==null){
		out.println("action 값을 넣어주세요!");
		return;
	}

	
	// 분기 처리 (switch .. case)
	switch(action){
		case "insert":
		case "update":
			%><jsp:include page="./template/member_tpl_insert.jsp"/><%
			break;
		case "list":
			%><jsp:include page="./template/member_tpl_list.jsp"/><%
			break;
		default:
			out.println("요청 파라미터 값을 다시 확인해주세요!");
	}
	
%>

<%
	/*
		● 컨트롤러 만들기
		- 어려운 개념은 아니고 쉬운 개념이나 경험이 없는 초보자 입장에서는 무슨 말인지 전혀 모를 수 있음
		- 요청 파라미터 값을 통해서 페이지를 분기 처리하는 중앙 통제식 컨트롤러 방식
		- 컨트롤러를 통해서 사이트를 만든다 -> 대기업 건물에 Information 센터를 통해서 원하는 사무실로 이동
		- MVC, Framework 등도 결국 컨트롤러 개념을 사용 -> 여기서는 사용자 정의 컨트롤러 정도
		
		● 필요한 작업
		- 첫 번째 : 컨트롤러 페이지를 만든다 -> member_control.jsp 또는 controller.jsp
		- 컨트롤러 페이지로 action 값을 전달하고 이를 통해서 각각의 뷰 페이지로 분기 처리 -> template 폴더 생성
		- 실제 액션에 따른 데이터 처리 역할을 하는 파일들 분리 -> action 폴더 생성
		- MemberVo, MemberDAO 등의 자바 빈즈 파일들은 그대로 유지
		
		● 정해진 룰이 있는 것이 아니다!
		- MVC 패턴이나 Framwork(스프링, 스프링부트) 등을 사용하여 프로젝트를 진행한다면 -> 규칙과 룰에 의거하여 작성
		- 그러나, 개인이 진행하는 프로젝트나 소규모 기업 프로젝트인 경우 -> 내가 규칙을 생성
		- 기존에 컨트롤러 페이지를 만들지 않고 진행한 CRUD 프로젝트를 -> member_control.jsp 만들어서 각자 진행
		- 템플릿과 액션을 어떻게 구성해서 사이트를 만들지는 정말 다양한 방법이 존재!
		
			주소창 : http://localhost/EX12_CRUD2/member_control.jsp?action=insert
			
			템플릿 : member_tpl_insert.jsp
						 member_tpl_list.jsp
						 
			액션 : member_insert_ok.jsp
	*/
%>
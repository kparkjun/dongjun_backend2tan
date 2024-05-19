=======================================================
	MVC 프로젝트
	● 사용기술 => JSP + Servlet + MySQL + JSTL(ViewPage)
=======================================================
	Model (DB 연동)
		com.member
		- MemberControler.java : 컨트롤 타워
		- MemberService.java : 중간에서 다리 역할(CRUD 호출 메서드명 단순하게 작명)
		- MemberDAO.java : 데이터베이스 관련 처리 작업을 할 때 사용
		- MemberVO.java : 값을 객체 단위로 전달할 때 사용
		
	View (JSP 퓨페이지)
		-template/tpl_memberList.jsp
		-template/tpl_memberInsertForm.jsp
	Controller (서블릿 기반)	
		-MemberController.java : 컨트롤 타워
	
	index.jsp
	readme.txt
	
	list()
	insert()
	delete()
	update()
	
	=========================================================
		필요
		● 사용기술 => JSP + Servlet + MySQL + JSTL(ViewPage)
	=========================================================
	
	=========================================================
	필요한 라이브러리 및 체크사항 (WEB-INF)
	=========================================================
	
		jstl-1.2jar
		mysql-connector-j-8.2.0.jar (데이터베이스 시작되었는지 서비스 메뉴에서 확인)
	
=======================================================
	MVC 프로젝트 with DBCP
	● 사용기술 => JSP + Servlet + MySQL + JSTL(ViewPage) + DBCP
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
		mysql-connector-j-8.2.0.jar (데이터베이스 시작되었는지 "서비스" 메뉴에서 확인)
		
	=========================================================
	DBCP 연동을 위한 필요한 것
	=========================================================
	mysql-connector-j-8.2.0.jar
	=========================================================
	DBCP 연동 학습을 위한 필수 사전 지식
	=========================================================
	공부 순서 --> 크게 상관 X
	DBCP 연동을 먼저 공부하고 해도 되고, 나중에 공부해도 되고..
	나중에 공부하면 좋은 점 --> 기존 DB 연동 부분을 dBCP 기반으로 변경하면서 공부할 수 있으니깐 장점이라면 장점
	
	1. 약자가 뭐지..???
		DataBase Connection Pool
	2. Pool..???
		수영장(Swimming Pool)
		공동 자금(물자)
		웅덩이(못)
		
	3. 용도
		웅덩이에 뭔가를 담아놓고 필요할 때 꺼내쓰겠다 --> 이게 핵심 포인트
		뭔가가 무엇? --> DB 연동에 필요한 Connection 객체들을 여러 개 만들어 놓고 쓰자!
		
	4. 사용하는 이유
		기본적으로 데이터베이스에 접속해서 DB 연동을 하는 작업들은 반드시 Connection 객체를 생성 --> 그래야 이후 다른 작업들을 수행
		매번 접속할 때 마다 같은 정보로 DB 연결을 수행하면 --> 성능 저하 발생 --> 이 문제를 해결하기 위해서 --> Connection Pool 사용
	
	5. 장점
		매번 연결을 위한 일련의 반복되는 루틴 작업을 최소화하고 서버의 부하를 줄여 성능을 도모
		DB 연동에 필요한 Connection 객체들을 미리 생성해놓고 필요할 때 해당 문서가(JSP) 불러서 사용하니깐 편리
		즉, 데이터베이스 접속이 필요할 때 마다 Connection 객체를 생성하는게 아니고 커넥션 풀에 미리 생성된 Connection 객체를 사용
		
	6. 커넥션 풀 사용은 어떻게..???
		일단 Server쪽에 있는 --> context.xml 파일에 주요 정보를 등록
		커넥션 풀에 있는 객체를 관리하기 위해서 --> DataSource 객체 사용 --> Connection 객체 반환
		ds 객체는 네이밍(Naming) 기반 서비스로 동작 --> 필요한 자원에 붙여진 이름으로 검색해 자원을 사용하는 방식
		가장 대표적인 네이밍 기반 서비스 방식 --> DNS(Domain Name Service)
		
	7. DataSource 객체 생성은 어떻게..???
		DataSource 객체 생성을 하기 위해서는 --> InitialContext 객체를 생성 --> new IniitalContext();
		ctx 객체가 가지고 있는 --> ctx.lookup("네이밍 작성"); 사용
		
	8. DB 접속이 필요한 경우 Connectio 객체는 어떻게 받나..???
		필요할 때 언제든지 ds 객체를 사용해서 --> ds.getConnection(); 해주면 끝
		conn=ds.getConnection();
		
	9. 기존 프로젝트에서 수정할 부분은 무엇인가..???
		DB 연동 1단계(Connection) 부분을 주석 처리하고 ds 객체를 통해서 conn 객체를 획득
		connect(); --> 이 부분을 변경 --> conn=ds.getConnection();
		
	=========================================================
	DBCP 연동 작업 순서
	=========================================================
	(1) 새 프로젝트 생성
	(2) 필요한 드라이버 2개 복사 --> jstl~~.jar, mysql-connector~~.jar
	(3) server > context.xml 리소스 정보 추가(등록) --> 일단 얘만 해주면 바로 커넥션 풀 사용 가능
		name="jdbc/mysql" --> 이름 지정(Naming Service: 임의 지정 가능)
		type="javax.sql.DataSource" --> DataSource 객체 타입 지정
		driverClassName="com.mysql.cj.jdbc.Driver" --> 사용할 JDBC 드라이버 지정
		url="jdbc:mysql:/localhost:3306/mydb?serverTimezone=UTC" --> 접속할 DB 정보
		username="root"
		password="1234"
		maxActive="50" --> 동시에 최대로 연결할 수 있는 Connection 수
		maxIdle="10" --> 유휴 상태 --> 객체가 커넥션 풀에 반납되면 최대로 유지될 수 있는 Connection 수
		maxWait="5000" --> 새 연결까지 대기하는 최대 시간 (커넥션 풀에 연결 가능한 커넥션이 없을 경우 반납되는 커넥션을 대기하는 시간)
	(4) MemberDAO.java 수정
		DB 접속을 처리하는 부분 --> ds 객체로 처리해주면 끝
		생성자를 이용하여 ds 객체 만들기
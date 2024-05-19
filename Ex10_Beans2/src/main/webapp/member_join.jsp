<%@ page import="member.test.com.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- 
 	* DAO
 	- Data Access Object
 	- 말 그대로 데이터베이스 연동 관련한 객체로써 DB에 접근하여 CRUD 데이터 처리를 담당하는 객체
 	- 보통 CRUD 처리와 연결(Connection) 처리도 여기에서 담당
 	- 예) MemberDB.java -> MemberDAO.java 로 변경하여 사용하면 이름만으로도 어떤 역할이나 기능을 수행하는지 유추 가능
 	
 	* DTO(DO,VO)
 	- Data Transfer Object
 	- 단어의 뜻이 '옮기다', '이동하다', '전송하다' 에서 알 수 있들이 계층간 데이터 전송 시 사용하는 데이터 전송 객체
 	- 줄여서 DO 라고 사용하기도 함
 	- 비즈니스 로직을 가지지 않는 순수 데이터 전송만을 위한 갑만 가지고 있어ㅓ VO(Value Object)로 사용하기도 함
 	-보통 값만 가지고 있는 객체이기에 멤버 변수와 Getter, Setter 정도의 메서드만 작성
 	-예) Member.java -> MemberDTO.java MemberVO.java
 	
 	* DTO vs VO
 	- 이 둘을 엄밀하게 분리해서 사용하는 경우도 있지만 보통은 구분없이 많이 사용
 	- 어차피, 계층간의 데이터 전송을 위해서 값만 담는 객체를 만들어서 주고 받기 위함이기 때문에 개발자에 따라서 선호하는걸로 작명
 	- 엄격히 나눠서 사용하는 경우 VO는 Getter 메서드만 만들어서 사용 -> 철저하게 값만 셋팅해서 사용
  -->   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Exam</title>
<style>
	ul>li{line-height:3rem; list-style:none;}
	.input1 {
		width:300px;
		height:40px;
		background:#f0f0f0;
		border:1px solid #666;
		padding-left:10px;
	}
</style>
</head>
<body>

	<h2>Member Join</h2>

	<form action="./member_join_ok.jsp" method="post" autocomplete="off">
		<hr>
		<ul>
			<li><input class="input1" type="text" name="id" placeholder="아이디 입력"  required></li>
			<li><input class="input1" type="password" name="pw" placeholder="비밀번호 입력"  required></li>
			<li><input class="input1" type="text" name="name" placeholder="이름 입력" required></li>
			<li><input class="input1" type="text" name="email" placeholder="이메일 입력" required></li>
			<li><input class="input1" type="text" name="phone" placeholder="전화번호 입력" required></li>
		</ul>
		<hr>
		
		<!-- Submit -->
		<input type="submit" value="전송">
		<button onclick="location.href='member_list.jsp';">회원 리스트</button>
	</form>

</body>
</html>
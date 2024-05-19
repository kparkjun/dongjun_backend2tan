<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 페이지</title>
</head>
<body>

	<h2>MemberController.doHandle() => /memberList.do 리스트 페이지 호출</h2>
	<hr>
	
	<c:if test="${!dataList.isEmpty() }">
		<c:forEach var="member" items="${dataList}">
			<ul>
				<li>${member}</li>
			</ul>
		</c:forEach>
	</c:if>
	<c:if test="${dataList.isEmpty() }">
		<p>데이터가 없습니다.</p>
	</c:if>
	<hr>
	<button onclick="location.href='memberInsert.do';">입력</button>
	<button onclick="location.href='memberDelete.do';">삭제</button>
</body>
</html>
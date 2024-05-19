<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 페이지</title>
<style>
	a:link {text-decoration:none;}
</style>
</head>
<body>
	
	<h2>Member List</h2>
	<hr>
	
	<c:if test="${!dataList.isEmpty()}">
		
		<c:forEach var="member"  items="${dataList}">
			<ul>
				<li>
				${member}
				&nbsp;
				<button onclick="location.href='/Ex19_MVC/memberUpdateForm.do?id=${member.getId()}';">Update</button>
				<button onclick="location.href='/Ex19_MVC/memberDelete.do?id=${member.getId()}';">Del</button>
				</li>
			</ul>
		</c:forEach>
		
	</c:if>
	<c:if test="${dataList.isEmpty()}">
		<p>데이터가 없습니다.</p>
	</c:if>
	
	<hr>
	<div style="text-align:center;">
		<button onclick="location.href='/Ex19_MVC/memberInsertForm.do';">입력 페이지 이동</button>
	</div>
	
	<hr>
	<!-- Pagination -->
	<!-- ---------------------------------------------------------------------
		● 페이징 구현 순서 ( 사전에 알고 있어야 하는 것들 -  MySQL 기쥰)
		 1. 페이징 관련 기본 변수 설정 => cPage,cPosition,limitValue
		 2. 일단 한 페이지 원하는 개수 만큼 출력 => 이때 사용하는게 뭐? => limit
		 3. DB에서 가져올 때 2가지 옵션을 지정 => (1)어떤 위치에서부터 시작할건지 (2)몇 개를 가져올건지
		 4. list.jsp 뷰페이지가 JSTL 사용 시 => 관련 문법 숙지
		 5. Controller => Service => DAO.listDB()
	---------------------------------------------------------------------- -->
	<!-- Pagination -->
	cPage : ${cPage}<br>
	totalRecord : ${totalRecord}<br>
	totalPage : ${totalPage}<br>
	prev : ${prev}<br>
	next : ${next}<br>
	pageGroup : ${pageGroup}
	<div style="text-align: center;">
		현재 페이지 : ${cPage} / ${totalPage} pages &nbsp;
		<span style="color:deeppink;">Total Records : <b>${totalRecord}</b></span>
		<!-- <br><br> -->
		
		<!-- 이전 페이지 
				기본적으로 이전 페이지 버튼의 노출은 "첫 페이지" 값하고 비교
				버튼 처리 => 이전 페이지(prev) 값이 첫 페이지 값보다 작으면 => 링크 비활성화'
				첫 페이지 왔을 때 -->
		 <%-- <c:choose>
		 	<c:when test="${prev<1}">
				<span style="color:#d0d0d0">◀ 이전 페이지</span>
		 	</c:when>
		 	
		 	<c:otherwise>
		 		<a href="/Ex19_MVC/memberList.do?page=${prev}">◀ 이전 페이지</a>
		 	</c:otherwise>
		 </c:choose> --%>
		
		<!-- &nbsp; / &nbsp; --> 
		<!-- 다음 페이지
		기본적으로 다음 페이지 버튼의 노출은 "총 페이지" 값하고 비교
		총 페이지가 3이라면 그 3페이지가 맨 마지막 페이지라는 뜻이므로 그때 비교하여 => 링크 비활성화 
		버튼 처리 => 총 페이지(totalPage) 값보다 다음 페이지(next) 값이 커지면 => 링크 비활성화
		맨 마지막 페이지에 왔을 때
		-->
		<%-- <c:choose>
	
			<c:when test="${totalPage<next}">
				<span style="color:#d0d0d0">다음 페이지 ▶</span>
			</c:when>
			
			<c:otherwise>
				<a href="/Ex19_MVC/memberList.do?page=${next}">다음 페이지 ▶</a>
			</c:otherwise>
			
		</c:choose> --%>
		
		<!-- ----------------------------------------------------------------------
			● 그룹 넘버 출력
		----------------------------------------------------------------------- -->
		<%-- <fmt:parseNumber var="groupNumber"  integerOnly="true" value="3.14"  /> --%>
		<fmt:parseNumber var="groupNumber"  integerOnly="true" value="${Math.ceil(cPage/pageGroup)}"></fmt:parseNumber>
			
		<%-- <h1>Group Number(cPage/pageGroup) : ${groupNumber}</h1> --%>
		<!-- <br> -->
		<!-- ----------------------------------------------------------------------
			● 스타트페이지 / 엔드페이지 출력
		<!-- ----------------------------------------------------------------------
		<!--
			groupNumber					1			2			3			4			5
			startPage / endPage		1 2 3		4 5 6	7 8 9	10 11 12 13 14 15
		-->
		<c:set var="endPage" value="${groupNumber*pageGroup}" />
		<c:set var="startPage" value="${endPage-(pageGroup-1)}" />
		
		<%-- startPage : ${startPage} ............................................... endPage : ${endPage} --%>
		<br>
		<!-------------------------------------------------------------------------
			● 엔드 페이지 조정
		----------------------------------------------------------------------- -->
		<%-- <c:if test="${totalPage<endPage}">
			<c:set var="endPage" value="${totalPage}"/>
		</c:if> --%>
		<c:set var="endPage" value="${totalPage<endPage? totalPage:endPage}"/>
		<%-- startPage : ${startPage} ............................................... endPage : ${endPage} --%>
		<!-------------------------------------------------------------------------
			● 그룹 페이징 출력
		----------------------------------------------------------------------- -->
		<p style="text-align: center">
		<a href="/Ex19_MVC/memberList.do?page=1">◀◀ First</a>
		&nbsp;&nbsp;&nbsp;
		<c:choose>
			<c:when test="${groupNumber!=1 }">
				<a href="/Ex19_MVC/memberList.do?page=${startPage-pageGroup }">◀ Prev</a>
			</c:when>
			
			<c:otherwise>
				<span style="color:#d0d0d0">◀ Prev</span>
			</c:otherwise>
		</c:choose>
			<c:forEach var="i" begin="${startPage }" end="${endPage}" >
				
				<c:choose>
						<c:when test="${i!=cPage}">
						<a href="/Ex19_MVC/memberList.do?page=${i}">&nbsp; ${i} &nbsp;</a>					
	
					</c:when>
					
					<c:otherwise>
					
						<span style="color: red; font-weight: bold;">&nbsp; ${i} &nbsp;<span>
					
											
					</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;&nbsp;
			</c:forEach>
			&nbsp;&nbsp;&nbsp;
			
			<c:choose>
				<c:when test="${totalPage!=endPage}">
					<a href="/Ex19_MVC/memberList.do?page=${startPage+pageGroup}">Next ▶</a>
				</c:when>
			<c:otherwise>
					<span style="color:#d0d0d0">Next ▶</span>
				</c:otherwise>
			</c:choose>
			&nbsp;&nbsp;&nbsp;
			<a href="/Ex19_MVC/memberList.do?page=${totalPage}">Last ▶▶</a>
			
			
		</p>
			
	</div>
	
</body>
</html>

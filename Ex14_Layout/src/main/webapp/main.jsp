<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="css/layout.css">
</head>
<body>

	<div class="wrap">
		<header>
			<div class="top_logo">Logo</div>
			<div class="top_banner">Banner</div>
		</header>
		
		<nav>
			<ul>
				<li class="menulink"><a href="#">Home</a></li>
				<li class="menulink"><a href="#">게시판</a></li>
				<li class="menulink"><a href="#">회원가입</a></li>
				<li class="menulink"><a href="#">로그인</a></li>
			</ul>
		</nav>
		
		<!-- <aside>
			Banner
		</aside> -->
		
		<section>
			<table border=1 >
				<caption>Member List</caption>
				<colgroup>
					<col width="20%">
					<col width="10%">
					<col width="20%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>ID</th>
						<th>Password</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>superman</td>
						<td>1234</td>
						<td>슈퍼맨</td>
						<td>superman@gmail.com</td>
						<td>010-1111-1111</td>
					</tr>
					<tr>
						<td>batman</td>
						<td>1234</td>
						<td>배트맨</td>
						<td>batman@hotmail.com</td>
						<td>010-2222-2222</td>
					</tr>
				</tbody>
			</table>
			
			<div style="padding-top:26px"></div>
			<button>회원 가입</button>
			<button>전체 삭제</button>
		</section>
		
		<footer>
			Footer
		</footer>
	</div>

</body>
</html>
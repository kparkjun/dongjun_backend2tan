<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<button onclick="location.href='<%=application.getAttribute("ROOTPATH")%>/member_control.jsp?action=insert';">회원 가입</button>
			<button>전체 삭제</button>
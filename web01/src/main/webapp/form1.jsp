<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String address = request.getParameter("address");
	int qty = Integer.parseInt(request.getParameter("qty"));
	String email = request.getParameter("email");
	String url = request.getParameter("url");
	String date = request.getParameter("date");
	String comment = request.getParameter("comment");
	String baseball = request.getParameter("baseball");
	String victory = request.getParameter("victory");
	
	String[] favorite = request.getParameterValues("favorite");
	String[] playoff = request.getParameterValues("playoff");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 데이터 처리 및 결과 반환 실습</title>
<!--  CSS Framework -->
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panal-heading">
	<h2>form.html에 전송된 데이터</h2>
</div>
<div class="panel-body">
	<table class="table">
		<tbody>
			<tr>
				<th>이름 :</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>아이디 :</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>패스워드 :</th>
				<td><%=pw %></td>
			</tr>
			<tr>
				<th>주소 :</th>
				<td><%=address %></td>
			</tr>
			<tr>
				<th>주문수량 :</th>
				<td><%=qty %></td>
			</tr>
			<tr>
				<th>E-Mail :</th>
				<td><%=email %></td>
			</tr>
			<tr>
				<th>URL :</th>
				<td><%=url %></td>
			</tr>
			<tr>
				<th>날짜 :</th>
				<td><%=date %></td>
			</tr>
			<tr>
				<th>Comment :</th>
				<td><%=comment %></td>
			</tr>
			<tr>
				<th>본인은 어떤 팀의 팬인가요? :</th>
				<td><%=baseball %></td>
			</tr>
			<tr>
				<th>우승 예상팀 :</th>
				<td><%=victory %></td>
			</tr>
			<tr>
				<th>4강팀 예상은? :</th>
				<td>
					<ul>
					<%
					for(int i=0;i<favorite.length;i++){
					%>
						<li><%=favorite[i] %></li>
					<%	
					}
					%>
					</ul>
				</td>
			</tr>
			<tr>
				<th>플레이오프 진출 예상팀?</th>
				<td>
					<ul>
					<%
					for(String p : playoff){
					%>
						<li><%=p %></li>
					<%
					}
					%>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>
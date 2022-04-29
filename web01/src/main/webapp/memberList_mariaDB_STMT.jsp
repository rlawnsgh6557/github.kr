<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet href="reset.css">
<!-- 웹 아이콘 연결 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
a { text-decoration: none; color: #333;}
</style>
</head>
<body>
<div class="wrap">
<header id="hd" class="panel-heading">
	<div class="hd_wrap">
		<%@ include file="nav.jsp" %>
	</div>
</header>
<div class="content" class="panel-body">
	<h2>회원목록</h2>
	<table class="table">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>연락처</th>
			<th>주소</th>
		</tr>
<%
	Connection conn = null;	//연결 정보를 저장하고, 연결할 객체
	Statement stmt = null;	//연결 상태를 유지할 객체(ON/OFF)
	ResultSet result = null; 	//불어온 DB결과를 저장할 곳
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		String driver = "jdbc:mariadb://localhost:3308/company";
		String dbId = "root";
		String dpPw = "1234";
		conn = DriverManager.getConnection(driver, dbId, dpPw); //연결
		stmt = conn.createStatement();	//전원 ON
		
		String sql = "select * from member";
		result = stmt.executeQuery(sql);	//String으로 저장한 명령을 실행 - select문

		while(result.next()){
			String id = result.getString("id");
			String pw = result.getString("pw");
			String name = result.getString("name");
			String phone = result.getString("phone");
			String address = result.getString("address");
%>
			<tr>
				<td><%=id %></td>
				<td><%=pw %></td>
				<td><%=name %></td>
				<td><%=phone %></td>
				<td><%=address %></td>
			</tr>
<%
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		try {
			result.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();		
		}
	}
%>
</table>
</div>
<footer id="ft" class="panel-footer">
	<%@ include file="ft.jsp" %>
</footer>
</div>
</body>
</html>
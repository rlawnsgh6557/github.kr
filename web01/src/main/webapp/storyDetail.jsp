<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="datatables.min.css">
<script src="datatables.min.js"></script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable();
});
</script>
</head>
<body>
<div class="container-full">
<header id="hd" class="panel-heading navbar navbar-default">
	<div class="hd_wrap container">
		<%@ include file="nav.jsp" %>
	</div>
</header>
<div class="content" class="panel-body">
	<div class="container-fluid">
		<table class="table" id="myTable">
			<tbody>	
<%@ include file="connectPool.conf" %>
<%
	sql = "select * from board where bno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);
	rs = pstmt.executeQuery();
	if(rs.next()){
%>
	<tr>
		<th>글번호</th><td><%=rs.getInt("bno") %></td>
	</tr>
	<tr>
		<th>글제목</th><td><%=rs.getString("btitle") %></td>
	</tr>
	<tr>
		<th>글내용</th><td><%=rs.getString("bcontent") %></td>
	</tr>
	<tr>
		<th>등록일</th><td><%=rs.getString("regdate") %></td>
	</tr>
	<tr>
		<th>작성자</th><td><%=rs.getString("author") %></td>
	</tr>
	<tr>
		<td colspan="3">
		<%
			if(sid.equals("admin")){
		%>
			<a href="storyUpdate.jsp?bno=<%=bno %>" class="btn btn-primary">수정</a> &nbsp;&nbsp;&nbsp;
			<a href="storyDeletePro.jsp?bno=<%=bno %>" class="btn btn-primary">삭제</a>
		<%
			}
		%>
			<a href="story1.jsp" class="btn btn-primary">목록</a>
		</td>
	</tr>
<%
}
%>
<%@ include file="connectClose.conf" %>
 			</tbody>
		</table>
	</div>
</div>
<footer id="ft" class="panel-footer">
	<%@ include file="ft.jsp" %>
</footer>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>)    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기 및 수정</title>
</head>
<body>
<div class="wrap">
<header id="hd" class="panel-heading">
	<div class="hd_wrap">
		<%@ include file="nav.jsp" %>
	</div>
</header>
<div class="content" class="panel-body">
	<h2>회원 정보 보기</h2>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/company", "root","1234");
		String sql = "select * from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		rs = pstmt.executeQuery();
		if(rs.next()){
%>
		<form action="memEdit.jsp" method="post">
			<table>
				<tbody>
					<tr>
						<td>아이디 : </td>
						<td><input type="test" name="uid" value='<%=rs.getString("id") %>' readonly></td>
					</tr>
					<tr>
						<td>비밀번호 : </td>
						<td><input type="test" name="upw" value='<%=rs.getString("pw") %>'></td>
					</tr>
					<tr>
						<td>이름 : </td>
						<td><input type="test" name="name" value='<%=rs.getString("name") %>' readonly></td>
					</tr>
					<tr>
						<td>연락처 : </td>
						<td><input type="tel" name="phone" value='<%=rs.getString("phone") %>'></td>
					</tr>
					<tr>
						<td>주소 : </td>
						<td><input type="text" name="address" value='<%=rs.getString("address") %>'></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" value="정보변경"/> &nbsp; &nbsp; &nbsp; &nbsp;
							<%
							if(!sid.equals("admin")){
							%>
							<a href="secession.jsp" class="btn btn-primary">탈퇴</a> &nbsp; &nbsp; &nbsp; &nbsp;
							<%
							}
							%>
							<input type="reset" value="취소"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally{
		try{
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</div>
<footer id="ft" class="panel-footer">
	<%@ include file="ft.jsp" %>
</footer>
</div>
</body>
</html>
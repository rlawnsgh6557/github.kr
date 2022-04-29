<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid"); //파라미터명은 요청 페이지의 name과 일치
	String upw = request.getParameter("upw"); //파라미터명은 요청 페이지의 name과 일치

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/company","root","1234");
		String sql = "select * from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		rs = pstmt.executeQuery();
		if(rs.next()) {  //회원아이디가 있는 경우
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			if(upw.equals(pw) || upw==pw){ //로그인 성공
				session.setAttribute("uid", id);
				session.setAttribute("name", name);
				response.sendRedirect("index.jsp");
			} else {
				//비밀번호가 틀렸을 경우
				response.sendRedirect("login.jsp");
			}
		} else {
			//입력한 아이디가 회원가입이 되어 있지 않은 경우(member 테이블에 해당 id가 존재하지 않음)
			response.sendRedirect("login.jsp");
		}
	} catch(Exception e){
		response.sendRedirect("login.jsp");
		e.printStackTrace();	
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>	
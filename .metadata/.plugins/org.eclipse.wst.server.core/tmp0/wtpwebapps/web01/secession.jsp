<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@include file="environment.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String sid = (String) session.getAttribute("uid");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int cnt = 0;
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/company","root","1234");
		String sql = "delete from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		cnt = pstmt.executeUpdate();
		
		if(cnt>0){
			session.invalidate(); //invalidate 날려주는것
			response.sendRedirect(home);
		} else {
			out.println("<p>회원탈퇴가 정상적으로 이루어지지 못했습니다.</p>");
			response.sendRedirect(mypage);
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		try{
			pstmt.close();
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		} 
	}
%>
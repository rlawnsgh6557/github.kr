<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connectPool.conf" %>
<%
	request.setCharacterEncoding("UTF-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	sql = "delete from board where bno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);
	cnt = pstmt.executeUpdate();
	if(cnt>0){
		response.sendRedirect("story1.jsp");
	} else {
		response.sendRedirect("storyDetail.jsp?bno="+bno);
	}
%>
<%@ include file="connectClose.conf" %>
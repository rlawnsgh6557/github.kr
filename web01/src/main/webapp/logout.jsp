<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("index.jsp");
%>
<!-- 세션 저장 : session.setAttribute("세션명", 변수명);
세션 불러오기 : session.getAttribute("세션명");
세션 특정 속성을 값 제거 : session.removeAttribute("세션명");
세션 모두 제거 : session.invalidate() -->
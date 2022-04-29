<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //select문은 받아야함
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/company","root","1234");
		String sql = "select * from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			out.println("<p>해당 아이디는 사용하실 수 없는 아이디입니다.</p>");
		} else {
			out.println("<p>사용 가능한 아이디입니다.</p>");
			out.println("<a href='javascript:apply(\""+id+"\")'>"+id+"[적용]</a>");
			out.println("<p>적용을 눌러야만 입력하신 아이디를 사용할 수 있습니다.</p>");
%>
	<script>
	function apply(fid){
		//join.jsp의 joinform폼의 uid에 값을 전송
		opener.document.joinform.uid.value = fid;
		opener.document.joinform.idck.value = "yes";
		window.close();
	}
	</script>
	<!-- pop.jsp에서 입력한 아이디가 현재 사용 중인지 파악하여 사용 중이 아니면, 사용가능한 아이디 이므로
	출력된 아이디를 클릭했을 때 join.jsp로 해당 아이디를 넘기고, 중복체크여부를 yse로 변경함 -->
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try{
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%> 
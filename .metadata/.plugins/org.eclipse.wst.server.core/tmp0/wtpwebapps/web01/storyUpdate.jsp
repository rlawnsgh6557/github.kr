<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
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
			<h2>글수정</h2>
<%@ include file="connectPool.conf" %>
<%
	sql = "select * from board where bno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);
	rs = pstmt.executeQuery();
	if(rs.next()){
%>
			<form action="storyUpdatePro.jsp" name="storyform" method="post" onsubmit="return writeCheck(this)">
				<table class="table">
					<tbody>
						<tr>
							<td class="necessaty">글번호</td>
							<td>
								<%=bno %><input type="hidden" id="bno" name="bno" value='<%=bno %>'>
							</td>
						</tr>
						<tr>
							<td class="necessaty">제목</td>
							<td>
								<input type="text" id="btitle" name="btitle" maxlength="80" size="70" value='<%=rs.getString("btitle") %>' required>
							</td>
						</tr>
						<tr>
							<td class="necessaty">글내용</td>
							<td>
								<textarea rows="6" cols="80" id="bcontent" name="bcontent" required "><%=rs.getString("bcontent") %></textarea>
							</td>
						</tr>
						<tr>
							<td class="necessaty">등록일</td>
							<td>
								<%=rs.getDate("regdate") %>
							</td>
						<tr>
						<tr>
							<td class="necessaty">작성자</td>
							<td>
								<input type="text" id="author" name="author" value='<%=rs.getString("author") %>'>
							</td>
						<tr>
							<th colspan="3">
								<input type="submit" value="수정" id="submit" class="btn btn-primary"> &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="취소" id="reset" class="btn btn-primary"> &nbsp; &nbsp; &nbsp; &nbsp;
								<a href="story1.jsp" class="btn btn-primary">목록</a>
							</th>
						</tr>
					</tbody>
				</table>
				<script>
				function writeCheck(f) {
					var memo = f.bcontent.value;
					if(memo.length>=480){
						alert("글 내용은 480글자 이내 이어야 합니다.")
						return false;
					}
				}
				</script>
			</form>
<%
	}
%>
<%@ include file="connectClose.conf" %>
			</div>
		</div>
	<footer id="ft" class="panel-footer">
		<%@ include file="ft.jsp" %>
	</footer>
</div>
</body>
</html>
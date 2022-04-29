<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ 디렉티브 %> --%>
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
			<h2>로그인</h2>
			<form id="frm1" name="login" action="loginPro.jsp" method="post">
				<ul>
					<li><input type="text" class="indata" id="uid" name="uid" placeholder="아이디입력" required autofocus></li>
					<li><input type="password" class="indata" id="upw" name="upw" placeholder="비밀번호입력" required></li>
					<li class="btn_frame">
						<input type="submit" value="로그인" id="submit" class="btn"> &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="reset" value="취소" id="reset" class="btn">
					</li>
				</ul>
			</form>
		</div>
			<footer id="ft" class="panel-footer">
				<%@ include file="ft.jsp" %>
			</footer>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#hd { width:100%; }
#hd .hd_wrap { }
.content { min-height:90vh; }
.logo { display:block; width:180px; padding-top:8px; }
.logo img { display:block; width:100%; }
#tnb a { padding-left:20px;	 }
</style>
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
				<h2>여기는 콘텐츠 영역</h2>
			</div>
		</div>
		<footer id="ft" class="panel-footer">
			<%@ include file="ft.jsp" %>
		</footer>
	</div>
</body>
</html>
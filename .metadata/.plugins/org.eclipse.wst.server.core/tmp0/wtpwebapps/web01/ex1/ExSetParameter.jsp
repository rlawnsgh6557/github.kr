<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 전송 페이지</title>
</head>
<body>
	<form action="ExGetParameter.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		전화번호 : <input type="tel" name="tel"><br>
	</form>
	<br><a href="ExGetParameter.jsp?email=kkt09072@naver.com&nickname=1004">천사</a>
</body>
</html>
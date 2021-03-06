<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
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
		<div class="container-fluid">
			<h2>회원가입</h2>
			<form action="joinPro.jsp" name="joinform" method="post" onsubmit="return joinCheck(this)">
				<table class="table">
					<tbody>
						<tr>
							<td class="necessaty">아이디</td>
							<td>
								<input type="text" id="uid" name="uid" placeholder="아이디입력" required>
								<input type="button" id="popopen" value="중복확인" class="btn btn-primary" onclick="idCheck()">
								<input type="hidden" id="idck" name="idck" value="">
							</td>
						</tr>
						<tr>
							<td class="necessaty">비밀번호</td>
							<td>
								<input type="password" id="upw" name="upw" placeholder="비밀번호입력" required>
							</td>
						</tr>
						<tr>
							<td class="necessaty">비밀번호중복확인</td>
							<td>
								<input type="password" id="upw2" name="upw2" placeholder="비밀번호중복확인" required>
							</td>
						</tr>
						<tr>
							<td class="necessaty">이름</td>
							<td>
								<input type="text" id="name" name="name" placeholder="이름입력" required>
							</td>
						</tr>
						<tr>
							<td class="otp">전화번호</td>
							<td>
								<input type="tel" id="phone" name="phone" placeholder="전화번호입력">
							</td>
						</tr>
						<tr>
							<td class="otp">주소</td>
							<td>
								<input type="text" id="address" name="address" placeholder="주소입력">
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" value="회원가입" id="submit" class="btn"> &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="취소" id="reset" class="btn">
							</th>
						</tr>
					</tbody>
				</table>
				<script>
				function idCheck() {
					window.open("pop.jsp", "idwin", "width=400, height=300");
				}
				function joinCheck(f) {
					if(f.idck.value!="yes"){
						alert("아이디 중복 검사를 진행하지 않았습니다.");
						return false;
					}
					if(f.upw.value!=f.upw2.value){
						alert("비밀번호와 비밀번호확인이 서로 입력값이 다릅니다.");
						return false;
					}
				}
				</script>
			</form>
			</div>
		</div>
			<footer id="ft" class="panel-footer">
				<%@ include file="ft.jsp" %>
			</footer>
		</div>
	</body>
</html>
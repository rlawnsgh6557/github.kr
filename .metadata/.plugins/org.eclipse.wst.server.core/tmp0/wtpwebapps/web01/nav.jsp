<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% /*
	스크립트릿(scriptlet) */
	String[] dp1 = {"제품/소모품","고객지원","렌탈/케어","이벤트/멤버십","스토리"};
	String[][] dp2 ={
			{"TV/AV","IT","주방가전","생활가전","에어컨/에어케어"},
			{"제품 사용 지원","서비스 상담","서비스 예약","센터/매장 찾기","고객의 소리"},
			{"제품","서비스 소개","계정관리","고객혜택","고객지원"},
			{"멤버십","이벤트","기획전","엘라쇼","카드혜택"},
			{"게시판","인사이드","가이드&팁","리뷰","아카이브"}};
	String[][] lnk = {
			{"product1.jsp","product2.jsp","product3.jsp","product4.jsp","product5.jsp"},
			{"customer1.jsp","customer2.jsp","customer3.jsp","customer4.jsp","customer5.jsp"},
			{"lental1.jsp","lental2.jsp","lental3.jsp","lental4.jsp","lental5.jsp"},
			{"event1.jsp","event2.jsp","event3.jsp","event4.jsp","event5.jsp"},
			{"story1.jsp","story2.jsp","story3.jsp","story4.jsp","story5.jsp"}};
%>
<%-- <%=표현식(expression) %> --%>
<a class="Logo" href="index.jsp"><img src="./img/lg_logo.svg" alt="로고">
<i class="xi-star-o xi-spin"></i></a>
<nav id="gnb">
	<ul>
<%
	for(int i=0;i<dp1.length;i++){
%>
	<li>
		<span class="dp1"><%=dp1[i] %></span>
		<ul class="sub">
<%
		for(int j=0;j<dp2[i].length;j++){
%>
<li><a class="dp2" href="<%=lnk[i][j] %>"><%=dp2[i][j] %></a></li>
<%
		}
%>
		</ul>
	</li>
<%
	}
%>
</ul>	
</nav>
<p id="tnd">
<%
	String sid = (String) session.getAttribute("uid");
	String sname = (String) session.getAttribute("name");
	if(sid == null){
%>
	<a href="login.jsp">로그인</a>
	<a href="">손님</a>
	<a href="agree.jsp">회원가입</a>
<%
	} else if(!sid.equals("admin")){
%>
	<a href="logout.jsp">로그아웃</a>
	<a href="mypage.jsp"><%=sname %></a>
	<a href="story1.jsp">게시판</a>
<%
	} else {
%>
	<a href="logout.jsp">로그아웃</a>
	<a href="mypage.jsp"><%=sname %></a>
	<a href="story1.jsp">게시판관리</a>
	<a href="memberList.jsp">회원관리</a>
	<a href="">상품관리</a>
   <%
	}
   %>
</p>
<script>
	//주소 입력줄로 받은 msg를 받아 출력하는 부분임
	var url = location.href; //url입력줄의 메시지를 포함한 주소를 저장
	var pos = url.indexOf("?msg=");
	var msg = url.substr(pos+5); //메시지만 추출
	var msg_a = document.getElementById("msg_a"); //해당 msg_a 아이디 요소 선택
	msg_a.innerHTML = msg;
	//msg_a.innerHTML = decodeURI(msg);
	if(pos>0){
		if(msg!=""){
			alert(msg);
		}
	}
</script>
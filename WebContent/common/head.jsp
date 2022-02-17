<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
#center {
	text-align: center;
}
ul {
width : 100%;

}
.nav-item {
font-weight: 900;
font-size: 1.3em;
padding : 3px;
color: aqua;
}

#half {
	width: 45%;
}

</style>
<body>
	<nav class="navbar navbar-expand-lg bg-light navbar-light">
		<!-- Brand -->
		<a class="navbar-brand" href="#"><img src="<%=request.getContextPath() %>/image/logo.png"
			  style="margin-right: 20%;"></a>

		<!-- Links -->
		<ul class="navbar-nav  justify-content-end" >
		<%
		String memid = (String) session.getAttribute("memberId");
		if(memid==null) { //login 안됐음
		%>	
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath() %>/view/member/memberInput.jsp">회원가입</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath() %>/view/member/loginForm.jsp">로그인</a></li>
			
			<% } else { //login OK
				%>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath() %>/view/member/memberUpdate.jsp"><%=memid  %>: 회원정보수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath() %>/view/member/logout.jsp">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath() %>/view/member/deleteForm.jsp">회원탈퇴</a></li>	
			
			<% } %>
			<li class="nav-item"><a
				href="<%=request.getContextPath() %>/board/list?boardid=1"
				class="nav-link">공지사항</a></li>
			<li class="nav-item"><a
				href="<%=request.getContextPath() %>/board/list?boardid=2"
				class="nav-link">자유게시판</a></li>
			<li class="nav-item"><a
				href="<%=request.getContextPath() %>/board/list?boardid=3"
				class="nav-link">QnA</a></li>


		</ul>

		<div class="container  justify-content-end">
			<form class="form-inline" action="#">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success" type="submit">Search</button>
			</form>
		</div>

	</nav>
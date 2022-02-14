<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
String login = (String) session.getAttribute("memberId");
//login 불가 이면
if (login == null || login.trim().equals("")) 
{
%>
<script>
alert("로그인이 필요 합니다 ")
location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<%} else { %>
<hr>
	<!-- login start -->
	<div class="container">
		<h2   id="center">회원탈퇴</h2>
		<form action="<%=request.getContextPath() %>/view/member/deletePro.jsp" 
		method="post">
		<div class="form-group">
			<label >Name:</label> <input type="text"
				class="form-control" name="id" readonly="readonly" value="<%=login %>"> 
				<label >Password:</label>
			<input type="password" class="form-control" name="pass">
		</div>
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">로그인</button>
		</div>
		</form>
	</div>
</div>

<% } %>
</body>
</html>
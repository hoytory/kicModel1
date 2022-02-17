<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function win_upload() {
	const op = "width=500, height=150, left=150, top=150";
	open ('<%=request.getContextPath()%>/single/pictureForm.jsp', "", op);
	
	
}
</script>
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
<% 
MemberDao md = new MemberDao();
//id가 없으면 null , 있으면 mem return
Member mem  = md.selectOne(login); 
%>
<hr>
	<div class="container"  style="width:80%;  "  >
		<h2   id="center">회원정보수정</h2>
		<form action="<%=request.getContextPath() %>/view/member/memberUpdatePro.jsp" 
		method="post"  name="f">
		 
		 <input type="hidden"   name="picture" value="<%=mem.getPicture()%>">
		
		<div class="row">
			<div class="col-3   bg-light">
				<img src="<%=request.getContextPath()%>/upload/<%=mem.getPicture()%>" 
				width="100" height="120" id="pic">
			
				<br>
				<button type="button" class="btn btn-dark" onclick="win_upload()">사진등록</button>
		
			</div>
			<div class="col-9">
				<div class="form-group">
					<label for="id">아이디:</label> 
					<input type="text" 	class="form-control" name="id"  readonly="readonly"   value="<%=mem.getId() %>"> 
					<label for="pwd">비밀번호:</label>
					<input type="password" class="form-control"   name="pass">
					 <label for="name"  >이름:</label> 
						<input type="text" class="form-control"  name="name"   readonly="readonly"   value="<%=mem.getName() %>"> 
						<label for="gender">성별:</label> <label
						class="radio-inline"> </label>
						<input type="radio" name="gender" <%=mem.getGender() == 1 ? "checked" : ""%>
						 value="1" disabled="disabled" >남 
						<label class="radio-inline"> </label>
						<input 	type="radio" name="gender" <%=mem.getGender() == 2 ? "checked" : ""%>   
						value="2" disabled="disabled">여
				</div>		</div>		</div>
		<div class="form-group">
			<label for="tel">전화번호:</label> <input type="text"
				class="form-control" name="tel"   value="<%=mem.getTel()%>">
		</div>
		<div class="form-group">
			<label for="tel">이메일:</label> <input type="text" class="form-control"
				name="email"   value="<%=mem.getEmail()%>">		</div>
	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-dark">정보수정</button>
		<button type="button" class="btn btn-dark" 
		onclick="location.href='<%=request.getContextPath()%>/view/member/passwordForm.jsp'">비밀번호변경</button>
	</div>	</form>
</div>
<% } %>



</body>
</html>
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
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
MemberDao md = new MemberDao();
// id가 없으면 null , 있으면 mem return
Member mem  = md.selectOne(id);
String msg = "아이디를 확인 하세요";
String url = request.getContextPath()+"/view/member/loginForm.jsp";
if (mem !=null) // id 있음
{
	if (pass.equals(mem.getPass())) {
		//login 조건 확인
		session.setAttribute("memberId", id);
		msg=mem.getName() + "님이 로그인 하셨습니다";
		url = request.getContextPath()+"/view/main.jsp";
	} 
	else {
		msg = "비밀번호를 확인 하세요";
	}}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
</body>
</html>
                 
                 
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
int num=0;
String msg = "비밀번호가 틀립니다. 확인 후 다시 입력하세요";
String url = request.getContextPath()+"/view/member/memberUpdate.jsp"; 
String login = (String) session.getAttribute("memberId");
//login 불가 이면
if (login == null || login.trim().equals("")) 
{
%>
<script>
alert("로그인이 필요 합니다 ")
location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<% } else  { %>
<%
MemberDao md = new MemberDao();
//id가 없으면 null, 있으면 mem return
Member mem  = md.selectOne(login); 
%>

<hr>
	<div class="container" style="width:80%; ">
		<h2   id="center">회원정보수정</h2>
		<form action="<%= request.getContextPath() %>/view/member/memberPro.jsp" 
		method="post" name="f">
		
// member에 email, tel을 저장 
mem.setEmail(email);
mem.setTel(tel);


if (mem.getPass().equals(pass) ) {
	
	num = md.memberUpdate(mem);
	msg = "회원 정보가 수정 되었습니다";
	url = request.getContextPath()+"/view/main.jsp";
}
                

}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>"; 
</script>  
  
</body>
</html>
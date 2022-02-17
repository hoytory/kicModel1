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
<% } else  {  
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String pass = request.getParameter("pass");

String picture = request.getParameter("picture");  //1

MemberDao md = new MemberDao();
Member mem  = md.selectOne(login); 

// member에 email, tel을 저장 
mem.setEmail(email);
mem.setTel(tel);
mem.setPicture(picture);  //2

//System.out.println(mem); //3 수정된 이미지 이름 저장

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
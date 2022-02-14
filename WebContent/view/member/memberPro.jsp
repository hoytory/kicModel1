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
MemberDao md = new MemberDao();
String name = request.getParameter("name");
int num = md.insertMember(request);
String msg = "";
String url = "";
if(num > 0) {
	msg = name + "님의 가입이 완료 되었습니다.";
	url = request.getContextPath() + "/view/main.jsp";
}
else {
	msg = "회원가입에 실패 하였습니다.";
	url = request.getContextPath() + "/view/main.jsp";
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";

</script>
</body>
</html>
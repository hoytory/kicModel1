<%@page import="model.Board"%>
<%@page import="service.BoardDao"%>
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
int num = Integer.parseInt(request.getParameter("num"));
BoardDao bd = new BoardDao();
Board b = bd.boardOne(num);  
%>
<hr>
	<div class="container">
	<form name="f" action="boardUpdatePro.jsp" enctype="multipart/form-data"  method="post">
	<input type="hidden" name="file2" value="<%=b.getFile1() %>">
	<input type="hidden" name="num" value="<%=b.getNum() %>">
		<h2 id="center">게시판 입력</h2>
		<div class="form-group">
			<label >작성자:</label> 
			<input type="text" class="form-control" name="writer" readonly="readonly" value="<%=b.getWriter() %>"> 
			<label >비밀번호:</label> 
			<input type="password" class="form-control" name="pass"> 
			<label >제목:</label> 
			<input type="text" class="form-control" name="subject" value="<%=b.getSubject() %>">
		</div>

		<div class="form-group">
		<label >내용</label>
		<textarea class="form-control" rows="10" cols="50" name="content"><%=b.getContent()%> </textarea>
		</div>

		<div class="form-group">
			<label >파일저장:</label> 
			<input type="file" class="form-control" name="file1">
		</div>

		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">수 정</button>
		</div>
		</form>
	</div>

</body>
</html>
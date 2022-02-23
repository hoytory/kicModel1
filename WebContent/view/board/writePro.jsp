<%@page import="service.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String path = application.getRealPath("/") + "/boardupload/";
int size = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");
Board board = new Board(); 
board.setWriter(multi.getParameter("writer"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1"));

board.setIp(request.getLocalAddr());

// boardid setting 
String boardid = (String) session.getAttribute("boardid");
if (boardid==null) boardid = "1";
board.setBoardid(boardid);


BoardDao bd = new BoardDao();

//새글인 경우
board.setNum(bd.nextNum());//db에서 다음 번호 읽음
board.setRef(board.getNum());

int num = bd.insertBoard(board); 

String msg = "게시물 등록 실패";
String url ="writeForm.jsp";

if (num==1) {
	msg = "게시물 등록 성공";
	url = "list.jsp?pageNum=1";
	//게시물 등록후엔 다시 1페이지로 보내기.
}
%>
<script>
alert('<%=msg%>')
location.href='<%=url%>'
</script>
</body>
</html>
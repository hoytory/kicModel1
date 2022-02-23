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
request.setCharacterEncoding("utf-8");//post 방식 인코딩
BoardDao bd = new BoardDao();
Board board = new Board();

board.setWriter(request.getParameter("writer"));
board.setPass(request.getParameter("pass"));
board.setSubject(request.getParameter("subject"));
board.setContent(request.getParameter("content"));
board.setFile1("");

board.setIp(request.getLocalAddr());

// boardid setting 
String boardid = (String) session.getAttribute("boardid");
if (boardid==null) boardid = "1";
board.setBoardid(boardid);


int num = Integer.parseInt(request.getParameter("num"));
int ref = Integer.parseInt(request.getParameter("ref"));
int reflevel = Integer.parseInt(request.getParameter("reflevel"));
int refstep = Integer.parseInt(request.getParameter("refstep"));

String msg = "답변 등록시 오류 발생";
String url = "boardReplyForm.jsp?num=" + num;

bd.refStepAdd(ref, refstep);
board.setNum(bd.nextNum());
board.setRef(ref); //원글에 ref임
board.setReflevel(reflevel + 1); //기준글(꼭 새글이 아닐수도 있음./ 답변이 기준글이 될수도 있음) reflevel + 1
board.setRefstep(refstep + 1); //print 순서
/*
reflevel : 답변이 프린트 될 때 기준글에서 들여쓰기되는 기능이라고 생각하면 됨.  
refstep : 답변이 프린트 될 때 일렬로되는 기능/ 중간에 끼어드는 답변이 있을때 전체적으로 숫자가 답변개수대로 밀려남. 
*/

if (bd.insertBoard(board) > 0) {
	msg = "답변 등록 완료";
	url = "list.jsp";
}
%>
<script>
alert('<%=msg%>')
location.href='<%=url%>'
</script>
</body>
</html>
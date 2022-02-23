<%@page import="model.Board"%>
<%@page import="java.util.List"%>
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
String boardid = "1";
int pageInt = 1;
int limit = 10;
//limit : 한페이지에 나오는 글 갯수


//-------boardid세팅-------------------------------------
/*boardid도 유지가 되어야함.
boardid가 파라메터로 넘어왔을때만 session에 저장한다.
*/
if (request.getParameter("boardid") !=null) {
	session.setAttribute("boardid", request.getParameter("boardid"));
	session.setAttribute("pageNum", "1");
	}
    boardid = (String) session.getAttribute("boardid"); 
if (boardid==null) {
	boardid ="1";
	}


//-------pageNum세팅-------------------------------------
/*페이지 유지를 위해 session활용
예를 들어 3페이지의 게시물을 수정했다가 목록보기를 하면 1페이지로 돌아가는게 아닌 
다시 3페이지가 뜨게 하는 방법

pageNum이 파라메터로 넘어왔을때만 session에 저장한다.
*/
if (request.getParameter("pageNum") !=null) {
	session.setAttribute("pageNum", request.getParameter("pageNum"));
	}

String pageNum = (String) session.getAttribute("pageNum");
if (pageNum==null) {
	pageNum ="1";
	}

pageInt = Integer.parseInt(pageNum);
//---------------------------------------------------------------------


BoardDao bd = new BoardDao();
int boardcount = bd.boardCount(boardid);


/* 
-- 1, 4, 7, 10
-- start : (pageInt-1)*limit + 1;
-- end : start + limit - 1;
-- 1 p --> 1 ~ 3
-- 2 p --> 4
-- 3 p --> 7 
*/
List<Board> list = bd.boardList(pageInt, limit, boardcount, boardid);


/* 
-- 1 p --> count (10) ~
-- 2 p --> count - 1 * limit (7) ~
-- 3 p --> count - 2 * limit (4) ~ 
*/
int boardnum = boardcount -(pageInt -1) * limit;


/* 
-- 1 p --> startpage = 1    (p-1)/3 * 3 + 1
-- 2 p --> startpage = 1    (p-1)/3 * 3 + 1
-- 3 p --> startpage = 1    (p-1)/3 * 3 + 1

-- 4 p --> startpage = 4 
-- 5 p --> startpage = 4 
-- 6 p --> startpage = 4 

-- 7 p --> startpage = 7 
-- 8 p --> startpage = 7 
-- 9 p --> startpage = 7

123, 456, 789
하단에 뜨는 페이지 표시가 3개로 끊어짐. 
그래서 1,2,3 페이지까지는 처음 시작할때 1이 나와야하고 , 
4,5,6 페이지는 처음 시작 숫자가 4,
7,8,9 페이지는 처음 시작 숫자가 7,
10,11,12 페이지는 처음 시작 숫자가 10, 
.
.
.
이런식으로 나와야함.
*/
int bottomLine = 3; //하단에 뜨는 페이지 표시 
int startPage = (pageInt -1 ) / bottomLine * bottomLine + 1;
int endPage = startPage + bottomLine -1;
int maxPage = (boardcount / limit) + (boardcount % limit == 0 ? 0 : 1);
if (endPage > maxPage) endPage = maxPage;



//----각 게시판 이름 변경----------------------------
String boardName="공지사항";
switch (boardid) {
case "3" : boardName="Q&A"; break;
case "2" : boardName="자유게시판"; break;
}

%>
<hr>
	<!-- table list start -->
	<div class="container">
		<h2  id="center">
		<%=boardName %> [<%=pageInt %>]-[<%=boardid %>]
		</h2>
		<p align="right">
		<% if (boardcount > 0) { %> 글개수 <%=boardcount%> <% } else { %>
		등록된 게시물이 없습니다.
		<% } %>
		
		</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>파일</th>
					<th>조회수</th>

				</tr>
			</thead>
			<tbody>
			<%
			
			for(Board b : list) {

			%>			
				<tr>
					<td><%=(boardnum--) %></td>
					<td>
					<% if (b.getReflevel() > 0) {
						//답변관련 이미지
						%>
					   <img src="<%=request.getContextPath()%>/image/level.gif" width = "<%=5*b.getReflevel() %>">
					   <img src="<%=request.getContextPath()%>/image/re.gif" >
						<% }%>
					
					
					
					<a href = "boardInfo.jsp?num=<%=b.getNum()%>"><%=b.getSubject() %></a>
					</td>
					<td><%=b.getWriter() %></td>
					<td><%=b.getRegdate() %></td>
					<td><%=b.getFile1() %></td>
					<td><%=b.getReadcnt() %></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<p align="right"><a href="<%=request.getContextPath() %>/view/board/writeForm.jsp">게시판입력</a></p>
		<div class="container"  >
		<ul class="pagination justify-content-center"  >
		
  <li class="page-item <% if (startPage <= bottomLine) { %> disabled  <% } %>"><a class="page-link" href="list.jsp?pageNum=<%= startPage - bottomLine%>">Previous</a></li>
  
  <% for (int i = startPage ; i <= endPage ; i++) { %>
  <li class="page-item  <% if (i==pageInt) { %>active   <% } %>"><a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a></li>
  <% } %>
  
  
  <li class="page-item <% if (endPage >= maxPage) { %> disabled  <% } %>"><a class="page-link" href="list.jsp?pageNum=<%= startPage + bottomLine%>">Next</a></li>
 
</ul> </div>
	</div>
</body>
</html>
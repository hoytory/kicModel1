<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function win_upload() {
	const op = "width=500, height=150, left=150, top=150";
	open ('<%=request.getContextPath()%>/single/pictureForm.jsp', "", op);
}

</script>
<hr>
	<div class="container" style="width:80%; ">
		<h2   id="center">회원가입</h2>
		<form action="<%= request.getContextPath() %>/view/member/memberPro.jsp" 
		method="post" name="f">
		<input type = "hidden" name="picture">
		
		<div class="row">
			<div class="col-3   bg-light">
				<img src="" width="100" height="120" id="pic"><br>
				<button type="button" class="btn btn-dark" onclick="win_upload()">사진등록</button>
			</div>
			
			<div class="col-9">
				<div class="form-group">

					<label for="id">아이디:</label> 
					<input type="text" class="form-control" name="id"> 
					
					<label for="pwd">비밀번호:</label>
					<input type="password" class="form-control" id="pwd" name="pass"> 
					
					<label for="name">이름:</label> 
					<input type="text" class="form-control" id="name" name ="name"> 
					
					<label for="gender">성별:</label> 
					<label class="radio-inline"> </label>
					<input type="radio" name="gender"checked value="1">남 
					<label class="radio-inline"> </label>
					<input type="radio" name="gender"  value="2" >여
				</div>

			</div>
		</div>
		<div class="form-group">

			<label for="tel">전화번호:</label> 
			<input type="text" class="form-control" name="tel">
		</div>
		<div class="form-group">

			<label for="tel">이메일:</label> 
			<input type="text" class="form-control"	name="email">
		</div>

	




	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-dark">회원가입</button>
	</div>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.a
{
text-decoration: none;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>게시물 수정</h2>
	<form action="updateNotice.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="notice_number" value="${n.notice_number }">
		제목 : <input type="text" name="notice_title" value="${n.notice_title }"><br>
		내용 : 
		<textarea rows="10" cols="60" name="notice_content">${n.notice_content }</textarea><br>
		첨부파일 : <img src="/tourapp/resources/upload/${n.notice_fname }"><br>
		<input type="file" name="uploadFile" id="exampleInputFile"><br>
		
		<button type="submit" class="btn btn-info">수정</button>
		<button type="reset" class="btn btn-info">취소</button>
	</form>
	
	</div>
<!-- /////////////////////////////////////////////////////////// -->
	<br>
</body>
</html>
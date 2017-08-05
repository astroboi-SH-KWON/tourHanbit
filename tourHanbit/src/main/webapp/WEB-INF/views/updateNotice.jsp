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
<h2>게시물 수정</h2>
	<form action="updateNotice.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="notice_number" value="${n.notice_number }">
		제목 : <input type="text" name="notice_title" value="${n.notice_title }"><br>
		내용 : <br>
		<textarea rows="10" cols="60" name="notice_content">${n.notice_content }</textarea><br>
		첨부파일 : ${n.notice_fname }(${n.notice_fsize })<br>
		<input type="file" name="uploadFile"><br>
		
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
	
	
	

</body>
</html>
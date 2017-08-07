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
#updateB
{
text-align: center;
}
#file
{
text-align: center;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="updateB">
<h2>게시물 수정</h2>
	<form action="updateQna.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qna_number" value="${q.qna_number}">
		제목:<input type="text" name="qna_title" value="${q.qna_title}"><br>
		작성자:<input type="text" name="mem_id"  value="${q.mem_id}" readonly="readonly"><br>
		내용 <br>
		<textarea rows="10" cols="60" name="qna_content">${q.qna_content }</textarea><br>
		첨부파일 : ${q.qna_fname }(${q.qna_fsize })<br>
		<input type="file" name="uploadFile" id="file" 
><br>
		
		
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
	
</div>	
	
	

	
	

</body>
</html>
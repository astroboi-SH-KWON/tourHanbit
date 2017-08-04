<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>등록</h2>
<form action="insertQna.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="qna_number" value="${qna_number}">



작성자:<input type="text" name="mem_id"><br>
제목:<input type="text" name="qna_title">
내용:<br>
<textarea rows="10" cols="60" name="qna_content"></textarea><br>
첨부파일:<input type="file" name="uploadFile"><br>
비밀번호:<input type="password" name="qna_pwd"><br>
<input type="submit" value="등록">



</form>

</body>
</html>
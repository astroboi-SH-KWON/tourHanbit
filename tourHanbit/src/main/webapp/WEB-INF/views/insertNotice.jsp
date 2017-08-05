<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>등록</h2>
<form action="insertNotice.do" method="post" enctype="multipart/form-data" >
<input type="hidden" name="notice_number" value="${notice_number}">


<div class="form-group">
 <div class="col-xs-4">
제목:<input type="text" name="notice_title" class="form-control" placeholder="제목을 입력하세요"><br>
</div>
<br><br><br><br><br>
내용:
<textarea class="form-control" rows="5" cols="5" name="notice_content" placeholder="내용을 입력하세요"></textarea><br>


첨부파일:<input class="form-group" type="file" name="uploadFile"><br>
<input type="submit"  class="btn btn-default" value="등록">


</div>
</form>

</body>
</html>
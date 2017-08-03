<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>비밀번호 찾기</h2>

<form action="findpassword.do" method="post">
이름 : <input type="text" name="mem_id" id="mem_id">
이메일 : <input type="text" name="mem_email">
<input type="submit" value="찾기">
<input type="reset" value="다시입력">
</form>

</body>
</html>
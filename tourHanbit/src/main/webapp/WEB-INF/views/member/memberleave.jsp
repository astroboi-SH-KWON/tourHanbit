<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function(){
		$("#btn").click(function(){
			$(location).attr('href',"/tourapp/mainPage.do");
		});
	});
</script>
</head>
<body>
<center><font color="skyblue" size="10">${leavemem_id }</font> 님 정말 탈퇴 하시겠습니까?<br>
탈퇴시 모든 정보는 삭제됩니다.<br>
<form action="memberleave.do" method="post">
비밀번호 :<input type="password" name=mem_pwd><br>
<input type="submit" value="예" class="btn btn-danger">
<button type="button" class="btn btn-info" id="btn">아니오</button>
</form><br>
<!-- <a href="/tourapp/mainPage.do" class="btn btn-info">아니오</a> -->
</center>
</body>
</html>
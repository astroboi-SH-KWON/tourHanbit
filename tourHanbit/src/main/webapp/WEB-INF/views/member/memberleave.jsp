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
<center><font color="skyblue" size="10">${leavemem_id }</font> �� ���� Ż�� �Ͻðڽ��ϱ�?<br>
Ż��� ��� ������ �����˴ϴ�.<br>
<form action="memberleave.do" method="post">
��й�ȣ :<input type="password" name=mem_pwd><br>
<input type="submit" value="��" class="btn btn-danger">
<button type="button" class="btn btn-info" id="btn">�ƴϿ�</button>
</form><br>
<!-- <a href="/tourapp/mainPage.do" class="btn btn-info">�ƴϿ�</a> -->
</center>
</body>
</html>
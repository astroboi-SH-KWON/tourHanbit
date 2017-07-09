<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 관리</h2>
<div class="container">
	<table class="table">
		<tr class="info">
			<td>아이디</td>
			<td>성함</td>
			<td>이메일</td>
			<td>핸드폰번호</td>
		</tr>
		
	<c:forEach var="m" items="${memberList }">
		<tr class="active">
			<td>${m.mem_id }</td>
			<td>${m.mem_name }</td>
			<td>${m.mem_email }</td>
			<td>${m.mem_phone }</td>
			
		</tr>
	</c:forEach>
	
	</table>
</div>
</body>
</html>
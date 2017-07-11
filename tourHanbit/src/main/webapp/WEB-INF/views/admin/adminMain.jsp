<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h2>관리자페이지</h2>

<img src="resources/upload/${fname }">
<h3><font color="blue""><center><매출 현황></center></font></h3>
<div class="container">
<table border="1" class="table">
	<tr class="info">
		<td>상품번호</td>
		<td>상품명</td>
		<td>주문자 수</td>
		<td>매출현황</td>
	</tr>
	<c:forEach var="p" items="${adminMainList }">
	<tr class="success">
		<td>${p.item_key }</td>
		<td>${p.item_name }</td>
		<td>${p.orders_su }</td>
		<td>${p.price }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
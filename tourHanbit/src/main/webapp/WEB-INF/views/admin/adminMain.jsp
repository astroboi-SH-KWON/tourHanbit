<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>관리자페이지</h2>
<table border="1">
	<tr>
		<td>상품번호</td>
		<td>상품명</td>
		<td>출발일</td>
		<td>도착일</td>
		<td>도시</td>
		<td>예약자 수</td>
	</tr>
	<c:forEach var="p" items="${adminList }">
	<tr>
		<td>${p.item_key }</td>
		<td>${p.item_name }</td>
		<td><fmt:formatDate value="${p.d_date }" pattern="yyyy/MM/dd"/></td>
		<td><fmt:formatDate value="${p.a_date }" pattern="yyyy/MM/dd"/></td>
		<td>${p.city }</td>
		<td>${p.reser }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
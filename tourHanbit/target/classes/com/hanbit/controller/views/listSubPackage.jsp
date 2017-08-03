<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="100%" border="1">
		<tr>
			<td>출/도착시간</td>
			<td>항공</td>
			<td>상품명</td>
			<td>여행기간</td>
			<td>상품가격</td>
			<td>예약상태</td>
		</tr>
		<c:forEach var="p" items="${sp }">
			<tr>
				<td>${p.d_date }<br>${p.a_date }</td>
				<td>${p.airplane }</td>
				<td><a href="detail.do?item_key_sub=${p.item_key_sub }">${item_name }</a></td>
				<td>${time}</td>
				<td>${p.price_sub }</td>
				<td>
				<c:if test="${p.reser_sub==20 }">
		   		<font color="red">예약마감</font>
		   		</c:if>
		   		<c:if test="${p.reser_sub!=20 }">
		   		예약대기
			    </c:if>
				
				
				</td>
			</tr>
		</c:forEach>
	</table><div>예약자수 : ${p.reser }</div>
</body>
</html>
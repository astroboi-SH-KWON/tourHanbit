<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
    border-collapse: collapse;
}

th, td {
    text-align: left;
    padding: 5px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    color:#fff;background-color:#337ab7;border-color:#2e6da4;
}
</style>
</head>
<body>

		
	<h3 align="center"><b>[</b>${srch}<b>]</b> 에 대한 검색 결과</h3>
	<c:if test="${not empty list }">
		<table border="1" align="center"     width="65%">
		<tr>
	    <th colspan="2">상품번호</th>
	    <th colspan="6">여행사진</th>
	    <th colspan="10">상품설명</th>
	  	</tr>
  	</c:if>
  	<c:if test="${empty list }">
  	<center><h4><b>검색 결과가 없습니다.</b></h4></center>
		
  	</c:if>
	<c:forEach var="b" items="${list }">
		<tr align="center">
			<td colspan="2">${b.item_key }</td>
			<td colspan="6" >
			<c:if test="${empty b.d_date }">
				<a href="detail.do?item_key=${b.item_key }">
				<img src="resources/img/${b.image01}" align="center" style="height:300px;width:500px;">
			</c:if>
			<c:if test="${not empty b.d_date }">
				<a href="detail.do?item_key=${b.item_key_sub }">
				<c:if test="${b.reser_sub>=20 }">
					<h2><font color="red">마감</font> </h2>
					<img src="resources/img/${b.image01}" align="center" style="height:300px;width:500px;filter:blur(5px);">
				</c:if>
				<c:if test="${b.reser_sub<20 }">
					<img src="resources/img/${b.image01}" align="center" style="height:300px;width:500px;">
				</c:if>
			</c:if>
			</td>
			<td colspan="10"><font color="blue"><b>
			<c:set var = "string1" value = "${b.item_name }"/>
			${fn:substring(string1,fn:indexOf(string1, "]")+1,fn:length(string1)) }

			</b></font><br></font><br>
			<c:if test="${not empty b.d_date }">
				출국일 : <font color='red' size="6"><b><fmt:formatDate value="${b.d_date}" pattern="yyyy년 MM월 dd일"/></b></font><br>
				귀국일 : <font color='red' size="6"><b><fmt:formatDate value="${b.a_date}" pattern="yyyy년 MM월 dd일"/></b></font><br>
			</c:if>
			<c:if test="${empty b.d_date }">
				<c:if test="${not empty b.price }">
					<c:set var = "price1" value = "${b.price}+''"/>
					가격 : <font color='red' size="6"><b>${fn:substring(price1,0,fn:length(price1)-7) }만원 부터</b></font><br>
				</c:if>
			</c:if>
			 	도시 : ${b.city }<br> 여행 일수 : ${fn:substring(string1,1,fn:indexOf(string1, "]")) }</a></td>
			
		</tr>
	</c:forEach>
	</table>
</body>
</html>
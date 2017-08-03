<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 수정</h2>
<hr>
<form action="adminUpdateItem.do" method="post" enctype="multipart/form-data">
상품 번호 : <input type="text" name="item_key" value="${items.item_key }" size="20" readonly="readonly"><br>
상품 이름 : <input type="text" name="item_name" size="40" value="${items.item_name }"><br>
상품 소개글   <br> <textarea  name="intro_text" cols="100" rows="10">${items.intro_text }</textarea><br>
상품 가격 :  <input type="text" name="price"size="20" value="${items.price }">원<br>
방문 도시 :  <input type="text" name="city"size="40" value="${items.city }"><br>
방문 도시 :  <input type="text" name="city_id"size="40" value="${items.city_id }"><br>

이미지1 : <input type="file" name=upload><br>
이미지2 : <input type="file" name="upload"><br>
이미지3 : <input type="file" name="upload"><br>
이미지4 : <input type="file" name="upload"><br>
이미지5 : <input type="file" name="upload"><br>
이미지6 : <input type="file" name="upload"><br>
이미지7 : <input type="file" name="upload"><br>
이미지8 : <input type="file" name="upload"><br>
이미지9 : <input type="file" name="upload"><br>
이미지10 : <input type="file" name="upload"><br>
이미지11 : <input type="file" name="upload"><br>
<h3>스케줄</h3>
<c:forEach var="s" items="${schedules }" varStatus="status">
${status.count }일차  <br> <textarea  name="day" cols="100" rows="10">${s.content }</textarea><br>
</c:forEach>

<input type="submit" value="등록" class="btn btn-primary">
</form>
</body>
</html>
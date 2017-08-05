<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>QnA요</h2>


<form action="listQna.do" method="post">
<select name = "searchField">
	<option value="qna_title">제목</option>
	<option value="qna_content">내용</option>
</select>
<input type="text" name="keyword">
<input type="submit" value="검색">

</form>
<a href="insertQna.do">게시물 등록요</a>






<table border="1">

<tr>
<td>번호</td>
<td>제목</td>
<td>날짜</td>
<td>날짜</td>


</tr>

<c:forEach var="q" items="${list}">
<tr>
<td>${q.qna_number}</td>
<td><a href="detailQna.do?qna_number=${q.qna_number}">${q.qna_title}</a></td>
<td>${q.qna_date}</td>
<td>${q.mem_id}</td>

</tr>





</c:forEach>


</table>

전체페이지:
<center>${pageStr}</center>
<a href="listQna.do?cutSession=0">목록보기</a>
</body>
</html>
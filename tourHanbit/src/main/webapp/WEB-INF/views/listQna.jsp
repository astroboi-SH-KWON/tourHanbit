<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style type="text/css">
#form1
{
text-align: center;
}
#listqna
{
text-align: right;
}
#title
{
text-align: center;
}

</style>
<title>Insert title here</title>
</head>
<body>
<h2 id="title">QnA요</h2>

<form action="listQna.do" method="post" id="form1">
<select name = "searchField">
	<option value="qna_title">제목</option>
	<option value="qna_content">내용</option>
</select>
<input type="text" name="keyword">
<input type="submit" value="검색">

</form>


<table border="1" class="table table-striped" align="center" style="width:80%">
<tr>
<th>번호</th>
<th>제목</th>
<th>날짜</th>
<th>작성자</th>
</tr>

<c:forEach var="q" items="${list}">
<tr>
<td width="10%" >${q.qna_number}</td>
<td width="40%"><a href="detailQna.do?qna_number=${q.qna_number}">${q.qna_title}</a></td>
<td width="30%">${q.qna_date}</td>
<td width="20%">${q.mem_id}</td>
</tr>
</c:forEach>
</table>

<c:if test="${sessionScope.mem_id != null}">
<button onclick="location.href='insertQna.do'">
	글등록 
	</button>
</c:if>
<div id="listqna">
<button onclick="location.href='listQna.do?cutSession=0'">글목록</button>
</div>
<center>${pageStr}</center>
</body>
</html>
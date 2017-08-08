<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
#td-center
{
text-align: center;
}

</style>
</head>
<body>
	<h2 align="center">공지사항</h2>
	<form action="memberListNotice.do" method="post" id="form1"  >
		<select name="searchField" style="color: white;">
			<option value="notice_title">제목</option>
			<option value="notice_content">내용</option>
		</select> <input type="text" name="keyword"> 
		<input type="submit" value="검색" class="btn btn-primary" >
	</form>
	<table  class="table table-striped" align="center" style="width:70%">
	<tr style="text-align: center">
			<td id="td-center">번호</td>
			<td id="td-center">제목</td>
			<td id="td-center">날짜</td>
			<td id="td-center">조회수</td>
	</tr>
	<c:forEach var="n" items="${list}">
			<tr>
				<td width="10%" id="td-center">${n.notice_number }</td>
				<td width="40%" id="td-center"><a href="memberDetailNotice.do?notice_number=${n.notice_number}">${n.notice_title}</a></td>
				<td width="30%" id="td-center">${n.notice_date }</td>
				<td width="20%" id="td-center">${n.notice_hit }</td>
			</tr>
	</c:forEach>
	</table>
	<!-- /////////////////////////////////////////////////////////// -->
	<br>

	<span style="padding-left: 220px">
	<button onclick="location.href='memberListNotice.do?cutSession=0'" class="btn btn-info"
	style="width: 50px">목록</button> 
	</span>
	
	<span style="padding-right: 220px; float: right;">
	<c:if test="${mem_id eq 'admin'}">
	<button onclick="location.href='memberInsertNotice.do'" class="btn btn-info" style="width: 50px">등록</button>
	</c:if>
	</span>
	<center>${pageStr}</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

.a
{
text-decoration: none;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>게시물 상세</h2>
	<hr>

	제목 : ${n.notice_title }<br>
	등록일 : ${n.notice_date }<br>
	내용 : <br>
	<textarea rows="10" cols="60" readonly="readonly">${n.notice_content }</textarea><br>

	첨부파일 : <img src="/tourapp/resources/upload/${n.notice_fname }"><br>
	
	
	
	<a href="updateNotice.do?notice_number=${n.notice_number}">수정</a>
	<a href="deleteNotice.do?notice_number=${n.notice_number}">삭제</a>
	<br>
	<button onclick="location.href='listNotice.do'">돌아가기</button>
	</div>
</body>
</html>
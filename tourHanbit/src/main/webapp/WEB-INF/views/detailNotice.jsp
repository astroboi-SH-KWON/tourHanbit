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
	<table class="table" align="center" style="width:50%">
	<tr>
	<td width="40%">제목</td>
	<td width="60%">${n.notice_title }</td>
	</tr>
	<tr>
	<td width="40%">등록일</td>
	<td width="60%">${n.notice_date }</td>
	</tr>
	<tr>
	<td width="40%">내용</td>
	<td width="60%"><textarea rows="10" cols="60" readonly="readonly">${n.notice_content }</textarea></td>
	</tr>
	<tr>
	<td width="40%">첨부파일</td>
	<td width="60%"><img src="/tourapp/resources/upload/${n.notice_fname }"  width="425px" height="200px"></td>
	</tr>
	</table>
	
	

	<br>

	<!-- /////////////////////////////////////////////////////////// -->
	<br>
	<span style="padding-right: 370px; float: right;">
	<button onclick="location.href='updateNotice.do?notice_number=${n.notice_number}'" class="btn btn-info">수정</button>
	</span>
	<span style="padding-right: 0px; float: right">
	<button onclick="location.href='deleteNotice.do?notice_number=${n.notice_number}'" class="btn btn-info">삭제</button>
	</span>
	<br>
	<div style="padding-top:10px;padding-left: 400px">
	<button onclick="location.href='listNotice.do'" class="btn btn-info">목록</button>
	</div>
	</div>
</body>
</html>
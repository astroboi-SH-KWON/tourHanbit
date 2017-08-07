<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
</head>
<body>
	<fieldset>
	<legend>3번쩨 프로젝트</legend>
	<center>
		<button onclick="location.href='mainPage.do'"><h2>시작</h2></button><br>
		<a href="admin/adminMain.do">관리자 페이지</a>
		<a href="airplanorders.do">비행기</a>
	</center>
	</fieldset>
</body>
</html>

   var tr = $("<tr></tr>");
		               var td1 = $("<td></td>").text(item.review_number);
		               var td2 = $("<td></td>").text(item.review_title);
		               var td3 = $("<td></td>").text(item.review_date);
		               var td4 = $("<td></td>").text(item.mem_id);
		               $(tr).append(td1,td2,td3,td4).appendTo($("#tb"));
		               
		               
		               <table border="1"  id="tb" align="center" style="width:100%">
<tr>
<th>번호</th>
<th>제목</th>
<th>날짜</th>
<th>작성자</th>
</tr>


</table>
<center>${pageStr}</center>
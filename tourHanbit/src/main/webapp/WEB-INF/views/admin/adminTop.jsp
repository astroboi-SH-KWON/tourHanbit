<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="right">
	<input type="button" value="사용자 페이지 이동" onclick="location.href='admin_logout.do'">
	</p>
	<hr>
		<table>
			<tr>
				<td><input type="button" value="메인" onclick="location.href = 'adminMain.do'"></td>
				<td><input type="button" value="상품관리" onclick="location.href = 'adminListItem.do'"></td>
				<td><input type="button" value="회원관리" onclick="location.href = 'adminMember.do'"></td>
				
			</tr>
		</table>

</body>
</html>
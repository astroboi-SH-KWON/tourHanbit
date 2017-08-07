<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="memberReview.do" method="post" enctype="multipart/form-data">

<input type="text" name=item_key value="${reivew_item_key }" readonly="readonly"><br>
작성자 : <input type="text" name="mem_id" value="${mem_id }" readonly="readonly"><br>
제목 : <input type="text" name="review_title"><br>
내용 : <textarea rows="10" cols="10" name="review_content"></textarea><br>
첨부파일 : <input type="file" name=uploadFile><br>

평점 : <table border="1">
<tr>
	<td>가이드</td>
	<td>호텔</td>
	<td>식사</td>
	<td>일정</td>
	<td>전체만족도</td>
</tr>
<tr>
	<td>
		<select name="score" id="g_score">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</td>	

	<td>
		<select name="score" id="h_score">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</td>	

	<td>
		<select name="score" id="f_score">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</td>	

	<td>
		<select name="score" id="s_score">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</td>	

	<td>
		<select name="score" id="sum_score">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</td>	
</tr>

</table>
<input type="submit" value="입력">
</form>
</body>
</html>
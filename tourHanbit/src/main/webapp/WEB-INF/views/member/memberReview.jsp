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

<input type="hidden" name=item_key value="${reivew_item_key }">
<table>
	<tr>
		<td>
			작성자 :<input type="text" name="mem_id" value="${mem_id }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>
			제목 :<input type="text" name="review_title" value="아주 좋은 여행이였습니다.">
		</td>
	</tr>
	<tr>
		<td>
			내용 : <textarea rows="10" cols="100" name="review_content">생가보다 음식이 너무 잘 맞았습니다.</textarea><br>
		</td>
	</tr>
	<tr>
		<td>
			첨부파일 : <input type="file" name=uploadFile><br>
		</td>
	</tr>
<tr>
<td>
평점 : <table>
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
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
	</td>	

	<td>
		<select name="score" id="h_score">
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
	</td>	

	<td>
		<select name="score" id="f_score">
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
	</td>	

	<td>
		<select name="score" id="s_score">
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
	</td>	

	<td>
		<select name="score" id="sum_score">
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
	</td>	
</tr>

</table>
</td>
</tr>
</table>
<input type="submit" value="입력" class="btn btn-info">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/member/memberReview.do" method="post" enctype="multipart/form-data">
<input type="text" name=item_key value="${reivew_item_key }" readonly="readonly"><br>
�ۼ��� : <input type="text" name="mem_id" value="${mem_id }" readonly="readonly"><br>
���� : <input type="text" name="review_title"><br>
���� : <textarea rows="10" cols="10" name="reivew_content"></textarea><br>
÷������ : <input type="file" name=review_fname><br>

���� : <table border="1">
<tr>
	<td>���̵�</td>
	<td>ȣ��</td>
	<td>�Ļ�</td>
	<td>����</td>
	<td>��ü������</td>
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
<input type="submit" value="�Է�">
</form>
</body>
</html>
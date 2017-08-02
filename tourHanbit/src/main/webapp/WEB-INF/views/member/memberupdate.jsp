<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function(){
	var emaildata = $("#mem_emailend").attr("data-type");
	 	 $("#mem_emailend").val(emaildata).text();
	     $("#mem_emailend").find("option:"+emaildata).attr("selected","selected"); 
	
	var phonefdata = $("#mem_phonef").attr("data-type"); 
		$("#mem_phonef").val(phonefdata).text();
 	    $("#mem_phonef").find("option:"+phonefdata).attr("selected","selected"); 
});

</script>
<title>Insert title here</title>
</head>
<body>


<form action="memberupdate.do" method="post">
<table border="1">
<tr><td>아이디</td><td><input type="text" value="${mem_update_ready.mem_id }" name="mem_id" readonly="readonly"></td><td></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="mem_pwd" id="mem_pwd" value="${mem_update_ready.mem_pwd }"></td><td></td></tr>
<tr><td>비밀번호 확인</td><td><input type="password" name="mem_pwdcheck" id="mem_pwdcheck" value="${mem_update_ready.mem_pwd }"></td><td></td></tr>
<tr><td>이름</td><td><input type="text" value="${mem_update_ready.mem_name }" name="mem_name" readonly="readonly"></input></td><td></td></tr>
<tr><td>이메일</td><td><input type="text" value="${emailch }" name="mem_email" id="mem_email">@
											<select name="mem_email" id="mem_emailend" data-type="${endemail }">
											<option>naver.com</option>
											<option>nate.com</option>
											<option>gmail.com</option>
											<option>hanmail.net</option>
											</select></td><td></td></tr>
<tr><td>휴대폰번호 번호 </td><td><select name="mem_phone" id="mem_phonef" data-type="${phonef }"> 
			<option>010</option>
			<option>016</option>
			<option>018</option>
			<option>011</option>
			</select>
			-<input type="text" name="mem_phone" id="mem_phonec" maxlength="4" value="${phonec }">
			-<input type="text" name="mem_phone" id="mem_phonee" maxlength="4" value="${phonee }"><br></td><td></td></tr>
<tr><td></td><td><center><input type="submit" value="정보변경"><input type="reset" value="다시입력"></center></td><td></td></tr>
</table>

</form>

</body>
</html>
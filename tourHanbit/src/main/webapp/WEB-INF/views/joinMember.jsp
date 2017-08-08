<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.form-control{float: left;}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/css/join-style.css">
<script src="resources/js/join-index"></script>
<script type="text/javascript">




var mem_id =""
function pro_id()
{
	mem_id = document.getElementById("mem_id").value;				
	
	 $.ajax({
             type : 'POST',
             url : 'idoverlap.do',
             data:{"mem_id":mem_id},
             success : function(data)
             {
            	if(data==1)
            		{
            			$("#idok").html("중복된 아이디입니다.").css({ 'color': 'red'});
            			return
            		}
            	else if (data==-1)
            		{ 
            			$("#idok").html("사용할수 있는 아이디입니다.").css({ 'color': 'skyblue'});     		
            			return
            		}
                }
            });

}

function pro_pwd()
{
	msg_pwd = document.getElementById("msg_pwd");
	msg_pwd.innerHTML="";
	
	var mem_pwd = document.getElementById("mem_pwd").value;
	if(mem_pwd == "")
	{
		msg_pwd.innerHTML="암호를 입력하세요";
		return;
	}
	if(mem_pwd.length < 7)
	{
		msg_pwd.innerHTML="암호는 7자 이상이어야 합니다.";	
		
		return;
	}
	var special = "!@#$%^&*()-=_+\|[]{},.<>;:'";
	var isOk = -1;
	for(i=0; i<mem_pwd.length; i++)
	{
		var ch = mem_pwd.substr(i,1);
		isOk = special.indexOf(ch);
		if(isOk != -1)
			break;
	}
	if(  isOk == -1 )
	{
		msg_pwd.innerHTML="암호에는 반드시 특수문자를 1개 이상 입력해야 합니다.";
		return;
	}
	
}



</script>

<title>Insert title here</title>

</head>
<body>

<div class="container">
<form class="well form-horizontal" action="joinMember.do" method="post"  id="contact_form">
<fieldset>
<legend>Hanbit Tour Membership</legend>

<!-- 아이디 -->
<div class="form-group">
  <label class="col-md-4 control-label">아이디</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" name="mem_id" id="mem_id" onblur="pro_id()" class="form-control" required="required">
<div><span id="idok"></span></div>
    </div>
  </div>
</div>

<!-- 이름 -->
<div class="form-group">
  <label class="col-md-4 control-label" >이름</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input class="form-control"  type="text" name="mem_name" id="mem_name">
    </div>
  </div>
</div>

<!-- 비밀번호 -->
<div class="form-group">
  <label class="col-md-4 control-label">비밀번호</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password"  name="mem_pwd" id="mem_pwd" class="form-control"  onblur="pro_pwd()" required="required">
 <div><font color="red"><span id="msg_pwd"></span></font></div>
    </div>
  </div>
</div>

<!-- 비밀번호확인 -->
<div class="form-group">
  <label class="col-md-4 control-label">비밀번호 확인</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password"  name="mem_pwdk" id="mem_pwdk" class="form-control"  onblur="pro_pwdk()" required="required">
  <div><font color="red"><span id="msg_pwdk"></span></font></div>
    </div>
  </div>
</div>

<!-- 이메일 -->
<div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <!-- <input name="email" placeholder="E-Mail Address" class="form-control"  type="text"> -->
    
    <input type="text" name="mem_email" required="required" class="form-control selectpicker" style="width: 150px;">
    										<select name="mem_email" placeholder="E-Mail Address" style="max-width: 50%" class="form-control">
											<option>@naver.com</option>
											<option>@nate.com</option>
											<option>@gmail.com</option>
											<option>@hanmail.net</option>
											</select>
    </div>
  </div>
</div>
<!-- 핸드폰 번호 -->
<div class="form-group">
  <label class="col-md-4 control-label">Phone #</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>

  
 	<select name="mem_phone" class="form-control selectpicker" style="max-width: 30%"> 
			<option>010</option>
			<option>016</option>
			<option>018</option>
			<option>011</option>
			</select>
			<label>-</label><input type="text" name="mem_phone" id="mem_phone" maxlength="4" required="required" class="inline" style="width: 100px;">
			<label>-</label><input type="text" name="mem_phone" id="mem_phone" maxlength="4" required="required" class="inline" style="width: 100px;">
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button type="submit" class="btn btn-warning" >가입신청 <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>
</fieldset>
</form>
</div>

<%-- <form action="joinMember.do" method="post" id="member_join">
<table border="1">
	<tr><td>아이디  </td><td><span id="msg_id"></span><br><input type="text" name="mem_id" id="mem_id" onblur="pro_id()" required="required"><br><span id="idok"></span></td></tr>
	<tr><td>비밀번호  </td><td><input type="password" name="mem_pwd" id="mem_pwd" onblur="pro_pwd()" required="required"><br><span id="msg_pwd"></span></td></tr>
	<tr><td>비밀번호 확인 </td><td><input type="password" name="mem_pwdk" id="mem_pwdk" onblur="pro_pwdk()" required="required"><br><span id="msg_pwdk"></span></td></tr>

	<tr><td>이름 </td><td><input type="text" name="mem_name" id="mem_name" required="required"></td></tr>
	<tr><td>E-mail </td><td> <input type="text" name="mem_email" required="required">@<select name="mem_email">
											<option>naver.com</option>
											<option>nate.com</option>
											<option>gmail.com</option>
											<option>hanmail.net</option>
											</select></td></tr>
	<tr><td>휴대폰번호 번호 </td><td><select name="mem_phone"> 
			<option>010</option>
			<option>016</option>
			<option>018</option>
			<option>011</option>
			</select>
			-<input type="text" name="mem_phone" id="mem_phone" maxlength="4" required="required" >
			-<input type="text" name="mem_phone" id="mem_phone" maxlength="4" required="required"><br></td></tr>
	<tr><td></td><td><center><input type="submit" value="가입신청" class="signupbtn"><input type="reset" value="다시입력"></center></td></tr>
</table> --%>
</form>

</body>

</html>
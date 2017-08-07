<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <link rel="stylesheet" href="resources/css/join-style.css">
<script src="resources/js/join-index.js"></script> -->
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

<div class="container">
<form class="well form-horizontal" action="memberupdate.do" method="post"  id="contact_form">
<fieldset>

<!-- 아이디 -->
<div class="form-group">
  <label class="col-md-4 control-label">아이디</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" name="mem_id" id="mem_id" value="${mem_update_ready.mem_id }" onblur="pro_id()"  placeholder="First Name" class="form-control" readonly="readonly">
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
  <input class="form-control"  type="text" value="${mem_update_ready.mem_name }" name="mem_name" id="mem_name" readonly="readonly">
    </div>
  </div>
</div>

<!-- 비밀번호 -->
<div class="form-group">
  <label class="col-md-4 control-label">비밀번호</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password"  name="mem_pwd" id="mem_pwd" class="form-control" value="${mem_update_ready.mem_pwd }" onblur="pro_pwd()" required="required">
 <div><span id="msg_pwd"></span></div>
    </div>
  </div>
</div>

<!-- 비밀번호확인 -->
<div class="form-group">
  <label class="col-md-4 control-label">비밀번호 확인</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password"  name="mem_pwdcheck" id="mem_pwdcheck" class="form-control" value="${mem_update_ready.mem_pwd }" onblur="pro_pwdk()" required="required">
  <div><span id="msg_pwdk"></span></div>
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
    
    <input type="text" name="mem_email" value="${emailch }" required="required" class="form-control selectpicker" style="width: 150px;">
    										<select data-type="${endemail }" name="mem_email" placeholder="E-Mail Address" style="max-width: 50%" class="form-control">
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

  
 	<select name="mem_phone" class="form-control selectpicker" style="max-width: 30%" data-type="${phonef }"> 
			<option>010</option>
			<option>016</option>
			<option>018</option>
			<option>011</option>
			</select>
			<label>-</label><input type="text" name="mem_phone" id="mem_phone" maxlength="4" required="required" class="inline" style="width: 100px;" value="${phonec }">
			<label>-</label><input type="text" name="mem_phone" id="mem_phone" maxlength="4" required="required" class="inline" style="width: 100px;" value="${phonee }">
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button type="submit" class="btn btn-warning" >정보변경 <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>
		
	<%-- 	<td>이메일</td>
		<td><input type="text" value="${emailch }" name="mem_email" id="mem_email">@
													<select name="mem_email" id="mem_emailend" data-type="${endemail }">
													<option>naver.com</option>
													<option>nate.com</option>
													<option>gmail.com</option>
													<option>hanmail.net</option>
<%-- 													</select></td> --%>
<%-- 		<td></td>
													
	</tr>
	<tr> --%>
<%-- 		<td>휴대폰번호 번호 </td>
		<td><select name="mem_phone" id="mem_phonef" data-type="${phonef }"> 
					<option>010</option>
					<option>016</option>
					<option>018</option>
					<option>011</option>
					</select>
					-<input type="text" name="mem_phone" id="mem_phonec" maxlength="4" value="${phonec }">
					-<input type="text" name="mem_phone" id="mem_phonee" maxlength="4" value="${phonee }"><br></td>
		<td></td>
	</tr>
	<tr> --%>
	<!-- 	<td></td>
		<td><center><input type="submit" value="정보변경"><input type="reset" value="다시입력"></center></td>
		<td></td>
	</tr>
</table>
 --%> -->
</fieldset>
</form>
</div>

</body>
</html>
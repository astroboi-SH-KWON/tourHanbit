<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="resources/js/index.js"></script>
  <link rel="stylesheet" href="resources/css/style.css">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>

  
  <div class="wrapper">
	<div class="container">
		<h1>Welcome</h1>
		
		<form action="loginmember.do" method="post" class="form">
			<input type="text" name="mem_id" placeholder="Username"><br>
			<input type="password" name="mem_pwd" placeholder="Password"><br> 
			<button type="submit" id="login-button">Login</button>
		</form>
			<a href="findpassword.do">Find Password<a>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>


 	
 
</body>
</html>
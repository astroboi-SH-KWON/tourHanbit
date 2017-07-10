<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
	input[type=text] , input[type=date], select{
    display: inline;
    border: 1px solid #ccc;
    padding: 10px 20px;
    border-radius: 5px;
    box-sizing: border-box;
	}
	input[type=text] {width: 300px;}
	select {width: 150px;
	color: white;
	background-color:#337ab7;
	border-color:#2e6da4
    }
	
	
	input[type=submit] {
    width: 100px;
    color: white;
    padding: 8px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

	#srch1:hover{color:#fff;background-color:#fff;border-color:#204d74;
	}


</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#srchOption").change(function() {

			if($(this).val()==3){
				//$("#srchSpan").empty();
				//$("<input type=\"date\" id=\"fromDay\" name=\"fromDay\">").appendTo($("#srchSpan"));			
				//$("<label>&nbsp<font color=\"#337ab7\"><b> ~ </b></font>&nbsp</label>").appendTo($("#srchSpan"));
				//$("<input type=\"date\" id=\"toDay\" name=\"toDay\">").appendTo($("#srchSpan"));
				
				$("#srchSpan").css("visibility","hidden");
				$("#srchDateSpan").css("visibility","visible");
			}else{
				//$("#srchSpan").empty();
				//$("<input type=\"text\" id=\"srch\" name=\"srch\" placeholder=\"검색어를 입력하세요.\">").appendTo($("#srchSpan"));
				$("#srchSpan").css("visibility","visible");
				$("#srchDateSpan").css("visibility","hidden");
			}
		});
		
	});
</script>
</head>
<body>	
	<nav class="navbar navbar-inverse ">
  	<div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="mainPage.do">한빛여행사</a>
    </div>

    <ul class="nav navbar-nav navbar-right ">

	
	 <c:if test="${r!=1 }">
	   <li><a href="insertMember.do"><span class="glyphicon glyphicon-user"></span>회원 가입</a></li>
      <li><a href="loginMember.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	  </c:if>
	  
	  
	  <c:if test="${r==1 }">
	  	<li><a href="logoutMember.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
    
		  <c:if test="${thisis_admin==100}">
		  	<li><a href="adminLogin.com"><span class="glyphicon glyphicon-log-in"></span>관리자페이지</a></li>
		  </c:if>
		 <li><a href="mypage.do"><span ></span>MyPage   </a></li>
	  </c:if>
	 
	</ul>
	</div>
	</nav>
<hr>
	<div class="btn-group btn-group-justified" >
    <a href="mainPage.do?page=dom" class="btn btn-primary" >국내여행</a>
    <a href="mainPage.do?page=inter" class="btn btn-primary" >해외여행</a>
  <!--  <a href="optionSrch.do" class="btn btn-primary" >날짜검색</a>  --> 
    <a href="listQna.do" class="btn btn-primary" >Q&A</a>
    <a href="listNotice.do" class="btn btn-primary" >공지사항</a><!-- style="background-color: lightblue;" -->
   </div>
   
	<center>
<div >
  <form action="srch.do">
     <select id="srchOption" name="srchOption"  style="color:#fff;">
      <option value="0" style="color: white;">전체검색</option>
      <option value="1" style="color: white;">해외여행</option>
      <option value="2" style="color: white;">국내여행</option>
      <option value="3" style="color: white;">날짜 검색</option>
    </select>  &nbsp&nbsp 
    <table><tr><td></td>
    	</tr>
    </table> 
    <span id="srchSpan">
    <input type="text" id="srch" name="srch" placeholder="검색어를 입력하세요." >  
    </span>
    <span id="srchDateSpan" style="visibility:hidden;">
    <input type="date" id="fromDay" name="fromDay">		
	<label>&nbsp<font color="#337ab7"><b> ~ </b></font>&nbsp</label>
	<input type="date" id="toDay" name="toDay">
    </span>
    
    &nbsp&nbsp
    <input type="submit" id="srch1" value="검색" style="color:#fff;background-color:#337ab7;border-color:#2e6da4" class="btn btn-primary"ocation.href='srch.do?'">
  </form>
</div>
	</center>
	
<hr>

</body>
</html>
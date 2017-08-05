<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 관리</h2>
<div class="panel panel-default">
    <div class="panel-heading">
    	<i class="fa fa-male fa-fw"></i>
    	 회원 목록
    	<i class="fa fa-female fa-fw"></i>
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
						<tr>
							<td>아이디</td>
							<td>성함</td>
							<td>이메일</td>
							<td>핸드폰번호</td>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${memberList }">
								<tr>
									<td>${m.mem_id }</td>
									<td><a href="adminMemberDetail.do?mem_id=${m.mem_id }">${m.mem_name }</a></td>
									<td>${m.mem_email }</td>
									<td>${m.mem_phone }</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
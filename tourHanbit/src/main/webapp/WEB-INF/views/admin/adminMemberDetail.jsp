<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>서브 페키지 상세</h2>
<hr>
<div class="panel panel-default">
    <div class="panel-heading">
    	<i class="fa fa-heart fa-fw"></i> 회원 상세
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
							<tr>
								<td>회원 번호</td>
								<td>회원 이름</td>
								<td>회원 email</td>
								<td>회원 전화번호</td>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${m.mem_id }</td>
								<td>${m.mem_name }</td>
								<td>${m.mem_email }</td>
								<td>${m.mem_phone }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
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
    	<i class="fa fa-heart fa-fw"></i> 서브 패키지 내용
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
							<tr>
								<td>상품상세번호</td>
								<td>가격</td>
								<td>출발일</td>
								<td>도착일</td>
								<td>항공사</td>
								<td>예약자 수</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${spv.item_key_sub }</td>
								<td>${spv.price_sub }</td>
								<td><fmt:formatDate value="${spv.d_date }" pattern="yyyy-MM-dd HH:mm"/></td>
								<td><fmt:formatDate value="${spv.a_date }" pattern="yyyy-MM-dd HH:mm"/></td>
								<td>${spv.airplane }</td>
								<td>${spv.reser_sub }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

	<br>
	<button onclick="location.href='adminUpdateSubItem.do?item_key_sub=${spv.item_key_sub}'">수정</button>
	<button onclick="location.href='adminDeleteSubItem.do?item_key_sub=${spv.item_key_sub}'">삭제</button>
</body>
</html>
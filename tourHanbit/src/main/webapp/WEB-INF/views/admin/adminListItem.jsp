<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품관리</h2>
<hr>
<button onclick="location.href='adminInsertItem.do'" style="margin-left: 1%;">패키지 등록</button>

<br>
<div class="panel panel-default">
    <div class="panel-heading">
    	<i class="fa fa-qq fa-fw"></i> 상품 목록
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
							<tr>
								<td>상품번호</td>
								<td>상품명</td>
								<td>가격</td>
								<!-- <td>출발일</td>
								<td>도착일</td> -->
								<td>도시</td>
								<td>예약자 수</td>
							</tr>
						  </thead>
						   <tbody>
								<c:forEach var="p" items="${adminPackageList }">
								<tr>
									<td>${p.item_key }</td>
									<td><a href="adminDetailItem.do?item_key=${p.item_key }">${p.item_name }</a></td>
									<td>${p.price }</td>
									<%-- <td><fmt:formatDate value="${p.d_date }" pattern="yyyy/MM/dd"/></td>
									<td><fmt:formatDate value="${p.a_date }" pattern="yyyy/MM/dd"/></td> --%>
									<td>${p.city }</td>
									<td>${p.reser }</td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<span>전체 페이지 : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${pageStr }</span>
	
</div>
</body>
</html>
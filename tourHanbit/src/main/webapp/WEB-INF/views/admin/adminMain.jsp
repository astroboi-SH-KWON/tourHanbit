<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#img1 {
	width: 80%;
	height: 300px;
	position: relative;
	
}
#img2{
	width: 90%;
	height: 500px;
	position: relative;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Main Page</h2>

<div class="panel panel-default">
    <div class="panel-heading">
    	<i class="fa fa-github-alt fa-fw"></i> Main Page
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
							<tr>
								<td width="60%" colspan="2">
									<img src="/tourapp/resources/img/${fname }" id="img1" class="rChart" style="margin-left: 8%;">
								</td>
								
							</tr>
							<tr>
								<td width="60%">
									<img src="/tourapp/resources/img/${fname2 }" id="img2" class="rChart" style=" left: 4%; top: 10px;">
								</td>
								<td>
									<!-- //////////////////////////////////////////////////////////////// -->
									<div class="panel-heading">
    									<i class="fa fa-linux fa-fw"></i>출발 날짜별 상품 주문 현황
									</div>
   									<!-- /.panel-heading -->
    								<div class="panel-body">
										<table class="table table-bordered table-hover table-striped">
											<tr>
												<td>상품번호</td>
												<td>매출날짜</td>
												<td>주문자 수</td>
												<td>매출현황</td>
											</tr>
											<c:forEach var="o" items="${adminMainList }">
												<tr>
													<td>${o.item_key_sub }</td>
													<td><fmt:formatDate value="${o.orderdate }" pattern="yyyy/MM/dd"/></td>
													<td>${o.orders_su }</td>
													<td>${o.price_sub }</td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<!-- ///////////////////////////////////////////////////////////////// -->
								</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- <img src="C:/stsStudy03/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/tourHanbit/resources/img/${fname }" width="80%" height="400"> --%>

</body>
</html>
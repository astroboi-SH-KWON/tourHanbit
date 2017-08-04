<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(function() {
		$(".btn_orderChecked").on("click",function() {
				var tr=$(this).closest("tr");
				var orderid=$(tr).find("td").first().text();
				var td_deposit=$(tr).find(".btn_orderChecked").closest("td");
				
				$.ajax({
					url:"adminOrderCheck.do",
					type:"get",
					data:{"orderid":orderid},
					success:function(data)
					{
						if(data==1)
						{
							td_deposit.empty();
							$(td_deposit).text("입금완료");
						}
					}
					
					
				})
			})
		$(".btn_orderCancel").on("click", function() {
			
			var ck =confirm("주문을 취소 하시겠습니까?");
			
			if(ck)
			{
				var tr=$(this).closest("tr");
				var orderid=$(tr).find("td").first().text();
				
				$.ajax({
					url:"adminOrderCancel.do",
					type:"get",
					data:{"orderid":orderid},
					success:function(data)
					{
						if(data==1)
						{
							tr.remove();
						}
					}
				})
			}
		})
	});
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	
<body>

<h2>주문 관리</h2>
<div class="panel panel-default">
    <div class="panel-heading">
    	<i class="fa fa-linux fa-fw"></i> 상품 목록
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
						<thead>
							<tr>
								<td>주문 번호</td>
								<td>상품 번호</td>
								<td>상품 명</td>
								<td>회원 ID</td>
								<td>주문 날짜</td>			
								<td>입금 여부</td>
								<td>주문 상태</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o" items="${ordersList }">
								<tr>
									<td class="orderid">${o.orderid }</td>
									<td>${o.item_key_sub }</td>
									<td>${o.item_name }</td>
									<td>${o.mem_id }</td>
									<td><fmt:formatDate value="${o.orderdate }" pattern="yyyy/MM/dd"/></td>
									<c:if test="${o.deposit == 'yet'}">
										<td><button class="btn_orderChecked">입금 확인</button></td>
									</c:if>
									<c:if test="${o.deposit != 'yet'}">
										<td>입금 완료</td>
									</c:if>
									<td><button class="btn_orderCancel">주문 취소</button></td>
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
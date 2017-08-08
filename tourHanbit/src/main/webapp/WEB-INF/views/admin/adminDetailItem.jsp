<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		$(function() {
			$("#btn_delete").click(function() {
				var item_key= $("#item_key").text();
				var reser= $("#reser").val();
				
				var check= confirm(reser+"명의 예약자가 있습니다. 지우시겠습니까?");
				if(check)
				{
					$(location).attr('href',"adminDeleteItem.do?item_key="+item_key);
				}
			})
		})
	</script>
</head>
<body>

<h2>패키지 상세</h2>
<br>
<c:if test="${subCount!=null }">
	서브페키지 :
</c:if>
<c:forEach var="sc" items="${subCount}">
 	<button onclick="location.href='adminDetailSubItem.do?item_key_sub=${sc.item_key_sub}'">${sc.item_key_sub }</button>
 	<%-- <a href='adminDetailSubItem.do?item_key_sub=${sc.item_key_sub}'><button>${sc.item_key_sub }</button></a> --%>
</c:forEach>
<br>
<h5>상품내용</h5>
<div class="panel panel-default">
    <div class="panel-heading">
    	<i class="fa fa-book fa-fw"></i> 상품 정보
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
							<tr>
								<td>상품 번호</td>
								<td>상품명</td>
								<td>가격</td>
								<td>도시</td>
								<td>예약자 수</td>
								<td>소개글</td>
								<td>도시번호</td>
							</tr>
							</thead>
						   	<tbody>
								<tr>
									<td id="item_key">${p.item_key }</td>
									<td>${p.item_name }</td>
									<td>${p.price }</td>
									<td>${p.city }</td>
									<td>${p.reser }</td>
									<td>${p.intro_text }</td>
									<td>${p.city_id }</td>
								</tr>
							</tbody>
					</table>
					<input type="hidden" value="${p.reser }" id="reser">
				</div>
			</div>
		</div>
	</div>
</div>
<hr>
<h5>상세일정</h5>
<div class="panel panel-default">
	<div class="panel-heading">
    	<i class="fa fa-calendar fa-fw"></i> 상품 일정
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
							<tr>
								<td>일차</td>
								<td>일정</td>
							</tr>
							</thead>
						   	<tbody>
								<c:forEach var="sv" items="${svList }">
								<tr>
									<td>${sv.day_number }</td>
									<td>${sv.content }</td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<hr>
<h5>사진</h5>
<div class="panel panel-default">
	<div class="panel-heading">
    	<i class="fa fa-photo fa-fw"></i> 여행지 사진
	</div>
   <!-- /.panel-heading -->
    <div class="panel-body" style="width: 100%">
    	<div class="row" style="width: 100%">
		    <div class="col-lg-4" style="width: 100%">
    			<div class="table-responsive" style="width: 100%">
    				<table class="table table-bordered table-hover table-striped" style="width: 100%">
    					<thead>
							<tr>
								<c:if test="${not empty iv.image01}">
									<td width="100">사진1</td>
								</c:if>
								<c:if test="${not empty iv.image02}">
									<td width="100">사진2</td>
								</c:if>
								<c:if test="${not empty iv.image03}">
									<td width="100">사진3</td>
								</c:if>
								<c:if test="${not empty iv.image04}">
									<td width="100">사진4</td>
								</c:if>
								<c:if test="${not empty iv.image05}">
									<td width="100">사진5</td>
								</c:if>
								<c:if test="${not empty iv.image06}">
									<td width="100">사진6</td>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:if test="${not empty iv.image01}">
								<td width="70"><img src="/tourapp/resources/img/${iv.image01 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image02}">
								<td width="70"><img src="/tourapp/resources/img/${iv.image02 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image03}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image03 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image04}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image04 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image05}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image05 }" width="100%" height="90"></td>
								</c:if>
									<c:if test="${not empty iv.image06}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image06 }" width="100%" height="90"></td>
								</c:if>
							</tr>
						</tbody>
						<thead>
							<tr>
								
								<c:if test="${not empty iv.image07}">
									<td width="100">사진7</td>
								</c:if>
								<c:if test="${not empty iv.image08}">
									<td width="100">사진8</td>
								</c:if>
								<c:if test="${not empty iv.image09}">
									<td width="100">사진9</td>
								</c:if>
								<c:if test="${not empty iv.image10}">
									<td width="100">사진10</td>
								</c:if>
								<c:if test="${not empty iv.image11}">
									<td width="100">사진11</td>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:if test="${not empty iv.image07}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image07 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image08}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image08 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image09}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image09 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image10}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image10 }" width="100%" height="90"></td>
								</c:if>
								<c:if test="${not empty iv.image11}">
								<td width="100"><img src="/tourapp/resources/img/${iv.image11 }" width="100%" height="90"></td>
								</c:if>
							</tr>
						</tbody>
					</table>
					
					<button onclick="location.href='adminInsertSubItem.do?item_key=${p.item_key}'">서브패키지 등록</button>
					<button onclick="location.href='adminUpdateItem.do?item_key=${p.item_key}'">수정</button>
					<button id="btn_delete">삭제</button>
 

				</div>
			</div>
		</div>
	</div>
<br>

</div>
</body>
</html>
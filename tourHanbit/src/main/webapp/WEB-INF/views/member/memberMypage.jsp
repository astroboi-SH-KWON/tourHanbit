<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
  function popupOpen(){


	  var popUrl = "paymentoption.do";	
	  var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption);

		}

  </script>
  <style type="text/css">
  	
  	#myupdate{float: right;}
  	.table table-hover{
  		border-bottom-color: blue;
  	}
  	#my_page_reservation
  	{
  	margin-top: 150px;
  	
  	}
  	#my_page_Recommended_goods
  	{
  	
  	}
  	#my_page_QNA
  	{
  	
  	}
  	#right_mypage
  	{
  	margin-top: 150px;
  	margin-left: 1350px;
  	}
  	
  </style>
<title>Insert title here</title>
 <!-- Bootstrap Core CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/morrisjs/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="right"><a href="logout.do"><button>�α׾ƿ�</button></a></div>

<div class="navbar-default sidebar" role="navigation" id="right_mypage">
	<div class="sidebar-nav navbar-collapse">
    	<ul class="nav" id="side-menu">
        	<li>
            	<ul class="nav nav-second-level">
                	<li>
                    	<a href="memberupdate.do"><i class="fa fa-user"></i>ȸ������ ����<span class="fa arrow"></span></a>
                    </li>
                    <li>
                    	<a href="javascript:popupOpen();"><i class="fa fa-money"></i>���� ����ȳ�<span class="fa arrow"></span></a>
                    </li>
                    <li>
                    	<a href="memberupdate.do"><i class="fa fa-bank"></i>���¹�ȣ �ȳ�<span class="fa arrow"></span></a>
                    </li>
                    <li>
                    	<a href="javascript:popupOpen();"><i class="fa fa-star"></i>��� ���� ��ǰ<span class="fa arrow"></span></a>
                    </li>
                	<li>
                    	<a href="airplanorders.do"><i class="fa fa-star"></i>����� ������<span class="fa arrow"></span></a>
                    </li>
				</ul>
			</li>
		</ul>
	</div>
</div>
                            

<div class="container">
<table id="my_page_reservation" class="table table-hover">
<tr><td><h3>${title }</h3></td></tr>
<tr>
<th>�ֹ� ��ȣ</th><th>��ǰ��</th><th>����</th><th>�ֹ���</th><th>�����Ȳ</th><th>���� Ȯ��/���� ���</th>
</tr>
<%-- <c:forEach var="pd" items="${Paymentdetails }">
<tr>
<td>${pd.orderid }</td>
<td>${pd.item_name }</td>
<td>${pd.price }</td>
<td>${pd.orderdate }</td>
<td></td>
<td><center><a href="memberMypagedelete.do?orderid=${pd.orderid }">���</a></center></td>
</tr>
</c:forEach> --%>
</table>
<hr>
<br>
<table id="my_page_Recommended_goods" class="table table-hover">
<tr><td><h3>��õ ��ǰ</h3></td></tr>
<tr>
<th>��ǰ ��</th><th>�����/������</th><th>��ǰ ����</th>
</tr>
</table>
<hr>
<br>
<table id="my_page_QNA" class="table table-hover">
<tr><td><h3>${myqnaa }</h3></td></tr>
<tr>
<!-- <th>��ȣ</th> --><th>����</th><th>�ۼ���</th><th>�����</th>
</tr>
<c:forEach var="q" items="${myqna }">
<tr>
<td>${q.qna_number }</td>
<td>${q.qna_title }</td>
<td>${q.mem_id }</td>
<td>${q.qna_date }</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>
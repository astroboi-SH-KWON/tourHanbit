<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<div><jsp:include page="adminTop.jsp"/></div>
	

	<div id="wrapper">
		<!-- Navigation -->
	    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		    <div class="navbar-header">
			    <a class="navbar-brand" href="adminMain.do">HB Admin</a>
			</div>
			
            
			<!-- /.navbar-top-links -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
					    <li>
				    		<a href="adminMain.do"><i class="fa fa-dashboard fa-fw"> Main Page </i></a>
				    	</li>
				    	<li>
					    		<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
					    	<ul class="nav nav-second-level">
					        	<li>
					            	<a href="adminGgPlotLine.do">ggPlotLine Charts</a>
					            </li>
					           	<li>
					           		<a href="adminGgPlotBar.do">ggPlotBar Charts</a>
					            </li>
					        </ul>
					        <!-- /.nav-second-level --> 
				        </li>
				        <li>
				           <a href="adminListItem.do"><i class="fa fa-plane fa-fw"> Packages </i></a>
				        </li>
				        <li>
				            <a href="adminMember.do"><i class="fa fa-user fa-fw"> Members </i></a>
				        </li>
				        <li>
				            <a href="adminOrders.do"><i class="fa fa-money fa-fw"> Orders </i></a>
				        </li>
				    </ul>
				  </div>
				      <!-- /.sidebar-collapse -->
			</div>
				            <!-- /.navbar-static-side -->
		 </nav>
		 <div id="page-wrapper">
	 		
                
                   
                       <div><jsp:include page="${view }"/></div>
                   
           
         
	</div>
</div>	       
	 <div style="margin-left: 18%;"><jsp:include page="adminBottom.jsp"/></div>

</body>
</html> 
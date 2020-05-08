<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/resources/images/common/icon.png">

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap datePicker -->
    <link href="/resources/include/dist/css/bootstrap-datepicker.css" rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<style>
  	.body-height {
  		min-height: 1000px;
  	}
	</style>
  </head>

  <body>
    <!-- Fixed navbar -->
    <div class="container">
	    <nav class="navbar navbar-default navbar-fixed-top">
			<tiles:insertAttribute name="header"/>
    	</nav>
    </div>

    <!-- Begin page content -->
    <div class="container body-height">
    	<div class="page-header">
	    	<div class="jumbotron">
	    		<h1>워크트리에 오신것을 환영합니다</h1>
	    	</div> 
	    	<div class="container">
	    		<img src="../../../../../resources/images/main.jpg" height="650" width="1100">
	    	</div>
    	</div>  	
		
    </div><!--/.container-->
    
    <div class="footer">
		<tiles:insertAttribute name="footer"/>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap-datepicker.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

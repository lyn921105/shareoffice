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
	    <!--[if lt IE 9]><script src="/resources/include/dist/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    <!-- <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	    <script type="text/javascript">
	    	$(function(){
	    		$("#navbar .nav li:eq(0)").addClass("active");
	    		$("#navbar .nav li").click(function(){
	    			console.log($(this).find("a").attr("data-url"));
	    			$(this).toggleClass("active");
					$("#navbar .nav li").not(this).removeClass("active");
					//location.href=$(this).find("a").attr("data-url");
	    		});
	    	});
	    </script> -->
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
        <h2><tiles:getAsString name="title" /></h2>
      </div>
      <tiles:insertAttribute name="body"/>
    </div>

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

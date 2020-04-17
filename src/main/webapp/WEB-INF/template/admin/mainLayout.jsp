<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resource/include/css/admin.css" />

<!-- js -->
<script type="text/javascript"
	src="resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/include/js/common.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="/resources/include/dist/assets/js/docs.min.js"></script>
<script
	src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<tiles:insertAttribute name="aside" />
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<tiles:insertAttribute name="content" />
			</div>

		</div>
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>

</body>
</html>
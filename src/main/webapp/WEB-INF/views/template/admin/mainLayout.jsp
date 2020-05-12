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
	href="/resources/include/admin.css" />

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="/resources/include/dist/assets/js/docs.min.js"></script>
<script
	src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
<style type="text/css">
th {
text-align : center;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</nav>

	<div class="container-fluid" style="min-height: 730px;">
		<div class="row">
			<div class="col-sm-3 sidenav" style="position:static; width: 210px; bottom:61px;">
				<tiles:insertAttribute name="aside" />
			</div>
			<div class="col-sm-9 main">
				<tiles:insertAttribute name="content" />
			</div>

		</div>
	</div>
		<div class="footer">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
</body>
</html>
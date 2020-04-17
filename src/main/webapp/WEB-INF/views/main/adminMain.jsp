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
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</nav>
	<div class="container">
		<a class="title-menu" href="/adminMember/list" role="button">회원
			관리</a> <a class="title-menu" href="/adminContract/list" role="button">계약
			관리</a> <a class="title-menu" href="/adminReservation/ConsultList"
			role="button">예약 관리</a> <a class="title-menu"
			href="/adminRoom/main" role="button">호실 관리</a> <a
			class="title-menu" href="/adminQuestion/qnaList" role="button">
			문의 관리</a> <a
			class="title-menu" href="/adminQuestion/faq" role="button">
			faq</a>
	</div>
</body>
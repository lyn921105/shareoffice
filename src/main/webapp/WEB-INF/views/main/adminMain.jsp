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
	href="/resources/include/css/admin.css" />

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<style type="text/css">
#adminmenubox{
position : absolute;
width : 460px;
height : 300px;
text-align : center;
top : 42%;
left : 50%;
transform : translate(-50%, -50%);
}
.menu {
height : 140px;
width : 140px;
border-radius : 20%;
background-color : #888888;
opacity : 1;
transition : 0.3s;
}
.menu:hover {
opacity : 0.6;
}
.title-menu {
text-align : center;
line-height : 140px;
color : black;
font-size : large;
font-weight : bold;
}
.title-menu:hover {
text-decoration : none;
color : black;
}
.container-fluid img {
position : absolute; top:0; left:0;
width : 100%;
height : 780px;
opacity : 0.75;
}
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</nav>
	<div class="container-fluid" style="min-height: 730px; width:100%; float:none; margin:0 auto">
	<img src="../../../../../resources/images/admin_main_background.jpg" height="733px" width="100%">
	<div id="adminmenubox" class="text-center">
		<div>
		<a class="title-menu" href="/adminMember/list"><div class="menu" style="float:left">회원 <span class="glyphicon glyphicon-user"></span></div></a>
		<a class="title-menu" href="/adminReservation/consultList"><div class="menu" style="float:left; margin-left:20px">예약 <span class="glyphicon glyphicon-pencil"></span></div></a>
		<a class="title-menu" href="/adminContract/main"><div class="menu" style="float:left; margin-left:20px">계약 <span class="glyphicon glyphicon-ok"></span></div></a>
		</div>
		<div>
		<a class="title-menu" href="/adminRoom/main"><div class="menu" style="float:left; margin-left:80px; margin-top:20px">호실 <span class="glyphicon glyphicon-home"></span></div></a>
		<a class="title-menu" href="/adminQuestion/qnaList"><div class="menu" style="float:left; margin-left:20px; margin-top:20px"">문의 <span class="glyphicon glyphicon-question-sign"></span></div></a>
		</div>
	</div>
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<head>
<style type="text/css">
.menuTitle {
font-weight : bold;
}
</style>
</head>

<nav class="nav nav-sidebar" style="width: 200px;">
	<ul class="list-group">
		<li class="list-title"><span class="list-group-item menuTitle">회원 <span class="glyphicon glyphicon-user"></span></span></li>
		<li><a class="list-group-item menuList" href="/adminMember/list">&nbsp;&nbsp;&nbsp;&nbsp;회원 관리</a></li>
	</ul>
	<ul class="list-group">
		<li><span class="list-group-item menuTitle">예약 <span class="glyphicon glyphicon-pencil"></span></span></li>
		<li><a class="list-group-item menuList" href="/adminReservation/consultList">&nbsp;&nbsp;&nbsp;&nbsp;방문 상담 예약</a></li>
		<li><a class="list-group-item menuList" href="/adminReservation/moveInList">&nbsp;&nbsp;&nbsp;&nbsp;입주 예약</a></li>
	</ul>
	<ul class="list-group">
		<li><span class="list-group-item menuTitle">계약 <span class="glyphicon glyphicon-ok"></span></span></li>
		<li><a class="list-group-item menuList" href="/adminContract/main">&nbsp;&nbsp;&nbsp;&nbsp;계약 현황</a></li>
		<li><a class="list-group-item menuList" href="/adminContract/leaveList">&nbsp;&nbsp;&nbsp;&nbsp;퇴실 내역</a></li>
		<li><a class="list-group-item menuList" href="/adminContract/refundList">&nbsp;&nbsp;&nbsp;&nbsp;환불 요청</a></li>
	</ul>
	<ul class="list-group">
		<li><span class="list-group-item menuTitle">호실 <span class="glyphicon glyphicon-home"></span></span></li>
		<li><a class="list-group-item menuList" href="/adminRoom/main">&nbsp;&nbsp;&nbsp;&nbsp;호실 현황</a></li>
		<li><a class="list-group-item menuList" href="/adminContract/chart">&nbsp;&nbsp;&nbsp;&nbsp;상담/이용률 통계</a></li>
	</ul>
	<ul class="list-group">	
		<li><span class="list-group-item menuTitle">문의 <span class="glyphicon glyphicon-question-sign"></span></span></li>
		<li><a class="list-group-item menuList" href="/adminQuestion/qnaList">&nbsp;&nbsp;&nbsp;&nbsp;Q&A 관리</a></li>
		<li><a class="list-group-item menuList" href="/adminQuestion/faq">&nbsp;&nbsp;&nbsp;FAQ</a></li>
	</ul>
</nav>

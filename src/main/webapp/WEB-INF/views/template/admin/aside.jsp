<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>

<nav class="nav nav-sidebar" style="width: 200px;">
	<ul class="list-group">
		<li><a class="list-group-item menuList" href="/adminMember/list">회원 관리</a></li>
	</ul>
	<ul class="list-group">
		<li><a class="list-group-item menuList" href="/adminReservation/consultList">예약 관리</a></li>
		<li><a class="list-group-item menuList" href="/adminReservation/consultList">&nbsp;&nbsp;&nbsp;&nbsp;방문 상담 예약</a></li>
		<li><a class="list-group-item menuList" href="/adminReservation/moveInList">&nbsp;&nbsp;&nbsp;&nbsp;입주 예약</a></li>
	</ul>
	<ul class="list-group">
		<li><a class="list-group-item menuList" href="/adminContract/main">계약 관리</a></li>
		<li><a class="list-group-item menuList" href="/adminContract/main">&nbsp;&nbsp;&nbsp;&nbsp;계약 현황</a></li>
		<li><a class="list-group-item menuList" href="/adminContract/leaveList">&nbsp;&nbsp;&nbsp;&nbsp;퇴실 내역</a></li>
		<li><a class="list-group-item menuList" href="/adminContract/refundList">&nbsp;&nbsp;&nbsp;&nbsp;환불 요청</a></li>
	</ul>
	<ul class="list-group">
		<li><a class="list-group-item menuList" href="/adminRoom/main">호실 관리</a></li>
		<li><a class="list-group-item menuList" href="/adminRoom/resister">&nbsp;&nbsp;&nbsp;&nbsp;호실 등록/변경</a></li>
		<li><a class="list-group-item menuList" href="/adminRoom/usestatus">&nbsp;&nbsp;&nbsp;&nbsp;상담/이용률 통계</a></li>
	</ul>
	<ul class="list-group">	
		<li><a class="list-group-item menuList" href="/adminQuestion/qnaList">문의 관리</a></li>
		<li><a class="list-group-item menuList" href="/adminQuestion/qnaList">&nbsp;&nbsp;&nbsp;&nbsp;Q&A 관리</a></li>
		<li><a class="list-group-item menuList" href="/adminQuestion/faq">&nbsp;&nbsp;&nbsp;FAQ</a></li>
	</ul>
</nav>

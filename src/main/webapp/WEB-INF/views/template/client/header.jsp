<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page trimDirectiveWhitespaces="true"%>
<div class="container">
	<ul class="nav navbar-nav navbar-right">
		<c:if test="${loginSuccess == null or loginSuccess == ''}">
			<li><a href="/login/login">로그인</a></li>
			<li><a href="/member/injoin">회원가입</a>
		</c:if>
		<c:if test="${loginSuccess != null and loginSuccess != ''}">
			<li class="form-control-static">[ ${loginSuccess} ]님 반갑습니다</li>
			<li><a href="/login/logout">로그아웃</a></li>
		</c:if>
	</ul>
</div>
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/">Work Tree</a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">예약
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-left" role="menu">
					<li><a href="/visit/visitReservationForm">방문 상담</a></li>
					<li><a href="/reservation/reservationForm">온라인 예약</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">호실 안내
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-left" role="menu">
					<li><a href="/room/roomStatus">호실 이용 현황</a></li>
					<li><a href="/room/roomView">각 호실 안내</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">문의 게시판
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-left" role="menu">
					<li><a href="/qna/qnaList">Q&A</a></li>
					<li><a href="/faq/faqList">FAQ</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마이 페이지
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-left" role="menu">
					<li><a href="/member/memberModifyPwForm">회원 정보 수정</a></li>
					<li><a href="/member/memberDeletePwd">회원 탈퇴</a></li>
					<li><a href="/member/memberListPwdForm">예약 현황</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
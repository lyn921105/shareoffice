<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page trimDirectiveWhitespaces="true"%>
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
		<ul class="nav navbar-nav">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">예약
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/visit/visitReservation">방문 상담</a></li>
					<li><a href="/online/onlineReservation">온라인 예약</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">호실 안내
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/room/roomStatus">호실 이용 현황</a></li>
					<li><a href="/room/roomView">각 호실 안내</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">문의 게시판
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/qna/qnaList">Q&A</a></li>
					<li><a href="/faq/faqList">FAQ</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마이 페이지
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/member/memberModifyPwChk">회원 정보 수정</a></li>
					<li><a href="/member/memberSecede">회원 탈퇴</a></li>
					<li><a href="/member/reservationDetail">예약 현황</a></li>
				</ul>
			</li>
		</ul>
		
		<ul class="nav navbar-nav">
			<c:if test="${login.userId == null or login.userId == ''}">
				<li><a href="/login/login">로그인</a></li>
				<li><a href="/member/join">회원가입</a>
			</c:if>
			<c:if test="${login.userId != null and login.userId != ''}">
				<p class="form-control-static">[ ${login.userName} ]님 반갑습니다</p>
				<li><a href="/login/logout">로그아웃</a></li>
			</c:if>
		</ul>
		
		
		<%-- <c:if test="${login.userId != null and login.userId != ''}">
		<form class="navbar-form navbar-right">
            <!-- <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div> -->
            <p class="form-control-static">[ ${login.userName} ]님 반갑습니다</p>
            <button type="button" class="btn btn-success" onclick="location.href='/member/logout.do'">로그아웃</button>
            <!-- <button type="button" class="btn btn-success" onclick="location.href='/member/logout.do'">myPage</button> -->
          </form>
          </c:if> --%>
	</div>
	<!--/.nav-collapse -->
</div>
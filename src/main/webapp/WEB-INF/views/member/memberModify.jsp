<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.wt.client.login.dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원수정</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<!-- 비로그인시 처리 -->
	<script type="text/javascript">
		<c:if test="${empty loginSuccess}">
			alert("로그인이 필요합니다");
			location.href="/login/login";
		</c:if>
	</script>
	
	<h1>회원정보수정</h1>
	<hr>
	<form id="memberModify" action="/member/memberModifySuccess" method="post">
		<div class="form-group">
			<label for="c_id">아이디</label>			
			<input type="text" class="form-control" id="c_id" name="c_id" value="${loginSuccess}" readonly>
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<input class="form-control" type="password" id="c_pwd"
				name="c_pwd" value="${ member.c_pwd }">
		</div>
		<div class="form-group">
			<label>이름</label>
			<input class="form-control" type="text" id="c_name"
				name="c_name" value="${ member.c_name }">
		</div>
		<div class="form-group">
			<label>이메일</label>
			<input class="form-control" type="text" id="c_email"
				name="c_email" value="${ member.c_email }" required>
		</div>
		<div class="form-group">
			<label>연락처</label>
			<input class="form-control" type="text" id="c_phone"
				name="c_phone" value="${ member.c_phone }" required>
		</div>
		<div class="text-center">
			<input type="submit" class="btn btn-primary" value="회원수정">
			<button class="cencle btn btn-danger" type="button">취소</button>
		</div>
	</form>
</body>
</html>

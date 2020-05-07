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
</head>
<body>
	<h1>회원정보수정</h1>
	<hr>
	<form id="memberModify" action="/member/memberModifySuccess" method="post">
		<p>
			<label>PassWord</label> <input class="w3-input" type="text" id="c_pwd"
				name="c_pwd" value="${ member.c_pwd }">
		</p>
		<p>
			<label>Name</label> <input class="w3-input" type="text" id="name"
				name="name" value="${ member.c_name }">
		</p>
		<p>
			<label>Email</label> <input class="w3-input" type="text" id="c_email"
				name="c_email" value="${ member.c_email }" required>
		</p>
		<p>
			<label>Phone</label> <input class="w3-input" type="text" id="c_phone"
				name="c_phone" value="${ member.c_phone }" required>
		</p>
			<input type="submit" value="회원수정">
	</form>
</body>
</html>

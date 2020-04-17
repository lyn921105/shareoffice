<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 로그인 버튼 클릭 시 처리 이벤트
		$("#adminLoginBtn").click(function() {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/adminLogin/login"
			})
			
			
			
			
			$("#loginForm").submit();
		})
		
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode = 1) {
			alert("관리자 로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.")
		}
	})
</script>
</head>
<body>
	<form id="loginForm">
		<label for="admin_id">관리자 아이디</label> <input type="text" id="admin_id"
			name="admin_id" placeholder="관리자 아이디"> <label
			for="admin_passwd">관리자 비밀번호</label> <input type="password"
			id="admin_passwd" name="admin_passwd" placeholder="관리자 비밀번호">
		<input type="button" value="로그인" id="adminLoginBtn" />
	</form>
</body>
</html>
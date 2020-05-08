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
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		
		
		var errCode = '<c:out value="${errCode}"/>';
		
		if (errCode == 1) {
			alert("관리자 로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.")
		}
		
		// 로그인 버튼 클릭 시 처리 이벤트
		$("#adminLoginBtn").click(function() {
			if (!chkSubmit($('#a_id'), "아이디를")) {
				return;
			} else if (!chkSubmit($("#a_passwd"), "비밀번호를")) {
				return;
			} else {
				$("#loginForm").attr({
					"method" : "POST",
					"action" : "/adminLogin/login"
				})
				$("#loginForm").submit();
			}
		})
	})
</script>
</head>
<body>
	<form id="loginForm">
		<label for="a_id">관리자 아이디</label> <input type="text" id="a_id"
			name="a_id" placeholder="관리자 아이디">
			<br/>
			<label
			for="a_passwd">관리자 비밀번호</label> <input type="password"
			id="a_passwd" name="a_passwd" placeholder="관리자 비밀번호">
			<br/>
		<input type="button" value="로그인" id="adminLoginBtn" />
	</form>
</body>
</html>
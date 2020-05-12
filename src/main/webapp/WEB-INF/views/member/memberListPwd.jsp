<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 비밀번호 확인</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function() {
	/* 마이페이지 이동 버튼 처리 */
	$("#pwd_success").click(function(){
		$("#pwd_info").attr({
			"method":"POST",
			"action":"/member/memberListPwd"
		});
		$("#pwd_info").submit();
	});
	
	/* 돌아가기 버튼 클릭시 */
	$("#home_page").click(function(){
		location.href="/";
	});
});
</script>
</head>
<body>
	<!-- 비로그인시 처리 -->
	<script type="text/javascript">
		<c:if test="${empty loginSuccess}">
			alert("로그인이 필요합니다");
			location.href="/login/login";
		</c:if>
	</script>
	
	<h2>예약 현황</h2>
	<div class="container">
		<form id="pwd_info">
			<div class="form-group">
				<label for="c_id">아이디</label>			
				<input type="text" class="form-control" id="c_id" name="c_id" value="${loginSuccess}" readonly>
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" id="c_pwd" name="c_pwd" class="form-control">
			</div>
		</form>
		<input type="button" id="pwd_success" class="btn btn-success" value="예약현황으로 이동">
		<input type="button" id="home_page" class="cencle btn btn-danger" value="취소">
	</div>
</body>
</html>
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
	<div class="container">
		<form id="pwd_info">
			<h4>비밀번호 확인이 필요합니다</h4>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" id="c_pwd" name="c_pwd" class="form-control">
			</div>
		</form>
		<input type="button" id="pwd_success" class="btn btn-success" value="예약현황으로 이동">
		<input type="button" id="home_page" class="btn btn-default" value="돌아가기">
	</div>
</body>
</html>
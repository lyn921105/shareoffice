<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="text-center">
			<h3>회원탈퇴 안내드립니다.</h3>
			
			<p>워크트리 회원 탈퇴를 하게 되면 회원으로 누릴 수 있는 모든 혜택을 지원받지 못하게 됩니다.
			또한 동일한 ID로 재가입 할 수 없습니다.
			삭제된 정보는 복구가 불가능하오니 이점 유의하시기 바랍니다.</p>
			<br>
			<p>현재 워크트리 이용중인 회원은 탈퇴를 하실 수 없습니다.</p>
		</div>
		<div class="text-center">
			<form action="/member/memberDelete" method="POST">
				<input type="button" class="cencle btn btn-danger" value="취소하기">
				<input type="submit" class="btn btn-primary" value="회원탈퇴신청">
				<input type="hidden" id="c_id" name="c_id" value="${delete.c_id}">
				<input type="hidden" id="c_pwd" name="c_pwd" value="${delete.c_pwd}">
			</form>
		</div>
	</div>
</body>
</html>
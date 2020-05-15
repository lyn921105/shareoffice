<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="form-horizontal" role="form" method="POST"
		action="/login/serchPwChk">
		<h3>비밀번호 찾기</h3>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="form-group has-danger">
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<input type="email" name="c_email" class="form-control" id="email"
							placeholder="이메일" required>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
				<button type="submit" class="btn btn-outline-secondary findbtn">비밀번호
					찾기</button>
			</div>
		</div>
	</form>
</body>
</html>
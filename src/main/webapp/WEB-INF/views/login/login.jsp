<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		/* 로그인 버튼 클릭시 처리 */
		$("#login_success").click(function(){
			$("#login_info").attr({
				"method":"POST",
				"action":"/member/login"
			});
			$("#login_info").submit();
		});
		
		/* 돌아가기 버튼 클릭시 */
		$("#home_page").click(function(){
			location.href="/";
		});

		
		$("#btnLogin").click(function() {
			var frm = document.loginForm;

			//IE9용 class속성으로 validation check
			if ($('#membId').hasClass("placeholdersjs")) {
				var membId = $("#membId").attr('value');
			} else {
				var $this = $(this);
			}
			if ($('#pw').hasClass("placeholdersjs")) {
				var pw = $("#pw").attr('value');
			} else {
				var $this = $(this);
			}

			//IE9용체크조건
			if (membId == "") {
				alert("아이디를 입력하세요.");
				$("#membId").focus();
				return;
			}
			//IE10용체크조건
			if ($('#membId').val().length == 0) {
				alert("아이디를 입력하세요.");
				$("#membId").focus();
				return;
			}
			//IE9용체크조건
			if (pw == "") {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return;
			}
			//IE10용체크조건
			if ($('#pw').val().length == 0) {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return;
			}

			//아이디저장
			if (frm.save.checked) {
				saveLogin(frm.membId.value);
			} else {
				saveLogin("");
			}

			var user_pw = submitEncryptedForm($("#pw").val());

			$.ajax({
				category : "data",
				data : {
					membId : $("#membId").val(),
					pw : user_pw,
					returnType : "ajax"
				},
				url : '/common/SFSLI0101_01.do',
				showLoading : true,
				type : 'post',
				success : function(data) {
					if (data.resultCode.toString() == "9999") {
						alert(data.resultMsg.toString());
						count += 1;
						if (count == 5) {
							location.href = "/common/SFSLI0106.do";
						}
					} else if (data.resultCode.toString() == "1111") {
						alert(data.resultMsg.toString());
						location.href = "/agreement/SFAGM0101.do";
					} else if (data.resultCode.toString() == "5555") {
						alert(data.resultMsg.toString());
						location.href = "/common/SFSFD0103.do";
					} else {
						location.href = ".do";
					}
				},
				error : function(code, message, data, textStatus, xhr) {
					alert(code);
				}
			});

		});
		
		/* 돌아가기 버튼 클릭 시 처리 이벤트 */
		$("#homePageBtn").click(function(){
			if (confirm("메인 페이지로 돌아갑니까?")) {
				location.href="/";
			}
		});
	});
</script>
</head>
<body>
	<form class="container" name="loginForm" method="POST" action="/login/loginSuccess">
		<input type="hidden" id="rsaPublicKeyModulus"
			value="">
		<input type="hidden" id="rsaPublicKeyExponent" >
		<div class="text-center">
			<div class="form-group" style="margin-bottom: 8px;">
				<input type="text" id="membId"
					title="아이디 입력" maxlength="20" placeholder="아이디"
					style="width: 370px" name="c_id">
			</div>
			<div>
				<input type="password" id="pw"
					title="비밀번호 입력" placeholder="비밀번호" style="width: 370px; margin-bottom: 8px;" name="c_pwd"
					>
			</div>
			<div style="margin-bottom: 8px;">
				<input type="submit" class="btn btn-success"
					id="btnLogin" style="width: 370px;" value="로그인">
			</div>
			<div>
				<a href="/login/serchId">ID 찾기></a>&nbsp; 
				<a href="/login/serchPw">PW 찾기></a>
			</div>
			<div>
				<p>회원가입을 하시면 이벤트 신청, 미팅룸 예약 등 다양한</p>
				<p>서비스를 이용하실 수 있습니다</p>
			</div>
			<div>
				<a href="/login/join" class="btn btn-default"
				id="btnJoin" style="width: 370px">회원가입</a>
			</div>
		</div>
	</form>
</body>
</html>
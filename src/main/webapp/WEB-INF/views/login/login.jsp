<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
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
	});
=======

<script type="text/javascript">

	$(function() {
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
	});


>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
</script>
</head>
<body>

<<<<<<< HEAD
	<form name="loginForm" method="POST" action="/login/loginSuccess">
		<input type="hidden" id="rsaPublicKeyModulus"
			value="">
		<input type="hidden" id="rsaPublicKeyExponent" >
=======
	<form name="loginForm" method="post" action="">
		<input type="hidden" id="rsaPublicKeyModulus"
			value="">
		<input type="hidden" id="rsaPublicKeyExponent" value="">
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
		<div class="login">
			<h2 class="pageTitle02">로그인</h2>
			<ul class="inputBox">
				<li><input type="text" class="inpText" id="membId"
					title="아이디 입력" maxlength="20" placeholder="아이디"
<<<<<<< HEAD
					style="width: 370px" name="c_id"></li>
				<li><input type="password" class="inpText" id="pw"
					title="비밀번호 입력" placeholder="비밀번호" style="width: 370px" name="c_pwd"
					></li>
				<li><input type="submit" class="btns btnBlack solo bFont17"
					id="btnLogin" value="로그인">
				</li>
=======
					style="width: 370px" value=""></li>
				<li><input type="password" class="inpText" id="pw"
					title="비밀번호 입력" placeholder="비밀번호" style="width: 370px" value=""
					></li>
				<li><a href="login/loginSuccess" class="btns btnBlack solo bFont17"
					id="btnLogin"> <span>로그인</span>
				</a></li>
>>>>>>> e01f1ba7acd5331861412e59ce7a1c5df6833aa4
			</ul>
				<div class="link">
					<a href="/login/serchId" class="btnLink">아이디 찾기</a> 
					<a href="/login/serchPw" class="btnLink">비밀번호 찾기</a>
				</div>
				<!-- link : e -->
			</div>
			<!-- find : e -->
			<p class="btmMsg">
				회원가입을 하시면 라운지 멤버십 신청, 이벤트 신청, 미팅룸 <br>예약 등 다양한 서비스를 이용할 수 있습니다.
			</p>
			<a href="/login/join" class="btns btnLineBlack solo bFont17"
				id="btnJoin"> <span>회원가입</span>
			</a>
	</form>
</body>
</html>
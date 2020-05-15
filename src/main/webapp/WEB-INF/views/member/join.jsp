<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

function checkValue()
{
    if(!document.userInfo.id.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    if(!document.userInfo.password.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.userInfo.password.value != 
    	document.userInfo.passwordcheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
	}
}


// 취소 버튼 클릭시 로그인 화면으로 이동
function goLoginForm() {
    location.href="login.jsp";
}




/* 
$(document).ready(function(){
	// 취소
	$(".cencle").on("click", function(){
		location.href = "/";
	})
	
	$("#submit").on("click", function(){
		if($("#userId").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		
		if($("#userId").val()==""){
            alert("아이디에 공백문자는 사용할 수 없습니다.");
            $("#userId").val('');
            $("#userId").focus();
            return false;
        }
        
        if($("#userId").val()==""){
            alert("아이디에 특수문자는 사용할 수 없습니다.");
            $("#userId").val('');
            $("#userId").focus();
            return false;
        }
		
		if($("#userPw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}
		if($("#userName").val()==""){
			alert("성명을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
		}else if(idChkVal == "Y"){
			$("#regForm").submit();
		}
	});
})

function fn_idChk(){
	$.ajax({
		url : "/member/idChk",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	});
}
$(function (){
	

$("#submit").on("click", function(e){
    //var membName = $.trim($("#membName").val());
    
    var userName = $("#userName").val();           
    var idChk = $("#idChk").val();
    
    if(idChk != "chk"){
        alert("아이디 중복확인을 해주세요.");
        return false;
    }
    
    if($("#userPw").val() == "" || $("#userPw2").val() == ""){
        alert("비밀번호를 입력해주세요.");                
        return false;
    }
    
    if($("#userPw").hasClass("error")){
        alert("비밀번호를 비밀번호 설정 규칙에 맞게 입력해주세요.");
        $("#membPw1").focus();
        return false;
    }
    
    if($("#userPw2").hasClass("error")){
        alert("비밀번호가 일치하지 않습니다.");
        $("#membPw1").val('');
        $("#membPw1").focus();
        return false;
    }
    
    var email = $("#userEmail1").val();
    if($.trim(email).length == 0){
        alert("이메일을 입력해주세요.");
        $("#userEmail1").focus();
        return false;
    }
    
    var emailDomain = $("#userEmail2").val();
    if($.trim(emailDomain).length == 0){
        alert("이메일 도메인을 입력주세요.");
        $("#userEmail2").focus();
        return false;
    }
    
    var tEmail = email + "@" + emailDomain;
    if(!checkEmail(tEmail)){
        alert("이메일을 정확히 입력해주세요.");
        return false;
    }
    
    if(!$("#ck01").is(":checked")){
        alert("회원 이용약관 동의를 선택해주세요."); //회원 이용약관(필수)
        return false;
    }
    if(!$("#ck02").is(":checked")){
        alert("회원가입 개인 정보 수집 이용 및 제공 동의 동의를 선택해주세요."); //회원가입 개인 정보 수집 이용 및 제공 동의(필수)
        return false;
    }

});
 */
</script>
</head>
<body>

	<!-- <form id="joinform" action="/action_page.php">
First name: <input type="text" name="fname"><br>
Last name: <input type="text" name="lname"><br><br>
<input type="button" onclick="myFunction()" value="Submit form">
</form> -->


	<form id="joinform" action="/member/join" method="POST">
		<!-- 아이디 -->
		<div class="form-group">
			<label for="userId">아이디</label> <input type="text"
				class="form-control" id="userId" name="c_id"
				placeholder="한글/영문 6~14자 " required>
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="userPw">비밀번호</label> <input type="password"
				class="form-control" id="userPw" name="c_pwd"
				placeholder="영문/숫자 8~20자" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="userPw2">비밀번호 확인</label> <input type="password"
				class="form-control" id="userPw2" name="userPw2"
				placeholder="Confirm Password" required>
			<div class="check_font" id="pw2_check"></div>
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<label for="userName">이름</label> <input type="text"
				class="form-control" id="userName" name="c_name"
				placeholder="한글/영문 2~20자" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<div class="form-group form-group-sm">
			<label for="userEmail" class="col-sm-2 control-label">회원이메일</label>
			<input type="email"
				class="form-control" name="c_email" id="c_email"
				placeholder="이메일 을 입력해 주세요" required>
			<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
						<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
							<i class="fa fa-envelope"></i>&nbsp;인증
						</button>&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm px-3">
							<i class="fa fa-envelope"></i>&nbsp;확인
						</button>&nbsp; -->
			<div class="check_font" id="email_check"></div>
		</div>
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label> <input
				type="text" class="form-control" id="phone" name="c_phone"
				placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		<div class="agreeList">
			<div class="checkboxWrap">
                <span class="checkStyle on"><input type="checkbox"
                    id="ck01" name="ck01" class="inputCheckbox" checked="checked"></span>
                <label for="ck01">회원 이용약관</label> <a href="/policy/policyService" class="btnLink"
                    id="ck01Detail">내용보기</a>
            </div>
            <div class="checkboxWrap">
                <span class="checkStyle on"><input type="checkbox"
                    id="ck02" name="ck02" class="inputCheckbox" checked="checked"></span>
                <label for="ck02">회원가입 개인 정보 수집 이용 및 제공 동의</label> <a href="/policy/policyPrivacy"
                    class="btnLink" id="ck02Detail">내용보기</a>
            </div>
		</div>

		<div class="text-center">
			<input type="submit" class="btn btn-primary px-3" id="reg_submit"
				value="가입하기">
			<a class="btn btn-danger px-3" href="http://localhost:8080/"> <i
				class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
			</a>&emsp;&emsp;
			<!-- <button class="btn btn-primary px-3" id="reg_submit" >
				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
			</button> -->
		</div>
	</form>

	<!-- <div class="btnArea space40">
				<a href="/member/join" class="btns btnBlack bFont17" id="submit">
					<span>회원가입</span>
				</a>
			</div> -->
</body>
</html>
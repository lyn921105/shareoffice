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

		// 확인 버튼 클릭 시 메소드 실행
		$("#memberSubmitBtn").click(function() {

			var x = String($("#c_disabled").val())
			var y = '${avo.c_disabled}'

			if (x != y) {

				$("#form").attr({
					"method" : "GET",
					"action" : "/adminMember/disabled"
				})
				$("#form").submit();
				alert("성공!")
			}
			opener.location.reload();
			window.close();
		})
	})
</script>
<style type="text/css">
th {
text-align:left;
}
</style>
</head>
<body>
	<h2>회원 상세 페이지</h2>
	<hr/>
	<form id="form">
		<input type="hidden" value="${avo.c_id }" name="c_id">
		<table>
			<tr>
				<th>ID</th>
				<td>${avo.c_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${avo.c_name }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${avo.c_email }</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${avo.c_regdate }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${avo.c_phone }</td>
			</tr>
			<tr>
				<th>구분</th>
				<td><select name="c_disabled" id="c_disabled">
						<c:forEach var="i" begin="0" end="1">
							<c:choose>
								<c:when test="${i eq 1 }">
									<c:set var="status" value="가입" />
								</c:when>
								<c:otherwise>
									<c:set var="status" value="탈퇴" />
								</c:otherwise>
							</c:choose>
							<c:if test="${i eq avo.c_disabled }">
								<option value=${i } selected>${status }</option>
							</c:if>
							<c:if test="${i ne avo.c_disabled }">
								<option value=${i }>${status }</option>
							</c:if>
						</c:forEach>
				</select></td>

			</tr>
		</table>
	</form>
	<input type="submit" id="memberSubmitBtn" value="확인">
</body>
</html>
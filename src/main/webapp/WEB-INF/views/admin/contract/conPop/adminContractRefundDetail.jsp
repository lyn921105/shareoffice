<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		function parse(str) {
			var y = str.substr(0, 4);
			var m = str.substr(5, 2);
			var d = str.substr(8, 2);

			return new Date(y, m, d);
		}
		

		var nowDate = new Date();
		
		// 사용 일수 계산
		var reservedate = parse('${avo.r_reservedate}')
		var enddate = parse('${avo.r_enddate}')
		var regdate = parse('${avo.r_regdate}')
		
		var totaldate = (enddate - reservedate)/1000/60/60/24;
		var usedate = (regdate - reservedate)/1000/60/60/24;
		
		if (usedate < 0){
			$("#usedate").html("미사용")
		} else {
			$("#usedate").html(usedate + "/" + totaldate + "일")
		}
		
		// 금액 계산식
		// (총 일수 - 사용 일수)/총 일수 * 100(%)
		// 예약 전 / 계약 중으로 나뉨
		var refundprice = 0;
		
		// 예약 전
		var b4reserve = (reservedate - regdate)/1000/60/60/24;
		
		var refundrate = (totaldate - usedate)/totaldate;
		console.log(refundrate)
		
		if (b4reserve > 7) {
			refundprice = ${avo.r_price};
			$("#condition").html("전액 환불")
			$("#calculate").html("-")
		} else if (b4reserve >= 0) {
			refundprice = ${avo.r_price}*0.9;
			$("#condition").html("90% 환불")
			$("#calculate").html("${avo.r_price}" + " * " + "90%")
			
		} else {
			refundprice = ${avo.r_price}*refundrate*0.9;
			$("#condition").html("사용 일수 차감 후 90% 환불")
			$("#calculate").html("${avo.r_price}" + " * " + refundrate + " (%) " + " * " + "90%")
		
		}
		
		// 소수점 버림
		refundprice = Math.floor(refundprice*0.1)*10;
		
			$("#refundprice").html(refundprice + " 원")
			
			$("#r_refundprice").val(refundprice)
			
			
		// 환불 승인 업데이트 메소드
		$("#refundUpdateBtn").click(function(){
			var result = confirm("환불 신청을 승인하시겠습니까?");
			if (result){
				$("#form").attr({
					"method" : "POST",
					"action" : "/adminContract/refundUpdate"
				})
				$("#form").submit();
				window.opener.location.reload();
				window.close();
			}
		})
		
		// 창 닫기
		$("#outBtn").click(function(){
			window.close();
		})
		
		

	})
</script>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>
<body>
	<form id="form">
		<input type="hidden" name="r_num" value="${avo.r_num }"> <input
			type="hidden" id="r_refundprice" name="r_refundprice" value="">
	</form>
	<h2>환불 상세</h2>
	<hr />
	<table class="table table-striped table-hover">
		<tr>
			<th>입주사명</th>
			<td>${avo.r_company }</td>
			<th>입주일</th>
			<td>${avo.r_reservedate }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${avo.r_phone }</td>
			<th>만료일</th>
			<td>${avo.r_enddate }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${avo.c_id }</td>
			<th>신청일</th>
			<td>${avo.r_regdate }</td>
		</tr>
		<tr>
			<th>이용호실</th>
			<td>${avo.r_floor }${avo.r_room }<span> 호실</span></td>
			<th>환불 상태</th>
			<c:choose>
				<c:when test="${avo.r_status eq 2 }">
					<td>환불 신청</td>
				</c:when>
				<c:otherwise>
					<td>환불 완료</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>이용인원</th>
			<td>${avo.r_member }<span> 명</span></td>
		</tr>
		<tr>
			<th>기간</th>
			<td>${avo.r_reservedate }~${avo.r_enddate }</td>
		</tr>
		<tr>
			<th>환불계좌</th>
			<td>110-123-456</td>
			<th>예금주</th>
			<td>이영남(기업은행)</td>
		</tr>
		<tr>
			<th colspan="5">환불 요청</th>
		</tr>
		<tr>
			<th>사용 일수</th>
			<th>입금액</th>
			<th>환불 요청일</th>
			<th>환불일자</th>
		</tr>
		<tr>
			<td id="usedate"></td>
			<td>${avo.r_price }<span> 원</span></td>
			<td>${avo.r_regdate }</td>
			<c:choose>
				<c:when test="${avo.r_status eq 2 }">
					<td>-</td>
				</c:when>
				<c:otherwise>
					<td>${avo.r_refunddate }</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th colspan="5" id="condition"></th>
		</tr>
		<tr>
			<th colspan="5" id="calculate"></th>
		<tr>
			<th colspan="5" id="refundprice"></th>
		</tr>
	</table>
	<div class="text-center">
	<input type="button" id="outBtn" value="확인" class="btn" />
	<c:if test="${avo.r_status eq 2 }">
		<input type="button" id="refundUpdateBtn" value="승인" class="btn" />
	</c:if>
	</div>
	

	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 안내문</title>
<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		$("#close").click(function(){
			window.close();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h3>예약 안내문</h3>
		<p>1. 예약은 10일전부터 가능하고, 예약 가능한 날짜로부터 최대 1년까지 가능합니다</p>
		<p>2. 예약금은 예약 시점부로부터 24시간이내에 입금이 확인이 되어야 예약이 완료됩니다</p>
		<p>3. 입주 8일전까지 전액 환불</p>
		<p>4. 입주 7일전 ~ 당일 90% 환불 (예약일이 7일 이내일 경우 24시간 내에 전액 환불 가능)</p>
		<p>5. 입주 후 이용날짜 50% 이상 환불 불가</p>
		<p>6. 50% 미만의 경우 예약금에서 이용날짜만큼 차감 후 90% 환급</p>
		<p>7. 계약종료시 시설점검을 받고 지급받은 키를 반납하셔야 합니다</p>
		<p>8. 예약사항 변경은 마이페이지 -> 예약정보에서 요청하실 수 있으며, 변동사항의 차액부분만 계산합니다. 입주날부터는 변경하실 수 없고, 환불정책에 따른 환불만 가능하니 주의하시기 바랍니다</p>
		<p>9. 파손 및 분실시 전액 고객 부담</p>
	</div>
	<div class="text-center">
		<input type="button" id="close" class="btn btn-default text-center" value="닫기">	
	</div>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>
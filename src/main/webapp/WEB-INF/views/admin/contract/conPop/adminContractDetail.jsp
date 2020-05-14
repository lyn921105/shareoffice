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
<style>
table, th, tr, td{
text-align : center;
}
</style>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 이용 상태 설정
		var str = "${avo.r_reservedate}";
		

		function parse(str) {
			var y = str.substr(0, 4);
			var m = str.substr(5, 2);
			var d = str.substr(8, 2);

			return new Date(y, m-1, d);
		}
		var resDate = parse(str);
		var nowDate = new Date();

		if (resDate > nowDate) {
			$("#stat").html('입주대기')
		} else {
			$("#stat").html('이용중')
		}
		
		// 기간 계산 (퇴실일 - 입주일)
		var res = "${avo.r_reservedate}";
		var end = "${avo.r_enddate}";
		
		function subst(bstr) {
			var m = bstr.substr(5, 2);

			return m;
		}
		var resDate = Number(subst(res));
		var endDate = Number(subst(end));
		
		if(endDate < resDate){
			endDate += 12;
		}
		
		var month = endDate - resDate
		
		$("#term").html(month + "개월")
		
		
		
		// 확인 버튼 클릭 시
		$("#commitBtn").click(function(){
			window.close();
		})
	})
</script>
</head>
<body>
<h2>계약 정보</h2>
<hr/>
<table class="table table-striped table-hover">
	<tr>
		<th>입주사명</th>
		<td>${avo.r_company }</td>
		<th>입주일</th>
		<td>${avo.r_reservedate }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${avo.r_phone }</td>
		<th>퇴주일</th>
		<td>${avo.r_enddate }</td>
	</tr>
	<tr>
		<th>이용호실</th>
		<td>${avo.r_floor }${avo.r_room }<span> 호실</span></td>
		<th>이용상태</th>
		<td id="stat"></td>
	</tr>
	<tr>
		<th>이용인원</th>
		<td>${avo.r_member }<span> 명</span></td>
	</tr>
	<tr>
		<th>기간</th>
		<td id="term"></td>
	</tr>
	<tr>
		<th>이용금액</th>
		<td>${avo.r_price }</td>
	</tr>
	<tr>
		<th colspan="4">입금 정보</th>
	</tr>
	<tr>
		<th colspan="2">입금액</th>
		<th colspan="2">입금 확인일</th>
	</tr>
	<tr>
		<td colspan="2">${avo.r_price }<span> 원</span></td>
		<td colspan="2">${avo.r_regdate }</td>
	</tr>
</table>
<div class="text-center">
<input type="button" value="확인" id="commitBtn" class="btn">
</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>

</html>
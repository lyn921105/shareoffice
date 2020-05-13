<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
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
		
		$("#search").val("<c:out value='${data.search}'/>");

		if ($("#search").val == '0') {
			$("#d0").attr('selected', 'selected');
		} else if ($("#search").val() == '1') {
			$("#d1").attr('selected', 'selected');
		} else if ($("#search").val() == '2') {
			$("#d2").attr('selected', 'selected');
		}

		// 회원 리스트 조건 변경 메소드
		$("#division").change(function() {

			var division = $(this).val()

			$("#search").val(division);

			goPage(1);
		})


		// 입주일 비교해서 계약 각각의 상태 설정
		<c:forEach items="${contractList}" var="item" varStatus="status">

		var res = "${contractList[status.index].r_reservedate}";

		function parse(str) {
			var y = str.substr(0, 4);
			var m = str.substr(5, 2);
			var d = str.substr(8, 2);

			return new Date(y, m-1, d);
		}
		
		var resDate = parse(res);
		var nowDate = new Date();

		if (resDate > nowDate) {
			$("#stat" + "${status.index}").html('입주대기')
		} else {
			$("#stat" + "${status.index}").html('이용중')
		}
		</c:forEach>

		// 계약 상세 정보 팝업 페이지 이동
		$(".list").click(
				function() {

					var r_num = $(this).attr("data-num");

					var openDetail = window.open("/adminContract/detail?r_num="
							+ r_num, "contractList", "width=500, height=700");
					openDetail.focus();

				})

	})
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한
		실질적인 처리 함수 */
	function goPage(page) {
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/adminContract/main"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<h2>계약 현황</h2>
	<hr />
	<select id="division">
		<option id="d0" value="0">전체</option>
		<option id="d1" value="1">입주대기</option>
		<option id="d2" value="2">이용중</option>
	</select>
	<br />
	<!-- 검색 기능 시작 -->
	<div id="searchfunction">
		<form id="f_search" name="f_search">
			<input type="hidden" id="search" name="search"
				value="${data.search }"> <input type="hidden" id="page"
				name="page" value="${data.page }"> <input type="hidden"
				id="pageSize" name="pageSize" value="10">
		</form>
	</div>
	<!-- 검색 기능 종료 -->

	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>회사명</th>
			<th>연락처</th>
			<th>인원</th>
			<th>이용호실</th>
			<th>입주일</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${contractList }" var="item" varStatus="status">
			<tr class="list" data-num="${item.r_num }">
				<td>${count - status.index }</td>
				<td class="company">${item.r_company }</td>
				<td class="member">${item.r_phone }</td>
				<td>${item.r_member }<span> 명</span></td>
				<td>${item.r_floor }${item.r_room }<span> 호실</span></td>
				<td>${item.r_reservedate }</td>
				<td id="stat${status.index }" class="stat"></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 리스트 종료 -->
	<!-- 페이지 네비게이션 시작 -->
	<div id="memberPage" style="text-align: center;">
		<tag:paging page="${param.page }" total="${total }" list_size="10" />
	</div>
	<!-- 페이지 네비게이션 종료 -->

	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>
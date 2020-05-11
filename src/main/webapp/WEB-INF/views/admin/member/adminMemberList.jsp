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
<script type="text/javascript" src="/resources/include/js/common.js"></script>
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

		/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로
		유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		// 회원 상세 정보 팝업 페이지 이동
		$(".list").click(
				function() {

					var c_id = $(this).children("#c_id").html();

					var openDetail = window.open("/adminMember/detail?c_id="
							+ c_id, "memberList", "width=500, height=700");
					openDetail.focus();
				})

		// 회원 이름으로 검색 메소드
		$("#memberSearch").click(function() {
			if(!chkSubmit($("#keyword"), "검색할 이름을")) {
				return;
			} else {
				goPage(1);
			}
		})
	})

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한
		실질적인 처리 함수 */
	function goPage(page) {
		/* $("#keyword").val(""); */
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/adminMember/list"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<h2>회원 관리</h2>
	<hr />
	<select id="division">
		<option id="d0" value="0">전체</option>
		<option id="d1" value="1">탈퇴</option>
		<option id="d2" value="2">가입</option>
	</select>
	<!-- 검색 기능 시작 -->
	<div id="searchfunction">
		<form id="f_search" name="f_search">
			<input type="hidden" id="search" name="search"
				value="${data.search }"> <input type="hidden" id="page"
				name="page" value="${data.page }"> <input type="hidden"
				id="pageSize" name="pageSize" value="10">
				<div class="input-group" style="width : 200px">
				<input type="text" name="keyword" id="keyword" class="form-control" placeholder="이름을 입력하세요">
				<div class="input-group-btn">
				<button type="button" class="btn btn-default" id="memberSearch">
				<i class="glyphicon glyphicon-search"></i>
				</button>
				</div>
				</div>
		</form>
	</div>
	<!-- 검색 기능 종료 -->

	<br />
	<!-- 리스트 시작 -->
	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>가입일</th>
			<th>구분</th>
		</tr>
		<c:forEach items="${memberList }" var="item" varStatus="status">
			<form class="mem">
				<input type="hidden" name="c_id" value="${item.c_id }" />
			</form>
			<tr class="list">
				<td>${count - status.index }</td>
				<td class="name">${item.c_name }</td>
				<td id="c_id">${item.c_id }</td>
				<td>${item.c_regdate }</td>
				<td class="stat"><c:choose>
						<c:when test="${item.c_disabled eq 1 }">
							<c:set var="status" value="가입" />
								${status }
							</c:when>
						<c:otherwise>
							<c:set var="status" value="탈퇴" />
								${status }
							</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 리스트 종료 -->
	<!-- 페이지 네비게이션 시작 -->
	<div id="memberPage" style="text-align:center;">
		<tag:paging page="${param.page }" total="${total }" list_size="10" />
	</div>
	<!-- 페이지 네비게이션 종료 -->

	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>
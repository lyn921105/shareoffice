<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글목록</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}' />";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

			if ($("#search").val() != 'q_content') {
				//:contains()는 특정 텍스트를 포함한 요소반환
				if ($("#search").val() == 'q_title') {
					value = "#list tr td.goDetail";
				}
				else if ($("#search").val() == 'c_id') {
					value = "#list tr td.name";
				}
				$(value + ":contains('" + word + "')").each(function() {
					var regex = new RegExp(word, 'gi');
					$(this).html($(this).text().replace(regex, "<span class='required'>" + word	+ "</span>"));
				});
			}
		}

		/* 글쓰기 버튼 클릭 시 처리 이벤트 */
		$("#insertFormBtn").click(function() {
			location.href = "/qna/qnaWriteForm";
		});

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			$("#keyword").val("");
			$("#keyword").focus();
		});

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if (!chkSubmit($('#keyword'), "검색어를")) {
				return;
			}
			goPage(1);
		});

		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {
			var q_num = $(this).parents("tr").attr("data-num"); // 글 번호
			var login_id = '${loginSuccess}'; // 로그인 아이디
			var write_id = $(this).siblings(".c_id").val(); // 작성자 아이디
			
			$("#q_num").val(q_num);
			
			if (write_id == login_id) {
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/qna/qnaDetail"
				});
				$("#detailForm").submit();
			} else {
				alert("본인이 작성한 글과 답변만 열람할 수 있습니다.");
				return;
			}
		});
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을위한 실질적인 처리 함수 */
	function goPage(page) {
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/qna/qnaList"
		})
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<!-- 비로그인시 처리 -->
	<script type="text/javascript">
		<c:if test="${empty loginSuccess}">
			alert("로그인이 필요합니다");
			location.href="/login/login";
		</c:if>
	</script>
	
	<div class="container">
		<div>
			<h3>Q&A 글목록</h3>
		</div>
		<!-- 상세 페이지 이동을 위한 FORM -->
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="q_num" id="q_num">
			<input type="hidden" name="page" value="${data.page}">
			<input type="hidden" id="pageSize" name="pageSize" value="10">
		</form>

		<!-- 검색 기능과 페이징 -->
		<div class="pull-right">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<table summary="검색">
					<tr>
						<td id="btd1"><label>검색조건</label> <select id="search"
							name="search">
								<option value="q_title">제목</option>
								<option value="c_id">작성자</option>
						</select>
							<div class="input-group">
								<input type="text" name="keyword" id="keyword"
									placeholder="검색어를 입력하세요" class="form-control" />
								<div class="input-group-btn">
									<button type="button" class="btn btn-default" id="searchData">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div></td>
					</tr>

				</table>
			</form>
		</div>

		<!-- 글 목록 -->
		<div id="qnaList">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>문의상태</th>
					</tr>
				</thead>

				<tbody id="list">
					<c:choose>
						<c:when test="${not empty qnaList}">
							<c:forEach var="qna" items="${qnaList}" varStatus="status">
								<tr data-num="${qna.q_num}">
									<td>${count - status.index}</td>
									<td class="goDetail tal">${qna.q_title}</td>
									<td>${qna.q_regdate}</td>
									<c:choose>
										<c:when test="${not empty qna.a_id}">
											<td>${qna.a_id}</td>
											<input type="hidden" class="c_id" name="c_id" value="${qna.c_id}">
										</c:when>
										<c:otherwise>
											<td>${qna.c_id}</td>
											<input type="hidden" class="c_id" name="c_id" value="${qna.c_id}">
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${qna.q_state eq 1}">
											<td>문의</td>
										</c:when>
										<c:when test="${qna.q_state eq 2}">
											<td>문의완료</td>
										</c:when>
										<c:otherwise>
											<td>답변완료</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<!-- 글쓰기 버튼 -->
		<div>
			<input type="button" class="btn btn-default pull-right" value="문의하기"
				id="insertFormBtn">
		</div>

		<!-- 페이징 -->
		<div class="text-center">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div>
	</div>
</body>
</html>
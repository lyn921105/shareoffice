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
		/* 
		$(".list").css("background", "green")
		$('.name:contains(아디이)').css("background", "red") */
		
		// 회원 리스트 조건 변경 메소드
		$("#division").change(function() {

			var division = $(this).val()
			
			
			if(division == 2){// 구분이 '전체' 일 경우
				history.go(0);
				
			} else if(division == 0){// 구분이 '탈퇴' 일 경우
				
				$(".stat:contains('가입')").parent().css("display", "none");
				$(".stat:contains('탈퇴')").parent().css("display", "");
			} else {// 구분이 '가입' 일 경우
				$(".stat:contains('탈퇴')").parent().css("display", "none");
				$(".stat:contains('가입')").parent().css("display", "");
			}
			
		})

		// 회원 상세 정보 팝업 페이지 이동
		$(".member").click(
				function() {

					var c_id = $(this).html();

					var openDetail = window.open("/adminMember/detail?c_id="
							+ c_id, "memberList", "width=500, height=700");
					openDetail.focus();

				})

		// 회원 이름으로 검색 메소드
		$("#memberSearch").click(function() {
			var c_name = $("#searchName").val();
			

			if (c_name != "") {
				$(".name").not('.name:contains('+c_name+')').parent().css("display", "none");
			}
		})

	})
</script>
</head>
<body>
	<h2>회원 관리</h2>
	<select id="division">
		<option value="2">전체</option>
		<option value="0">탈퇴</option>
		<option value="1">가입</option>
	</select>
	<form>
		<input type="text" id="searchName" placeholder="이름을 입력하세요"> <input
			type="button" id="memberSearch" value="검색" />
	</form>
	<br />
	<table class="table table-striped table-hover">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>가입일</th>
			<th>구분</th>
		</tr>
		<c:forEach items="${memberList }" var="item">
			<form class="mem">
				<input type="hidden" name="c_id" value="${item.c_id }" />
			</form>
			<tr class="list">
				<td class="name">${item.c_name }</td>
				<td class="member">${item.c_id }</td>
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

	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>
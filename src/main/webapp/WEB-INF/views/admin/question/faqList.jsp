<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록/수정</title>
<!-- CSS -->
<link href="/resources/include/css/common.css" rel="stylesheet">
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.from.min.js"></script>

<script type="text/javascript">
	var f_num = $(this).parents("tr").attr("data-num");
	$("#f_num").val(f_num)

	$(function() {
		//등록 버튼 클릭 시 이벤트
		$("#faq_ok").click(function() {
			if ($('#f_question') == "" || $('#f_question') == null) {
				alert("faq 질문을 작성해주세요.");
				$("#f_question").focus();
			} else if ($("#f_answer") == "" || $("#f_answer") == null) {
				alert("faq 답변을 작성해주세요.");
				$("#f_answer").focus();
			} else {
				$("#faqWriteForm").attr({
					"method" : "POST",
					"action" : "/adminQuestion/faqInsert"
				});

				$("#faqWriteForm").submit();
			}
		})
		
		//수정 버튼 클릭 시 수정 폼 출력
		$(".faqUpdate").click(function(){
			var f_num=$(this).parents("tr").attr("data-num");
			$("#f_num").val(f_num); //클릭한 글의 글 번호 가져오기
			
			var f_question=$(this).parents("tr").children().eq(1);
			
			//수정 폼 태그
			var upTag="<tr class=tac data-num="+f_num+">";
			upTag+="<td><input type=button value=수정완료 class=update_ok>";
			upTag+="<input type=button value=취소 class=cancle>";
			upTag+="<input type=hidden name=f_num value="+f_num+">"
			upTag+="<div class=f_question>"+f_question+"</div>"
			
		 
		})
		
	})

</script>
<body>
	<div class="container">
		<div id="button" align="right">
			<input type="button" id="faq_ok" value="등록" class="btn">
		</div>
		<form id="faqWriteForm" name="faqWriteForm">
			<table id="faqform">
				<tr>
					<td class="fq"><input type="text" name="f_question"
						id="f_question" maxlength="100"></td>
				</tr>
				<tr>
					<td class="fa"><textarea name="f_answer" id="f_qnswer"
							maxlength="1000"></textarea></td>
				</tr>
			</table>
		</form>

		<form id="faqListForm">
			<div class="faqList">
				<br> <br>
				<table summary="FAQ 리스트">
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty faqList }">
								<c:forEach var="faq" items="${faqList }" varStatus="status">
									<tr class="tac" data-num="${faq.f_num }">
										<td><input type="button" value="수정" class="faqUpdate"><a href="/adminQuestion/faqDelete?f_num=${faq.f_num }">삭제</a>
											<input type="hidden" name="f_num" value="${faq.f_num }">
											<div class="question">${faq.f_question }</div>
											<div class="answer">${faq.f_answer }</div></td>
									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tag">등록된 faq가 없습니다. faq를 작성해주세요.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
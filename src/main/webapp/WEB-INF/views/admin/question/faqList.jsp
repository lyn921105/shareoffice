<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>FAQ 등록/수정</title>
<!-- CSS -->
<style type="text/css">
#f_question {
	width: 630px;
	height: 30px;
}

#f_answer, #faqBtn, input[type=text], textarea {
	width: 630px;
}

.question {
	width: 630px;
	height: 30px;
	background-color: #C3C3C3;
	border-radius: 5px;
	padding: 5px;
}

.answer {
	width: 630px;
	margin: 10px;
}

.button_group {
	float: right;
}

.faqUpdate, .faqDelete {
	background-color: rgba(0, 0, 0, 0);
	border-color: rgba(0, 0, 0, 0);
}
</style>

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

		//등록 버튼 클릭 시 이벤트
		$("#faq_ok").click(function() {
			//입력 값 체크
			if(!chkData("#f_question", "faq 질문을")){
				return;
			} else if(!chkData("#f_answer", "faq 답변을")){
				return;
			} else{
				//내용이 모두 작성 되었을 때 실행
				$.ajax({
					url:"/adminQuestion/faqInsert",
					type:"post",
					header:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType:"text",
					data:$("#faqWriteForm").serialize(),
					success:function(){
						location.href="/adminQuestion/faq";
					}
					
				})
			}
		});
		
		//수정 버튼 클릭 시 수정 폼 출력
		$(".faqUpdate").click(function(){
			var f_row=$(this).parents("tr");
			var f_num=f_row.data("num");
			var f_question=f_row.children("td").children(".question").data("fq");
			var f_answer=f_row.children("td").children(".answer").data("fa");
			
			var htmls="";
			htmls+='<td class="faqRow_'+f_num+'">';
			htmls+='<div id="faqBtn"><span class="button_group">';
			htmls+='<input type="button" value="저장" id="edit_ok" onclick=faqUpdate()>';
			htmls+='<input type="button" value="취소" id="edit_cancle" onclick="cancle()"></span><br>';
			htmls+='<form id="faqEditForm">';
			htmls+='<input type="hidden" value='+f_num+' name="f_num" id="f_num">';
			htmls+='<input type="text" maxlength="100" id="f_question" name="f_question" value="'+f_question+'"><br>';
			htmls+='<textarea maxlength="1000" id="f_answer" name="f_answer">'+f_answer+'</textarea>';
			htmls+='</form><br></td>';
			
			//기존 입력영역 닫기
			$("#faqwrite").html("");
			
			//다른 수정버튼과 삭제 버튼 감추기
			$(".faqUpdate").hide();
			$(".faqDelete").hide();
			$("#faq_ok").hide();
			
			$('.faqRow_'+f_num).replaceWith(htmls);
			
			
		});
		
	});
	
	function cancle(){
		location.href="/adminQuestion/faq";
	};
	
	function faqDelete(f_num){
		$.ajax({
			url:"/adminQuestion/faqDelete?f_num="+f_num,
		data:{"f_num":f_num},
		type:"POST",
		dataType:"text",
		success:function(result){
			location.href="/adminQuestion/faq";
		}
		})
	}
	
	function faqUpdate(){
	if(!chkData("#f_question", "faq 질문을")){
			return;
		} else if(!chkData("#f_answer", "faq 답변을")){
			return;
		} else{
			
			 $("#faqEditForm").attr({
				"method":"POST",
				"action":"/adminQuestion/faqUpdate"
			});
			
			$("#faqEditForm").submit(); 
		}
	}

</script>
<body>
	<h2>FAQ</h2>
	<hr />
	<div id="faqBtn" align="right">
		<input type="button" id="faq_ok" value="등록" class="btn">
	</div>
	<form id="faqWriteForm" name="faqWriteForm">
		<div id="faqwrite">
			<span class="fq"><input type="text" name="f_question"
				id="f_question" maxlength="100"><br> <textarea
					name="f_answer" id="f_answer" maxlength="1000" rows="5"></textarea>
			</span>
		</div>
	</form>
	<div id="faqList">
		<br> <br>
		<div id="list">
			<table>
				<tbody>
					<c:choose>
						<c:when test="${not empty faqList }">
							<c:forEach var="faq" items="${faqList }" varStatus="status">
								<tr class="faqList" data-num="${faq.f_num }">
									<td class="faqRow_${faq.f_num }">
										<div class="question" data-fq="${faq.f_question }">
											<p class="ft">${faq.f_question }
												<span class="button_group"><input type="button"
													value="수정" class="faqUpdate"> <input type="button"
													value="삭제" class="faqDelete"
													onclick="faqDelete(${faq.f_num})"></span>
										</div>
										<div class="answer" data-fa="${faq.f_answer }">${faq.f_answer }</div>
										<br>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<span>등록된 faq가 없습니다. faq를 작성해주세요.</span>
							</div>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</html>
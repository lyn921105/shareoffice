<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
</head>
<body>
	<div>
		<h2 class="col-xs-4">자주 묻는 질문</h2>
		<div class="accordion col-xs-8">
			<c:choose>
				<c:when test="${not empty faqList}">
					<c:forEach var="faq" items="${faqList}" varStatus="status">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="panel-title"><a data-toggle="collapse"
									data-parent="#accordion" href="#collapse${status.index}">Q.
									${faq.f_question}</a></h4>
							</div>
							<div id="collapse${status.index}" class="panel-collapse collapse">
								<div class="panel-body">A. ${faq.f_answer}</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
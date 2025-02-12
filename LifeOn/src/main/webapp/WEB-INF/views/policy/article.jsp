<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/forms.css"
	type="text/css">

<style type="text/css">
.body-title {
	width: 80%;
	max-width: 900px;
	margin: auto;
	margin-top: 40px;
}

.board-article {
	width: 80%;
	max-width: 900px;
	margin: auto;
}

.table-borderless {
	width: 80%;
	max-width: 900px;
	margin: auto;
}

.form-header {
	width: 80%;
	max-width: 900px;
	margin: auto;
}

.bold {
	color: #006AFF;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	</header>

	<main class="d-flex flex-column min-vh-100 align-items-center"
		style="padding-top: 66px;">
		<div class="container">
			<div class="body-container">
				<div class="body-title">
					<h3>
						<i class="bi bi-app"></i> 정책정보
					</h3>
				</div>

				<div class="body-main">
					<table class="table board-article">
						<thead>
							<tr>
								<td colspan="2" align="center">${dto.subject}</td>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td width="50%">이름 : ${dto.nickname}</td>
								<td align="right">${dto.reg_date} | ${dto.hitcount}</td>
							</tr>

							<tr>
								<td colspan="2" valign="top" height="200">${dto.content}<br />
									<c:if test="${not empty dto.ssfname}">
										<img src="${pageContext.request.contextPath}/uploads/policy/${dto.ssfname}"
											alt="${dto.cpfname}"
											style="max-width: 100%; height: auto;" />
									</c:if>
								</td>
							</tr>

							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button"
										class="btn btn-outline-primary btnSendBoardLike" title="좋아요">
										<i class="bi bi-suit-heart"></i>&nbsp;&nbsp; <span
											id="boardLikeCount">좋아요</span>
									</button>
								</td>
							</tr>

							<tr>
								<td colspan="2">이전글 : <a href=""></a>
								</td>
							</tr>

							<tr>
								<td colspan="2">다음글 : <a href=""></a>
								</td>
							</tr>
						</tbody>
					</table>

					<table class="table table-borderless mb-2">
						<tr>
							<td width="50%">
								<button type="button" class="btn">수정</button>
								<button type="button" class="btn">삭제</button>
							</td>
							<td class="text-end">
								<button type="button" class="btn"
									onclick="location.href='${pageContext.request.contextPath}/policy/list';">리스트</button>
							</td>
						</tr>
					</table>

					<div class="reply">
						<form name="replyForm" method="post">
							<div class="form-header">
								<span class="bold">댓글</span> <span> - 타인을 비방하거나 개인정보를
									유출하는 글의 게시를 삼가해 주세요.</span>
							</div>

							<table class="table table-borderless reply-form">
								<tr>
									<td><textarea class="form-control" name="content"></textarea>
									</td>
								</tr>
								<tr>
									<td align="right">
										<button type="button" class="btn btn-light btnSendReply"
											onclick="location.href='${pageContext.request.contextPath}/policy/listReply';">댓글등록</button>
									</td>
								</tr>
							</table>
						</form>
						<div id="listReply"></div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript">
		
	</script>


	<footer class="mt-auto py-2 text-center w-100"
		style="left: 0px; bottom: 0px; background: #F7F9FA;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp" />
</body>
</html>
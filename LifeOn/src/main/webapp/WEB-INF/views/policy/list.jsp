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
	margin-top: 70px;
}

.board-list {
    width: 80%;  /* 테이블 크기를 80%로 조정 */
    max-width: 900px; /* 최대 크기 설정 (예: 900px) */
    margin: auto;  /* 가운데 정렬 */
}

.text-wrap { 
    display: inline-flex;
    max-width: 380px;
    > a {
        flex: 1;  /* 플렉스아이템이 자신의 컨테이너가 차지하는 공간을 맞추기 위해 크기를 키우거나 줄이는 방법 지정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
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
					<div class="row board-list-header">
						<div class="col-auto me-auto dataCount"></div>
						<div class="col-auto">&nbsp;</div>
					</div>

					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="100">번호</th>
								<th>제목</th>
								<th width="100">작성자</th>
								<th width="100">작성일</th>
								<th width="70">조회수</th>
								<th width="50">파일</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>번호</td>
								<td class="left">
									<div class="text-wrap">
										<a href="" class="text-reset">주제</a>
									</div>
								</td>
								<td>작성자</td>
								<td>등록일</td>
								<td>조회수</td>
								<td>파일</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</main>

	<footer class="mt-auto py-2 text-center w-100"
		style="left: 0px; bottom: 0px; background: #F7F9FA;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp" />
</body>
</html>
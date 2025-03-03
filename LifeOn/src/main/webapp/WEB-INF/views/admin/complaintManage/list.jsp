<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<jsp:include page="/WEB-INF/views/admin/layout/headerResources.jsp" />

<style type="text/css">
.body-title {
	margin-bottom: 20px;
}

.body-middle {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.left {
	font-size: 15px;
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

.btn {
	background-color: #006AFF;
	color: white;
}

.table th, .table td {
	text-align: center;
	vertical-align: middle;
}

.table td button {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
}

.report-click {
    cursor: pointer; /* 마우스를 올리면 손 모양으로 변경 */
}

</style>

</head>
<body>

	<header class="container-fluid header-top fixed-top px-4">
		<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
	</header>

	<main>
		<jsp:include page="/WEB-INF/views/admin/layout/left.jsp" />
		<div class="wrapper" style="display: flex; justify-content: center;">
			<div class="body-container" style="width: 900px;">
				<div class="body-title">
					<h3>
						<i class="bi bi-app"></i> 신고관리
					</h3>
				</div>

				<div class="body-main">
					<div class="body-middle">
						<div class="left">
							<p>신고목록 | 전체 ${dataCount}건
						</div>
					</div>

					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="70">번호</th>
								<th width="100">신고일</th>
								<th>신고 내용</th>
								<th width="100">신고자</th>
								<th width="100">처리일</th>
								<th width="100">처리 여부</th>
								<th width="100">상태수정</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="report" items="${list}">
								<tr>
									<td>${report.repnum}</td>
									<td>${report.repd}</td>
									<td class="report-click" data-repan="${report.repan}">${report.repr}</td>
									<td>${report.nickname}</td>
									<td>${report.repsucees}</td>
									<td>${report.repsucboolean}</td>
									<th>
										<button class="btn">변경</button>
									</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<!-- 신고 상세 모달 -->
	<div id="reportModal" class="modal fade" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<!-- 더 넓은 화면을 위해 modal-lg 추가 -->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">🚨 신고된 게시글 상세 내용</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<strong>제목:</strong> <span id="postTitle" class="text-primary"></span>
					</div>
					<div class="mb-3">
						<strong>작성자:</strong> <span id="postAuthor" class="text-secondary"></span>
					</div>
					<div class="mb-3">
						<strong>내용:</strong>
						<div id="postContent" class="border p-3 rounded bg-light"
							style="max-height: 300px; overflow-y: auto;"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="deletePostBtn">🚫
						게시글 삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	

	<div class="pagenavigation" style="display: 80px;">${paging}</div>

	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
	    document.querySelectorAll(".report-click").forEach(td => {
	        td.addEventListener("click", function () {
	            let repan = this.getAttribute("data-repan");
				console.log(repan);
	            if (!repan) {
	                console.error("repan 값이 없음");
	                return;
	            }

	            // AJAX 요청을 보내서 데이터 가져오기
	            fetch("/admin/complaintManage/reportDetail?repan=" + repan)
	                .then(function(response) {
	                    return response.json();
	                })
	                .then(function(data) {
	                    document.getElementById("postTitle").textContent = data.TITLE || "제목 없음";
	                    document.getElementById("postAuthor").textContent = data.AUTHOR || "익명";
	                    document.getElementById("postContent").innerHTML = data.CONTENT || "내용 없음";

	                    var modal = new bootstrap.Modal(document.getElementById("reportModal"));
	                    modal.show();
	                })
	                .catch(function(error) { 
	                    console.error("Error fetching report details:", error);
	                });
	        });
	    });
	});

	
	</script>
	<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />

	<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp" />
</body>
</html>
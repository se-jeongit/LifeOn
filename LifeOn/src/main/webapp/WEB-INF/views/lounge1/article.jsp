<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/free.css" type="text/css">

<style type="text/css">
.body-container {
    width: 80%; /* 필요에 따라 조절 */
    max-width: 1200px; /* 원하는 최대 크기 설정 */
    margin: 0 auto; /* 좌우 여백을 동일하게 설정 */
}

#content img {
    max-width: 100%; /* 부모 요소 크기를 넘지 않도록 */
    height: auto; /* 비율 유지 */
    display: block;
    margin: 0 auto; /* 가운데 정렬 */
}

.freeForm {
    min-height: 600px; /* 게시글 기본 높이 설정 */
}

</style>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge2/layout/menu.jsp"/>
</header>
	
<main class="min-vh-100">
	<!-- 배너 -->
    
	<div class="body-container">
			
			<div class="main_content" style="margin-top: 60px;">
				<div class="freeForm">
					<table class="table board-article">
						<thead>
							<tr>
								<td colspan="2">
									제&emsp;목 : ${dto.subject}
								</td>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td width="50%">
									작성자 : ${dto.nickname}
								</td>
								<td align="right">
									${dto.reg_date} | 조회 ${dto.hitCount}
								</td>
							</tr>
							
							<tr>
    							<td colspan="2" valign="top" height="200" style="border-bottom: none;">
							        <div id="content">
							            <c:out value="${dto.content}" escapeXml="false"/>
							        </div>
							    </td>
							</tr>

				
							<tr>
								<td colspan="2" class="text-center p-3" style="border-bottom: none;">
									<button type="button" class="btn btn-outline-primary btnSendBoardLike" title="즐겨찾기">
										<i class="bi ${isMemberLiked ? 'bi-bookmark-fill' : 'bi-bookmark'}"></i>
										&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span>
									</button>
								</td>
							</tr>
					
							<tr>
								<td colspan="2">
									<c:if test="${not empty dto.ssfname}">
										<p class="border text-secondary my-1 p-2">
											<i class="bi bi-folder2-open"></i> 첨부파일 다운로드 : 
											<a href="${pageContext.request.contextPath}/tip/download?num=${dto.psnum}">${dto.cpfname}</a>
										</p>
									</c:if>
								</td>
							</tr>
							<!--  -
							<tr>
								<td colspan="2">
									이전글 :
									<c:if test="${empty prevDto}">
										이전글이 없습니다.
									</c:if>
									<c:if test="${not empty prevDto}">
										<a href="${pageContext.request.contextPath}/lounge1/${bdtype}/article/${prevDto.psnum}?${query}">${prevDto.subject}</a>
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									다음글 :
									<c:if test="${empty nextDto}">
										다음글이 없습니다.
									</c:if>
									<c:if test="${not empty nextDto}">
										<a href="${pageContext.request.contextPath}/lounge1/${bdtype}/article/${nextDto.psnum}?${query}">${nextDto.subject}</a>
									</c:if>
								</td>
							</tr>
							-->
						</tbody>
					</table>
					<table class="table table-borderless">
						<tr>
							<td class="text-start">
								<c:choose>
									<c:when test="${sessionScope.member.nickName == dto.nickname}">
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/lounge1/${bdtype}/update?num=${dto.num}&page=${page}';">수정</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-light" disabled>수정</button>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade > 1}">
							    		<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
									</c:when>
								</c:choose>
							
							</td>
							<td class="text-end">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/lounge1/${bdtype}?${query}';">리스트</button>
							</td>
						</tr>
					</table>
					
					<div class="reply">
						<form name="replyForm" method="post">
							<div class="form-header" style="text-align: left; padding: 8px 15px;">
								<span class="bold">댓글 ${dto.replyCount}</span>
							</div>
							
							<table class="table table-borderless reply-form">
								<tr>
									<td>
										<textarea class="free-control" name="rpcontent"></textarea>
									</td>
								</tr>
								<tr>
								   <td align="right">
										<button type="button" class="btn btn-light btnSendReply">댓글 등록</button>
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

<c:if test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade > 1}">
	<script type="text/javascript">
		function deleteOk() {
			if (confirm('게시글을 삭제 하시겠습니까?')) {
				let qs = 'psnum=${dto.psnum}&${query}';
				let url = '${pageContext.request.contextPath}/lounge1/${bdtype}/delete?' + qs;
				location.href = url;
			}
		}
	</script>
</c:if>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    let content = document.getElementById('content');
    let data = content.innerHTML;

    // ${pageContext.request.contextPath} 값을 JavaScript 변수로 가져옴
    let contextPath = '${pageContext.request.contextPath}';
    
    // 업로드된 이미지 경로를 올바르게 변환
    data = data.replace(/src="\/uploads\/image\//g, 'src="' + contextPath + '/uploads/image/');

    content.innerHTML = data;
});
</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
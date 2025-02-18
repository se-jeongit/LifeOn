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

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge2/layout/menu.jsp"/>
</header>
	
<main class="min-vh-100">
	<!-- 배너 -->
    <div class="body-title">
    	<h3 style="margin: 0px;">생활의 도움을 받아볼까?</h3>
	</div>
	
	<div class="body-container">
		<div class="body-content">
			<aside class="sidenav">
				<div class="leftBox">
					<p>❤️최신순❤️</p>
					<p>❤️조회순❤️</p>
					<p>❤️즐겨찾기순❤️</p>
					<button type="button" class="btn top_btn" onclick="location.href='<c:url value=''/>'">TOP</button>
				</div>
			</aside>
			
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
								<td width="30%">
									작성자 : ${dto.nickname}
								</td>
								<td align="right" style="font-size: 12px; ">
									<p style="margin: 0;">등록일 : ${dto.reg_date} | 조회 : ${dto.hitCount}</p>
									<c:if test="${not empty dto.uddate}">
									<p style="margin: 0;">최근수정일 : ${dto.uddate}</p>
									</c:if>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" valign="top" height="200" style="border-bottom: none;">
									${dto.content}
								</td>
							</tr>
							
							<tr>
								<td colspan="2" class="text-center p-3" style="border-bottom: none;">
									<button type="button" class="btn btn-outline-primary btnSendBoardLike" title="즐겨찾기"><i class="bi bi-bookmark"${isMemberLiked ? 'bi-bookmark-fill' : 'bi-bookmark'}"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
								</td>
							</tr>
					
							<tr>
								<td colspan="2">
									<c:forEach var="vo" items="${listFile}" varStatus="status">
										<p class="border text-secondary my-1 p-2">
											<i class="bi bi-folder2-open"></i> 첨부파일 다운로드 : 
											<a href="${pageContext.request.contextPath}/lounge2/tip/download?fnum=${vo.fnum}">${vo.cpfname}</a>
											</p>
									</c:forEach>
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									이전글 :
									<c:if test="${empty prevDto}">
										이전글이 없습니다.
									</c:if>
									<c:if test="${not empty prevDto}">
										<a href="${pageContext.request.contextPath}/lounge2/tip/article/${prevDto.psnum}?${query}">${prevDto.subject}</a>
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
										<a href="${pageContext.request.contextPath}/lounge2/tip/article/${nextDto.psnum}?${query}">${nextDto.subject}</a>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					
					<table class="table table-borderless">
						<tr>
							<td class="text-start">
								<c:choose>
									<c:when test="${sessionScope.member.nickName == dto.nickname}">
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/lounge2/tip/update?psnum=${dto.psnum}&page=${page}';">수정</button>
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
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/lounge2/tip?${query}';">리스트</button>
							</td>
						</tr>
					</table>
					
					<div class="reply">
						<form name="replyForm" method="post">
							<div class="form-header">
								<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
							</div>
							
							<table class="table table-borderless reply-form">
								<tr>
									<td>
										<textarea class="free-control" name="content"></textarea>
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

			<aside class="sidebar">
				<div class="rightBox">
					<p>❤️검색순위❤️</p>
				</div>
				<div style="display: flex; align-items: center; margin: 0 20px;">
					<!-- 검색상자 -->
					<input type="search" class="input-group searchBox">
					
					<!-- 검색버튼 -->
				   	<button class="input-group btn mybtn">검색</button>
				</div>
			</aside>
		</div>
	</div>

</main>

<c:if test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade > 1}">
	<script type="text/javascript">
		function deleteOk() {
			if (confirm('게시글을 삭제 하시겠습니까?')) {
				let qs = 'psnum=${dto.psnum}&${query}';
				let url = '${pageContext.request.contextPath}/lounge2/tip/delete?' + qs;
				location.href = url;
			}
		}
	</script>
</c:if>

<script type="text/javascript">
// 게시글 공감 여부
$(function() {
	$('.btnSendBoardLike').click(function() {
		const $i = $(this).find('i');
		let memberLiked = $i.hasClass('bi-bookmark-fill');
		let msg = memberLiked ? '게시글 즐겨찾기를 취소하시겠습니까?' : '게시글 즐겨찾기를 하시겠습니까?';
		
		if (! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/lounge2/tip/insertBoardLike';
		let num = '${dto.num}';
		let params = {num: num, memberLiked: memberLiked};
		
		const fn = function(data) {
			let state = data.state;
			// alert(state);
			
			if (state === "true") {
				if (userLiked) {
					$i.removeClass('bi-bookmark-fill').addClass('bi-bookmark');
				} else {
					$i.removeClass('bi-bookmark').addClass('bi-bookmark-fill');
				}
				
				let count = data.boardLikeCount;
				$('#boardLikeCount').text(count);
				
			} else if (state == "liked") {
				alert('게시글 공감은 한번만 가능합니다.');
			} else {
				alert('게시글 공감 여부 처리가 실패 했습니다.');
			}
		};
		
		ajaxRequest(url, 'post', params, 'json', fn);
	});
});

// 댓글
$(function() {
	listPage(1);
});

// 댓글 리스트
function listPage(page) {
	let url = '${pageContext.request.contextPath}/lounge2/tip/listReply';
	let num = '${dto.num}';
	let params = {num: num, pageNo: page};
	
	const fn = function(data) {
		$('#listReply').html(data);
	};
	
	ajaxRequest(url, 'get', params, 'text', fn);
}

// 삭제, 신고메뉴
$(function() {
	$('.reply').on('click', '.reply-dropdown', function() {	
		const $menu = $(this).next('.reply-menu');
		
		if ($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$('.reply-menu').hide();
			$menu.fadeIn(100);
			
			let pos = $(this).offset();
			$menu.offset({left:pos.left-70, top:pos.top+20});
		}
	});
	
	$('.reply').on('click', function(evt) {
		if ($(evt.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		
		$('.reply-menu').hide();
	});
});

// 댓글 삭제
$(function() {
	$('.reply').on('click', '.deleteReply', function() {	
		if (! confirm('댓글을 삭제하시겠습니까?')) {
			return false;
		}
		
		let replyNum = $(this).attr('data-replyNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/lounge2/tip/deleteReply';
		let params = {replyNum: replyNum, mode: 'reply'};
		
		const fn = function(data) {
			listPage(page);
		};
		
		ajaxRequest(url, 'post', params, 'json', fn);		
	});
});

// 댓글 좋아요 / 싫어요
$(function() {
	// 댓글 좋아요 / 싫어요 등록
	$('.reply').on('click', '.btnSendReplyLike', function() {	
		const $btn = $(this);
		let replyNum = $btn.attr('data-replyNum');
		let replyLike = $btn.attr('data-replyLike');
		let userLiked = $btn.parent('td').attr('data-userLiked');
		
		if (userLiked !== '-1') {
			return false;
		}
		
		let msg = '댓글이 마음에 들지 않습니까 ?';
		if (replyLike === '1') {
			msg = '댓글에 공감하십니까?';
		}
		
		if (! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/lounge2/tip/insertReplyLike';
		let params = {replyNum: replyNum, replyLike: replyLike};
		
		const fn = function(data) {
			let state = data.state;
			if (state === 'true') {
				let likeCount = data.likeCount;
				let disLikeCount = data.disLikeCount;
				
				$btn.parent('td').children().eq(0).find('span').html(likeCount);
				$btn.parent('td').children().eq(1).find('span').html(disLikeCount);
				
				$btn.parent('td').attr('data-userLiked', replyLike);
				if (replyLike === '1') {
					$btn.css('color', '#00f');
				} else {
					$btn.css('color', '#f00');
				}
				
			} else if (state === 'liked') {
				alert('공감 여부는 한번만 가능합니다.');
			} else {
				alert('댓글 공감 여부 처리가 실패했습니다.');
			}
		};
		
		ajaxRequest(url, 'post', params, 'json', fn);
	});
});

</script>


<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
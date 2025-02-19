<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="reply-info">
	<span class="reply-count">댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<table class="table table-borderless">
	<c:forEach var="dto" items="${listReply}">
		<tr class="border table-light">
			<td width="50%">
				<div class="row reply-writer">
					<div class="col-1"><i class="bi bi-person-circle text-muted icon"></i></div>
					<div class="col-auto align-self-center">
						<div class="name">${dto.nickname}</div>
						<div class="date">${dto.rpreg_date}</div>
					</div>
				</div>				
			</td>
			<td width="50%" align="right" class="align-middle">
				<span class="reply-dropdown"><i class="bi bi-three-dots-vertical"></i></span>
				<div class="reply-menu">
					<c:choose>
						<c:when test="${sessionScope.member.nickName == dto.nickname}">
							<div class="deleteReply reply-menu-item" data-replyNum="${dto.rpnum}" data-pageNo="${pageNo}">삭제</div>
							<div class="hideReply reply-menu-item" data-replyNum="${dto.rpnum}"></div>
						</c:when>
						<c:when test="${sessionScope.member.grade >= 1}">
							<div class="deleteReply reply-menu-item" data-replyNum="${dto.rpnum}" data-pageNo="${pageNo}">삭제</div>
							<div class="blockReply reply-menu-item">차단</div>
						</c:when>
						<c:otherwise>
							<div class="notifyReply reply-menu-item">신고</div>
							<div class="blockReply reply-menu-item">차단</div>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" valign="top" class="text-primary">${dto.rpcontent}</td>
		</tr>

		<tr>
			<td align="right" data-userLiked="${dto.memberLiked}">
				<button type="button" class="btn btn-light btnSendReplyLike" data-replyNum="${dto.rpnum}" data-replyLike="1" title="좋아요" style="color:${dto.memberLiked==1?'blue':'black'};"><i class="bi bi-hand-thumbs-up"></i> <span>${dto.likeCount}</span></button>
				<button type="button" class="btn btn-light btnSendReplyLike" data-replyNum="${dto.rpnum}" data-replyLike="0" title="싫어요" style="color:${dto.memberLiked==0?'red':'black'};"><i class="bi bi-hand-thumbs-down"></i> <span>${dto.disLikeCount}</span></button>	        
			</td>
		</tr>
	
	</c:forEach>
</table>

<div class="page-navigation">
	${paging}
</div>			

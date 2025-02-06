<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>


<div class="reply-info">
	<span class="reply-count">댓글 00개</span> <span class="reply-count">목록,
		00/00 페이지</span>
</div>

<c:choose>
	<c:when test="${empty replyList}">
		<!-- 댓글이 없을 때 -->
		<div class="text-center p-3 text-mute">등록된 댓글이 없습니다.</div>
	</c:when>
	<c:otherwise>
		<table class="table table-borderless">
			<tr class="border table-light">
				<td width="50%">
					<div class="row reply-writer">
						<div class="col-1">
							<i class="bi bi-parson-circle text-muted icon"></i>
						</div>
						<div class="col-auto align-self-center">
							<div class="name">이름</div>
							<div class="date">등록일</div>
						</div>
					</div>
				</td>
				<td width="50%" align="right" class="align-middle"><span
					class="reply-dropdown"><i class="bi bi-three-dots-vertical"></i></span>
					<div class="reply-menu">
						<div class="deleteReply reply-menu-item">삭제</div>
					</div></td>
			</tr>
			<tr>
				<td colspan="2" valign="top">내용</td>
			</tr>

			<tr>
				<td>
					<button type="button" class="btn btn-light btnReplyAnswerLayout">답글</button>
				</td>
				<td align="right">
					<button type="button" class="btn btn-light btnSendReplyLike">
						<i class="bi bi-hand-thumbs-up"></i><span>좋아요</span>
					</button>
					<button type="button" class="btn btn-light btnSendReplyLike">
						<i class="bi bi-hand-thumbs-down"></i><span>싫어요</span>
					</button>
				</td>
			</tr>

			<tr class="reply-answer">
				<td colspan="2">
					<div class="border rounded">
						<div class="answer-list"></div>
						<div>
							<textarea class="form-control m-2"></textarea>
						</div>
						<div class="text-end pe-2 pd-1">
							<button type="button" class="btn btn-light btnSendReplyAnswer">답글
								등록</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>

<div class="page-navigation">123</div>
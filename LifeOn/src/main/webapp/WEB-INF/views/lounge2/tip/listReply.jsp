<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div style="padding: 10px;">
	<div class="reply-info" style="text-align: left; padding: 0px 5px 10px 5px;">
		<span>[목록, ${pageNo}/${total_page} 페이지]</span>
	</div>
		
	<table class="table table-hover">
		<c:forEach var="dto" items="${listReply}">
			<tr class="border">
				<td style="width: 10%; vertical-align: baseline;">
					<div class="profile" style="margin: 5px; width: 40px; height: 40px; border-radius: 70%; border: 1px solid #e0e0e0; position: relative; overflow: hidden;">
						<img src="${pageContext.request.contextPath}${sessionScope.member.profile_image}" class="profileImage" style="width: 100%; height: 100%;" name="profileImage" id="profileImage" alt="프로필">
					</div>	
				</td>
				<td style="text-align: left;">
					<div>
						<div style="display: flex; justify-content: space-between; align-items: center;align-items: center;">
							<div class="name" style="padding: 5px 0px; display: flex; justify-content: flex-start;">
								${dto.nickname}
							</div>
							<div style="display: flex; justify-content: flex-end;">
								<c:choose>
									<c:when test="${sessionScope.member.nickName == dto.nickname}">
										<span class="deleteReply" data-replyNum="${dto.rpnum}" data-pageNo="${pageNo}">삭제</span>
										<span class="hideReply" data-replyNum="${dto.rpnum}"></span>
									</c:when>
									<c:when test="${sessionScope.member.grade >= 1}">
										<span class="deleteReply" data-replyNum="${dto.rpnum}" data-pageNo="${pageNo}">삭제</span> ·
										<span class="blockReply">차단</span>
									</c:when>
									<c:otherwise>
										<span class="notifyReply">신고</span> ·
										<span class="blockReply">차단</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="content" >${dto.rpcontent}</div>
						<div style="font-size: 12px; color: #777; padding-top: 5px; display: flex; justify-content: space-between; flex-wrap: wrap;">
							<div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
								${dto.rpreg_date}
							</div>
							<div style="display: flex; justify-content: flex-end; flex-wrap: wrap;">
								<span data-userLiked="${dto.memberLiked}">
									<span type="button" class="btnSendReplyLike" data-replyNum="${dto.rpnum}" data-replyLike="1" title="좋아요">
										<i class="bi ${dto.memberLiked == 1 ? 'bi-heart-fill':'bi-heart'}"></i>
										<span>${dto.likeCount}</span>
									</span>
									<span class="btnSendReplyLike" data-replyNum="${dto.rpnum}" data-replyLike="0" title="싫어요">
										<i class="bi ${dto.memberLiked == 0 ? 'bi-heartbreak-fill':'bi-heartbreak'}"></i>
										<span>${dto.disLikeCount}</span>
									</span>	        
								</span>
							</div>
						</div>
					</div>				
				</td>

			</tr>
		</c:forEach>
	</table>
	<div class="page-navigation">
		${paging}
	</div>			
</div>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	
<main>

<table class="table board-article">
	<thead>
		<tr>
			<td colspan="2" align="center">
				${dto.subject}
			</td>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td width="50%">
				이름 : ${dto.nickname}
			</td>
			<td align="right">
				${dto.reg_date} | 조회 ${dto.hitCount}
			</td>
		</tr>
		
		<tr>
			<td colspan="2" valign="top" height="200" style="border-bottom: none;">
				${dto.content}
			</td>
		</tr>

		<tr>
			<td colspan="2" class="text-center p-3" style="border-bottom: none;">
				<button type="button" class="btn btn-outline-primary btnSendBoardLike" title="좋아요"><i class="bi ${isMemberLiked ? 'bi-hand-thumbs-up-fill' : 'bi-hand-thumbs-up'}"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
			</td>
		</tr>

		<tr>
			<td colspan="2">
				<c:if test="${not empty dto.ssfname}">
					<p class="border text-secondary my-1 p-2">
						<i class="bi bi-folder2-open"></i>
						<a href="${pageContext.request.contextPath}/tip/download?num=${dto.psnum}">${dto.cpfname}</a>
					</p>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				이전글 :

			</td>
		</tr>
		<tr>
			<td colspan="2">
				다음글 :

			</td>
		</tr>
	</tbody>
</table>

<table class="table table-borderless mb-2">
	<tr>
		<td width="50%">
			<c:choose>
				<c:when test="${sessionScope.member.nickName == dto.nickname}">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/tip/update?num=${dto.num}&page=${page}';">수정</button>
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
					<textarea class="form-control" name="content"></textarea>
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

</main>

<c:if test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade > 1}">
	<script type="text/javascript">
		function deleteOk() {
			if (confirm('게시글을 삭제 하시겠습니까?')) {
				let qs = 'num=${dto.num}&${query}';
				let url = '${pageContext.request.contextPath}/bbs/delete?' + qs;
				location.href = url;
			}
		}
	</script>
</c:if>



</body>
</html>
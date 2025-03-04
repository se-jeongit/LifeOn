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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/market.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>
	
<main class="min-vh-100">
	<!-- 배너 -->
    <div class="body-title">
    	<em style="font-size: 30px; font-weight: 800; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);">필요한 만큼만 빌려쓰는 가성비 소비를 경험하세요!</em>
	</div>
	
	<div class="body-container">
		<div class="rent_container" style="flex-direction: column;">
		    <div class="product-detail">
		    	<!-- 상품 이미지 -->
		        <div class="product-image">
		            <img class="thumbnail-img" src="${pageContext.request.contextPath}/uploadPath/rent/${dto.pph}" alt="물품사진">
		        </div>
				
        		<!-- 상품 정보 -->
        		<div class="product-info">
        			<div style="text-align: left; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #e0e0e0;">
	            		<div style="font-size: 24px; font-weight: 600;">${dto.pname}</div>
	            		<div>
		            		<div style="display: flex; justify-content: flex-end; align-items: center;">
								<div class="profile" style="margin: 5px; width: 25px; height: 25px; border-radius: 50%; border: 1px solid #e0e0e0; position: relative; overflow: hidden;">
									<img src="${pageContext.request.contextPath}${dto.profile_image}" class="profileImage" style="width: 100%; height: 100%;" name="profileImage" id="profileImage" alt="프로필">
								</div>	
		            			<p style="margin: 0; font-size: 16px;">${dto.nickname}</p>
							</div>
	            			<p style="margin-bottom: 5px; color: #777; font-size: 12px;">등록일 : ${dto.prd}</p>
	            		</div>
        			</div>
        			<div style="text-align: left; padding-top: 30px; display: flex; justify-content: space-between; align-items: flex-start;">
	        			<div>
		           			<p style="margin: 0; font-size: 20px;">1일 대여비</p>
		           			<p style="margin: 0; font-size: 24px;"><fmt:formatNumber value="${dto.prp}"/> 원</p>
	           			</div>
	           			<div>
	           				<p style="margin: 0; color: #006AFF; font-size: 24px; font-weight: 600">${dto.prs}</p>
	           			</div>
           			</div>
        			<div>
        				<c:if test="${empty dto.prad}">
		           			<div style="padding-top: 10px; margin-bottom: 5px; text-align: left; font-size: 18px;">보증금 : <fmt:formatNumber value="${dto.prlp}"/> 원</div>
	        				<p style="margin: 0; text-align: left; font-size: 16px;">거래장소 : ${dto.pra}</p>
		           			<div style="display: flex; justify-content: space-between; align-items: center; padding-top: 38px;">
			           			<div style="display: flex;">
			      					<c:choose>
										<c:when test="${sessionScope.member.nickName == dto.nickname}">
											<button type="button" class="search_btn" onclick="location.href='${pageContext.request.contextPath}/market/rent/update?pnum=${dto.pnum}&page=${page}';">수정</button>
										</c:when>
									</c:choose>
									
									<c:choose>
										<c:when test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade >= 1}">
								    		<button type="button" class="search_btn" onclick="deleteOk();">삭제</button>
										</c:when>
									</c:choose>
			           			</div>
			           			<div>
			        				<button type="button" class="search_btn btnSendProductLike" style="padding: 8px 10px;" title="찜하기">
										<i class="bi ${isMemberLiked ? 'bi-suit-heart-fill redColor' : 'bi-suit-heart'}"></i>
										&nbsp;<span id="productLikeCount">${dto.productLikeCount}</span>
									</button>
				            		<button class="search_btn" style="margin: 0">대여신청</button>
				            	</div>
		           			</div>
        				</c:if>
        				<c:if test="${not empty dto.prad}">
		           			<div style="padding-top: 10px; margin-bottom: 5px; text-align: left; font-size: 18px;">보증금 : <fmt:formatNumber value="${dto.prlp}"/> 원</div>
	        				<p style="margin: 0; text-align: left; font-size: 16px;">거래장소 : ${dto.pra}</p>
	        				<p style="margin: 0; text-align: left; font-size: 16px;">상세정보 : ${dto.prad}</p>
		           			<div style="display: flex; justify-content: space-between; align-items: center; padding-top: 14px;">
			           			<div style="display: flex;">
			      					<c:choose>
										<c:when test="${sessionScope.member.nickName == dto.nickname}">
											<button type="button" class="search_btn" onclick="location.href='${pageContext.request.contextPath}/market/rent/update?pnum=${dto.pnum}&page=${page}';">수정</button>
										</c:when>
									</c:choose>
									
									<c:choose>
										<c:when test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade >= 1}">
								    		<button type="button" class="search_btn" onclick="deleteOk();">삭제</button>
										</c:when>
									</c:choose>
			           			</div>
			           			<div style="display: flex;">
			        				<button type="button" class="search_btn btnSendProductLike" style="padding: 8px 10px;" title="찜하기">
										<i class="bi ${isMemberLiked ? 'bi-suit-heart-fill redColor' : 'bi-suit-heart'}"></i>
										&nbsp;<span id="productLikeCount">${dto.productLikeCount}</span>
									</button>
				            		<button class="search_btn" style="margin: 0">대여신청</button>
				            	</div>
		           			</div>
        				</c:if>
        				
           			</div>
        		</div>
    		</div>
    		
		    <div class="product-detail">
		    	<div style="width: 100%; display: flex; flex-direction: column; align-items: flex-start; padding: 20px 0;">
			    	<p style="margin: 0 0 20px; color: #333; font-size: 24px; font-weight: 500;">상품소개</p>
	           		<p>${dto.pct}</p>
		    	</div>
		    </div>
		    
		    <div class="product-detail">
		    	<div style="width: 100%; display: flex; flex-direction: column; align-items: flex-start; padding: 20px 0 0;">
			    	<p style="color: #333; font-size: 24px; font-weight: 500; margin-bottom: 30px;">물품추가이미지</p>
			    	<c:if test="${empty listFile}">
						<p style="margin: 40px 0 0; color: #999; font-size: 16px;">추가된 물품 이미지가 없습니다.</p>
					</c:if>
					<c:if test="${not empty listFile}">
						<div style="display: grid; grid-template-columns: repeat(4, 200px); justify-content: space-between; width: 890px;">
							<c:forEach var="vo" items="${listFile}">
								<img style="width: 100%; height: 200px; object-fit: cover; margin-bottom: 20px;" src="${pageContext.request.contextPath}/uploadPath/rent/${vo.ppp}" alt="물품추가사진">
							</c:forEach>
						</div>
					</c:if>
		    	</div>
		    </div>
		    
		    <div class="product-detail" style="margin: 20px 0 0;">
		    	<div style="width: 100%; display: flex; flex-direction: column; align-items: flex-start; padding: 20px 0 60px;">
			    	<p style="color: #333; font-size: 24px; font-weight: 500; margin-bottom: 30px;">현재 판매자의 다른 대여물품</p>
					<c:if test="${empty memberProduct}">
						<p style="margin: 20px 0 60px; color: #999; font-size: 16px;">판매자가 추가로 판매하는 대여물품이 없습니다.</p>
					</c:if>
					<c:if test="${not empty memberProduct}">
						<div class="tab_item">
							<div class="tab_content">
				               <div class="prod_detail_ct">
									<div class="cont_wrap">
										<ul class="product_list" id="product_list">
											<c:forEach var="vo" items="${memberProduct}" varStatus="status">
												<a href="${pageContext.request.contextPath}/market/rent/article/${vo.pnum}?${query}">
													<img class="productImg" src="${pageContext.request.contextPath}/uploadPath/rent/${vo.pph}" alt="물품사진">
												</a>
											</c:forEach>
										</ul>
										<c:if test="${memberProductSize > 4}">
											<p class="controls">
												<span class="prev" onclick="prev();"><i class="bi bi-chevron-left"></i></span>
												<span class="next" onclick="next();"><i class="bi bi-chevron-right"></i></span>
											</p>
										</c:if>
									</div>
								</div>
							</div>
				    	</div>
					</c:if>
		    	</div>
		    </div>

		</div>
	</div>
</main>

<c:if test="${sessionScope.member.nickName == dto.nickname || sessionScope.member.grade >= 1}">
	<script type="text/javascript">
		function deleteOk() {
			if (confirm('등록한 대여물품을 삭제 하시겠습니까?')) {
				let qs = 'pnum=${dto.pnum}&${query}';
				let url = '${pageContext.request.contextPath}/market/rent/delete?' + qs;
				location.href = url;
			}
		}
	</script>
</c:if>

<script type="text/javascript">
const product_list = document.querySelector('#product_list');

const prevBtn = document.querySelector('.prev');
const nextBtn = document.querySelector('.next');

/* 사진 개수 */
const slideCount = '${memberProductSize}';

if (slideCount < 5) {
	product_list.style.marginLeft = '0px';
}

/* 현재 인덱스 */
let currentIdx = 0;
/* 이미지 너비 */
let slideWidth = 200;
/* 이미지 간 간격 */
let slideMargin = 30;
/* 전체 너비 설정 */
product_list.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';
/* 초기화 */
product_list.style.left = '0px';

function moveSlideByButton (num) {
	product_list.style.left = -num * 230 + 'px';
    currentIdx = num;
}

function prev() {
	if (currentIdx > 0) {
    	moveSlideByButton(currentIdx - 1);
	}
}

function next() {
	if (currentIdx < slideCount - 4) {
    	moveSlideByButton(currentIdx + 1);
	}
}

</script>
<script type="text/javascript">
$(function() {
	$('.btnSendProductLike').click(function() {
		const $i = $(this).find('i');
		let memberLiked = $i.hasClass('bi-suit-heart-fill');
		let msg = memberLiked ? '찜을 취소하시겠습니까?' : '찜을 하시겠습니까?';
		
		console.log(memberLiked);
		if (! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/market/rent/insertProductLike';
		let pnum = '${dto.pnum}';
		let params = {pnum: pnum, memberLiked: memberLiked};
		
		const fn = function(data) {
			let state = data.state;
			// alert(state);
			
			if (state === "true") {
				if (memberLiked) {
					$i.removeClass('bi-suit-heart-fill redColor').addClass('bi-suit-heart');
				} else {
					$i.removeClass('bi-suit-heart').addClass('bi-suit-heart-fill redColor');
				}
				
				let count = data.productLikeCount;
				$('#productLikeCount').text(count);
				
			} else if (state == "liked") {
				alert('찜은 한번만 가능합니다.');
			} else {
				alert('처리가 실패 했습니다.');
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
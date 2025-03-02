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
        			<div style="display: flex; justify-content: space-between; align-items: flex-end; border-bottom: 1px solid #e0e0e0;">
	            		<p style="font-size: 20px; font-weight: 600; margin-bottom: 3px;">${dto.pname}</p>
	            		<p style="margin-bottom: 3px;">등록일 : ${dto.prd}</p>
        			</div>
           			<p class="price">대여비 : ${dto.prp}</p>
           			<p class="price">보증금 : ${dto.prlp}</p>
            		<button class="search_btn">대여하기</button>
        		</div>
    		</div>
		    <div class="product-detail">
           		<p>상품 설명: 이 상품은 고품질의 제품입니다. 다양한 용도로 사용 가능하며, 매우 실용적입니다.</p>
		    </div>

		</div>
	</div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
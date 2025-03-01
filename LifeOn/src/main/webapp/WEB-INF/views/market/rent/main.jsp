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
    	<em style="font-size: 30px; font-weight: 800; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);">대여? 돼요!</em>
	</div>
	
	<!-- 카테고리 메뉴 -->
	<div class="category_tab" id="category_tab">
		<nav class="category_nav">
			<ul>
				<li class="topMenuLi">
	                <a class="menuLink" onclick="location.href='<c:url value='/market/rent/main'/>'">전체</a>
	            </li>
	            
	            <c:forEach var="main" items="${listCategory}">
		            <li class="topMenuLi">
		                <a class="menuLink" onclick="location.href='<c:url value='/market/rent/main?cbn=${main.cbn}'/>'">${main.cbc}</a>
		                <ul class="submenu">
		                	<c:forEach var="sub" items="${main.listSub}">
		                    	<li class="submenuLink"><a href="#" class="subLink"></a>${sub.csc}</li>
		                	</c:forEach>
		                </ul>
		            </li>
	            </c:forEach>

			</ul>
		</nav>
	</div>
	
	<!-- 카테고리 타이틀-->
    <div class="category_title" id="category_title">
    	<div>
        	<h3 style="margin: 0; font-weight: 500;">전체</h3>
		</div>
        <div>
            <span>
            	<em>${dataCount}</em> 개의 대여물품이 있습니다.
            </span>
		</div>
    </div>
	
	<div class="body-container">
		<div class="product_group">
			<aside class="product_best" id=product_best>
	       		<h5 style="margin: 0; font-weight: 600;">BEST</h5>
        	</aside>
        	
			<div class="product_content">
				<div style="display: flex; justify-content: space-between; align-items: flex-end; padding-bottom: 20px;">
					<div style="text-align: left; width: 50%;">
						<h4 style="margin: 0; font-weight: 500;">물품대여</h4>
						<span style="color: #999;">필요한 물건을 필요한 기간 동안 필려서 사용해보세요.</span>
					</div>
					
					<div style="display: flex; justify-content: flex-end; align-items: flex-end; width: 50%">
						<div style="display: flex;">
							<!-- 검색 기능 -->
			                <input type="text" class="search_input" id="search_input" placeholder="빌리고 싶은 물건을 찾아보세요.">
			                <button class="search_btn" id="search_btn">검색</button>
		                </div>
						<div>
							<button class="ssbtn" style="height: 40px; border-radius: 0px;" onclick="location.href='<c:url value='write'/>'">물품등록</button>
						</div>
					</div>
				</div>
				
		        <!-- 상품 리스트 -->
	            <div class="product-grid">
	            	<c:forEach var="dto" items="${list}" varStatus="status">
		                <div class="product-item" onclick="location.href='<c:url value='${articleUrl}${dto.pnum}?${query}'/>'" style="cursor: pointer;">
		                    <c:if test="${empty dto.pph}">
		                    	<img class="product_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
		                    </c:if>
		                    <c:if test="${not empty dto.pph}">
		                    	<img class="product_img" src="${pageContext.request.contextPath}/uploadPath/rent/${dto.pph}">
		                    </c:if>
		                    <div class="product_info">
				                    <h5 style="text-align: left;">${dto.pname}</h5>
		                    	<div style="text-align: left; font-size: 16px;">${dto.prs}</div>
			                    	<div style="text-align: left;">
			                    		<span style="font-size: 20px; font-weight: bold;">${dto.prp} </span>
			                    		<span style="font-size: 16px; font-weight: 600;">원</span>
			                    		<span> /일</span>
		                    		</div>
			                    <div style="text-align: left; padding-bottom: 5px;">보증금 : ${dto.prlp} 원</div>
								<div style="text-align: left;">${dto.pra}&nbsp;·&nbsp;1일전</div>
		                	</div>
		                </div>
	                </c:forEach>
	            </div>
	            
				<div class="page-navigation" style="padding: 40px 0 20px;">
					${dataCount == 0 ? "등록된 대여물품이 없습니다." : paging}
				</div>
    		</div>
    		
    		<!-- 최근 본 상품 목록 -->
	        <div class="product_Viewe">
			   	<div class="view_item" style="border-bottom: none;">
			    	<p style="margin: 0">최근 본 목록</p>
			    </div>
	  
			  	<div class="view_item">
			  		<p style="margin: 0; font-size: 12px;"> 최근 본 대여물품이 없습니다.
		  			<img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
		  			<img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
		  			<img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
				</div>
				<a href="#"><button type="button" class="top_btn"><i class="bi bi-chevron-up"></i></button></a>
	   		</div>
		</div>
		
    </div>
</main>

<script type="text/javascript">
/* document.querySelectorAll('.menuLink').forEach(menuLink => {
    
    menuLink.addEventListener('click', function (e) {
        e.preventDefault(); // 기본 링크 이동 방지
        const submenu = this.nextElementSibling; // 서브 메뉴 (ul)
        
        if (submenu) {
	        // 이미 열려 있는 서브 메뉴는 닫기
	        const allSubmenus = document.querySelectorAll('.submenu');
	        allSubmenus.forEach(sub => {
	            if (sub !== submenu) {
	                sub.style.height = '0'; // 다른 서브 메뉴 닫기
	            }
	        });
	
	        // 해당 서브 메뉴 열기
	        if (submenu.style.height === '0px' || submenu.style.height === '') {
	            submenu.style.height = submenu.scrollHeight + 'px'; // 서브 메뉴 열기
	        } else {
	            submenu.style.height = '0'; // 서브 메뉴 닫기
	        }
        }
    });
});

//바깥 화면 클릭 시 서브 메뉴 닫기
document.addEventListener('click', function(e) {
    const clickedInsideMenu = e.target.closest('.category_nav'); // .category_nav 내부 클릭 여부
    if (!clickedInsideMenu) {
        const allSubmenus = document.querySelectorAll('.submenu');
        allSubmenus.forEach(sub => {
            sub.style.height = '0'; // 서브 메뉴 닫기
        });
    }
}); */
</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
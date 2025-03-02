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

<script type="text/javascript">
function elapsedText(date) {
	const seconds = 1;
	const minute = seconds * 60;
	const hour = minute * 60;
	const day = hour * 24;
	
	var today = new Date();
	var elapsedTime = Math.trunc((today.getTime() - date.getTime()) / 1000);
	
	var elapsedText = "";
	if (elapsedTime < seconds) {
		elapsedText = "방금 전";
	} else if (elapsedTime < minute) {
		elapsedText = elapsedTime + "초 전";
	} else if (elapsedTime < hour) {
		elapsedText = Math.trunc(elapsedTime / minute) + "분 전";
	} else if (elapsedTime < day) {
		elapsedText = Math.trunc(elapsedTime / hour) + "시간 전";
	} else if (elapsedTime < (day * 3)) {
		elapsedText = Math.trunc(elapsedTime / day) + "일 전";
	} else {
		elapsedText = date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0') + "-" + date.getDate().toString().padStart(2, '0');
	}
	
	return elapsedText;
}
</script>

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
					<div style="text-align: left; width: 40%;">
						<h4 style="margin: 0; font-weight: 500;">물품대여</h4>
						<span style="color: #999;">필요한 물건을 필요한 기간 동안 필려서 사용해보세요.</span>
					</div>
					
					<div style="display: flex; justify-content: flex-end; align-items: flex-end; width: 60%">
						<form name="searchForm" style="display: flex;">
							<!-- 검색 기능 -->
							<input type="hidden" class="form-control-plaintext" name="schType" value="productName">
			                <input type="search" class="search_input" id="search_input" name="kwd" value="${kwd}" placeholder="빌리고 싶은 물건을 찾아보세요.">
			                <button class="search_btn" id="search_btn" onclick="searchList();">검색</button>
			                <button type="button" class="search_btn" onclick="location.href='${pageContext.request.contextPath}/market/rent/main';" title="검색초기화"><i class="bi bi-arrow-repeat"></i></button>
		                </form>
						<div>
							<button class="ssbtn" style="height: 40px; border-radius: 0px;" onclick="location.href='<c:url value='write'/>'">물품등록</button>
						</div>
					</div>
				</div>
				
		        <!-- 상품 리스트 -->
	            <div class="product-grid">
	            	<c:forEach var="dto" items="${list}" varStatus="status">
		                <div class="product-item" id="${dto.pnum}" onclick="location.href='<c:url value='${articleUrl}/${dto.pnum}?${query}'/>'" style="cursor: pointer;">
		                    <c:if test="${empty dto.pph}">
		                    	<img class="product_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
		                    </c:if>
		                    <c:if test="${not empty dto.pph}">
		                    	<img class="product_img" src="${pageContext.request.contextPath}/uploadPath/rent/${dto.pph}" alt="물품사진">
		                    </c:if>
		                    <div class="product_info">
				                <h5 class="product_name" style="text-align: left;">${dto.pname}</h5>
		                    	<div style="text-align: left; font-size: 16px; font-weight: bold; color: #006AFF">${dto.prs}</div>
			                    	<div style="text-align: left;">
			                    		<span style="font-size: 20px; font-weight: bold;"><fmt:formatNumber value="${dto.prp}"/></span>
			                    		<span style="font-size: 16px; font-weight: 600;">원</span>
			                    		<span> /일</span>
		                    		</div>
			                    <div style="text-align: left; padding-bottom: 5px;">보증금 : <fmt:formatNumber value="${dto.prlp}"/> 원</div>
								<div style="text-align: left;">
									<span id="output-${dto.pnum}"></span>
	                             	<script type="text/javascript">
		                             	document.addEventListener("DOMContentLoaded", function() {
		                             		const pra = '${dto.pra}';
		                             		const result = pra.split(' ', 2);
		                             		const joinedResult = result.join(' ');
		                             		const id = "output-${dto.pnum}";
		                             		
		                             		document.getElementById(id).innerText = joinedResult;
		                             	});
	                             	</script>
									&nbsp;·&nbsp;
									<span id="result-${dto.pnum}"></span>
	                             	<script type="text/javascript">
										document.addEventListener("DOMContentLoaded", function() {
											const dateStr = "${dto.prd}".trim();
											const date = new Date(dateStr);
											const id = "result-${dto.pnum}";
										
										document.getElementById(id).innerText = elapsedText(date);
										});
	                             	</script>
								</div>
		                	</div>
		                </div>
	                </c:forEach>
	            </div>
	            
				<div class="page-navigation" style="padding: 150px 0 20px;">
					${dataCount == 0 ? "등록된 대여물품이 없습니다." : paging}
				</div>
    		</div>
    		
    		<!-- 최근 본 상품 목록 -->
	        <div class="product_Viewe">
			   	<div class="view_item" style="border-bottom: none;">
			    	<p style="margin: 0">최근 본 목록</p>
			    </div>
	  
			  	<div class="view_item img_area">
			  		<p style="margin: 0; font-size: 12px;"> 최근 본 대여물품이 없습니다.
		  			<%-- <img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png"> --%>
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

<script type="text/javascript">
// 검색 키워드 입력란에서 엔터를 누른 경우 서버 전송 막기 
window.addEventListener('load', () => {
	const inputEL = document.querySelector('form input[name=kwd]'); 
	inputEL.addEventListener('keydown', function (evt) {
	    if(evt.key === 'Enter') {
	    	evt.preventDefault();
	    	
	    	searchList();
	    }
	});
});

function searchList() {
	const f = document.searchForm;
	if(! f.kwd.value.trim()) {
		return;
	}
	
	// form 요소는 FormData를 이용하여 URLSearchParams 으로 변환
	const formData = new FormData(f);
	let requestParams = new URLSearchParams(formData).toString();
	
	let url = '${pageContext.request.contextPath}/market/rent/main';
	location.href = url + '?' + requestParams;
}

$(document).ready(function() {
    // 상품 클릭 시 최근 본 상품 저장
    $('.product-item').click(function() {
        var pname = $(this).find('.product_name').text();
        var pnum = $(this).attr("id");
        var imageSrc = $(this).find('img').attr('src');

        // 최근 본 상품 로컬 스토리지에 저장
        var recentlyRentViewed = JSON.parse(localStorage.getItem('recentlyRentViewed')) || [];
        
        for (var i = 0; i < recentlyRentViewed.length; i++) {
        	if (recentlyRentViewed[i].pnum == pnum) {
        		return false;
        	}
        }

        recentlyRentViewed.push({ pnum: pnum, pname: pname, image: imageSrc });
        

        if (recentlyRentViewed.length > 3) {
        	recentlyRentViewed.shift(); // 가장 오래된 상품 삭제
        }

        localStorage.setItem('recentlyRentViewed', JSON.stringify(recentlyRentViewed));

        // 최근 본 상품을 aside에 갱신
        updateRecentlyRentViewed();
    });

    // 페이지 로드 시 최근 본 상품 불러오기
    updateRecentlyRentViewed();

    function updateRecentlyRentViewed() {
        var recentlyRentViewed = JSON.parse(localStorage.getItem('recentlyRentViewed')) || [];
        var $recentlyRentViewedSection = $('.img_area');
        
        $recentlyRentViewedSection.empty();  // 이전 내용 삭제

        if (recentlyRentViewed.length === 0) {
            $recentlyRentViewedSection.append('<p style="margin: 0; font-size: 12px;"> 최근 본 대여물품이 없습니다.');
        } else {
            $.each(recentlyRentViewed, function(index, product) {
                var productHtml = '<a href="${pageContext.request.contextPath}/market/rent/article/' + product.pnum + '?${query}">'
								+ '<img class="view_img" src="' + product.image + '" alt="상품 이미지">'
                                + '</a>';
                $recentlyRentViewedSection.prepend(productHtml);
            });
        }
    }
});
</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
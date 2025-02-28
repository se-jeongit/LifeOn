<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LifeOn</title>

    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/main/styles.css" type="text/css">
    <link rel="stylesheet" href="">

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="container-main">
    <!-- 메인 배너 섹션 -->
    <div class="main-banner">
        <!-- 왼쪽 큰 배너 -->
        <div class="main-banner-left">
            <div class="image-slider" id="imageSlider">
                <div class="slide">
                    <img src="placeholder5.jpg" alt="메인 이미지 1" class="slide-image">
                    <div class="slide-content">
                        <h2>인터넷에서사람 계속 1</h2>
                        <p class="subtitle">계속해서 사람 1</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="placeholder5.jpg" alt="메인 이미지 2" class="slide-image">
                    <div class="slide-content">
                        <h2>인터넷에서사람 계속 2</h2>
                        <p class="subtitle">계속해서 사람 2</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="placeholder5.jpg" alt="메인 이미지 3" class="slide-image">
                    <div class="slide-content">
                        <h2>인터넷에서사람 계속 3</h2>
                        <p class="subtitle">계속해서 사람 3</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="placeholder5.jpg" alt="메인 이미지 4" class="slide-image">
                    <div class="slide-content">
                        <h2>인터넷에서사람 계속 4</h2>
                        <p class="subtitle">계속해서 사람 4</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="placeholder5.jpg" alt="메인 이미지 5" class="slide-image">
                    <div class="slide-content">
                        <h2>인터넷에서사람 계속 5</h2>
                        <p class="subtitle">계속해서 사람 5</p>
                    </div>
                </div>
            </div>
            <div class="slider-indicators" id="sliderIndicators">
                <span class="indicator active" data-slide="0"></span>
                <span class="indicator" data-slide="1"></span>
                <span class="indicator" data-slide="2"></span>
                <span class="indicator" data-slide="3"></span>
                <span class="indicator" data-slide="4"></span>
            </div>
        </div>

        <!-- 오른쪽 작은 배너 (캐러셀) -->
        <div class="main-banner-right">
            <div class="image-container">
                <img src="placeholder.jpg" alt="이벤트 이미지" class="placeholder-image">
            </div>

            <!-- 캐러셀 컨트롤 -->
            <button class="carousel-control left">
                <span class="arrow">&#10094;</span>
            </button>
            <button class="carousel-control right">
                <span class="arrow">&#10095;</span>
            </button>

            <div class="page-indicator">1/3 페이지</div>
            <div class="event-title">이벤트</div>
        </div>
    </div>

    <!-- 1인가구 팁 게시판 섹션 -->
    <div class="section">
        <div class="section-header">
            <h2>1인가구 팁 게시판</h2>
            <button class="more-btn">더보기</button>
        </div>

        <div class="product-grid">
            <% for(int i=1; i<=4; i++) { %>
            <div class="product-card">
                <div class="image-container">
                    <img src="placeholder.jpg" alt="제품 이미지 <%= i %>" class="placeholder-image">
                </div>
                <div class="product-info">
                    <div class="product-row">
                        <span>제품 이름 제목</span>
                        <span>가격: 10,000원</span>
                    </div>
                    <div class="product-row">
                        <span>평점: <%= i %>.0</span>
                        <span>리뷰: <%= i * 10 %>개</span>
                    </div>
                    <p class="product-description">고객님들이 많이 찾는 제품입니다.</p>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- 마감임박 공동구매상품 섹션 -->
    <div class="section">
        <div class="section-header">
            <h2>마감임박 공동구매상품</h2>
            <button class="more-btn">더보기</button>
        </div>

        <div class="group-buy-grid">
            <div class="group-buy-card">
                <div class="image-container">
                    <img src="placeholder.jpg" alt="공동구매 상품 1" class="placeholder-image">
                </div>
                <div class="day-badge">D-day</div>
                <div class="product-info">
                    <p>상품명 & 상세정보</p>
                    <p class="discount">40% 할인 • 5,000원</p>
                    <p class="original-price">8,500 원</p>
                </div>
            </div>
            <div class="group-buy-card">
                <div class="image-container">
                    <img src="placeholder.jpg" alt="공동구매 상품 2" class="placeholder-image">
                </div>
                <div class="day-badge">D-1</div>
                <div class="product-info">
                    <p>상품명 & 상세정보</p>
                    <p class="discount">35% 할인 • 5,000원</p>
                    <p class="original-price">8,500 원</p>
                </div>
            </div>
            <div class="group-buy-card">
                <div class="image-container">
                    <img src="placeholder.jpg" alt="공동구매 상품 3" class="placeholder-image">
                </div>
                <div class="day-badge">D-3</div>
                <div class="product-info">
                    <p>상품명 & 상세정보</p>
                    <p class="discount">30% 할인 • 5,000원</p>
                    <p class="original-price">8,500 원</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 지역정보 및 추천 지역모임 섹션 -->
    <div class="section local-section">
        <div class="local-info">
            <div class="section-header">
                <h2>지역정보</h2>
                <button class="more-btn">더보기</button>
            </div>

            <div class="local-content">
                <h3>지역인기장소 TOP3</h3>
                <ul class="local-list">
                    <li>
                        <span>인기장소 1</span>
                        <span class="info-text">평점 4.8 • 리뷰 120개</span>
                    </li>
                    <li>
                        <span>인기장소 2</span>
                        <span class="info-text">평점 4.7 • 리뷰 98개</span>
                    </li>
                    <li>
                        <span>인기장소 3</span>
                        <span class="info-text">평점 4.6 • 리뷰 85개</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="local-meetings">
            <div class="section-header">
                <h2>추천 지역모임</h2>
                <button class="more-btn">더보기</button>
            </div>

            <div class="local-content">
                <ul class="meeting-list">
                    <li>
                        <p>일요일에 공원에서 만나요!</p>
                        <p class="info-text">3월 15일 오후 2시 • 참가자 12명</p>
                    </li>
                    <li>
                        <p>동네 독서모임 신규 회원 모집합니다</p>
                        <p class="info-text">매주 화요일 저녁 7시 • 참가자 8명</p>
                    </li>
                    <li>
                        <p>같이 등산 가실 분!</p>
                        <p class="info-text">3월 20일 오전 8시 • 참가자 5명</p>
                    </li>
                    <li>
                        <p>주말 요리 클래스</p>
                        <p class="info-text">3월 18일 오후 3시 • 참가자 10명</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <!-- 지역새소식 섹션 -->
    <div class="section">
        <div class="section-header">
            <h2>지역새소식</h2>
        </div>

        <div class="local-news">
            <img src="placeholder.jpg" alt="지역 새소식 이미지" class="news-image">
            <div class="news-content">
                <h3>여기는 무엇인가?</h3>
                <p>4월 봄축제 개최합니다</p>
                <p class="info-text">행사 안내문구</p>
            </div>
        </div>
    </div>

    <!-- 광역정보 섹션 -->
    <div class="section">
        <div class="section-header">
            <h2>광역정보</h2>
            <button class="more-btn">더보기</button>
        </div>

        <div class="regional-info">
            <div class="regional-card">
                <img src="placeholder.jpg" alt="광역정보 이미지 1" class="placeholder-image">
            </div>
            <div class="regional-card">
                <img src="placeholder.jpg" alt="광역정보 이미지 2" class="placeholder-image">
            </div>
        </div>
    </div>
</main>

<script src="${pageContext.request.contextPath}/dist/main/script.js"></script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
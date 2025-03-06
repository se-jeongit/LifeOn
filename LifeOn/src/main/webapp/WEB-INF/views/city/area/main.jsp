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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/area.css" type="text/css">


</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/city/layout/menu.jsp"/>
</header>
 
    <!-- 메인 콘텐츠 -->
    <main class="min-vh-100">
        <!-- 상단 슬라이더 -->
        <div class="slider-container">
            <div class="slider" id="main-slider">
                <div class="slide">
                    <div class="slide-content">
                        <h2>어디 살지?</h2>
                        <p>나랑 맞는 동네 찾기</p>
                    </div>
                </div>
                <div class="slide">
                    <div class="slide-content">
                        <h2>지역 탐색</h2>
                        <p>새로운 동네 발견하기</p>
                    </div>
                </div>
                <div class="slide">
                    <div class="slide-content">
                        <h2>추천 지역</h2>
                        <p>인기 있는 동네 보기</p>
                    </div>
                </div>
            </div>
            
            <button class="slider-btn prev-btn" id="main-prev">
                <i class="fas fa-chevron-left"></i>
            </button>
            <button class="slider-btn next-btn" id="main-next">
                <i class="fas fa-chevron-right"></i>
            </button>
            
            <div class="slider-dots" id="main-dots">
                <span class="dot active"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>
        
        <!-- MBTI 배너 -->
        <div class="mbti-banner" id="mbti-banner">
            <img src="" alt="MBTI 테스트 배너">
        </div>
        
        <!-- 지역 정보 -->
        <div class="container">
            <h2 class="section-title">지역정보</h2>
            
            <div class="region-info-card">
                <h3 class="card-title">지역인기순 TOP3</h3>
                
                <div class="region-list">
                    <div class="region-item">
                        <div class="region-number">1</div>
                        <div class="region-details">
                            <h4>가산디지털단지</h4>
                            <p>새로운 신흥 지구가 형성된 G.O.A.T</p>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">2</div>
                        <div class="region-details">
                            <h4>성신여대입구</h4>
                            <p>연인들에게 좋은 곳! 쇼핑가 볼거리 풍부!</p>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">3</div>
                        <div class="region-details">
                            <h4>선정릉</h4>
                            <p>높은 빌딩 사이, 한적하고 안전한 지역</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 전체 노선 슬라이더 -->
            <div class="route-section">
                <div class="section-header">
                    <h3 class="section-title">전체노선</h3>
                    <div class="slider-controls">
                        <button class="control-btn" id="route-prev">
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <button class="control-btn" id="route-next">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
                
                <div class="route-slider-container">
                    <div class="route-slider" id="route-slider">
                        <!-- 첫 번째 슬라이드 -->
                        <div class="route-slide">
                            <h4 class="slide-title">인기 노선</h4>
                            <div class="route-grid">
                                <div class="route-card">
                                    <div class="route-image">
                                        <img src="placeholder.jpg" alt="가산디지털단지">
                                    </div>
                                    <div class="route-info">
                                        <h5>가산디지털단지</h5>
                                        <p>새로운 신흥 지구가 형성된 G.O.A.T</p>
                                    </div>
                                </div>
                                
                                <div class="route-card">
                                    <div class="route-image">
                                        <img src="placeholder.jpg" alt="성신여대입구">
                                    </div>
                                    <div class="route-info">
                                        <h5>성신여대입구</h5>
                                        <p>연인들에게 좋은 곳! 쇼핑가 볼거리 풍부!</p>
                                    </div>
                                </div>
                                
                                <div class="route-card">
                                    <div class="route-image">
                                        <img src="placeholder.jpg" alt="선정릉">
                                    </div>
                                    <div class="route-info">
                                        <h5>선정릉</h5>
                                        <p>높은 빌딩 사이, 한적하고 안전한 지역</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 두 번째 슬라이드 -->
                        <div class="route-slide">
                            <h4 class="slide-title">추천 노선</h4>
                            <div class="route-grid">
                                <div class="route-card">
                                    <div class="route-image">
                                        <img src="placeholder.jpg" alt="홍대입구">
                                    </div>
                                    <div class="route-info">
                                        <h5>홍대입구</h5>
                                        <p>젊음의 거리, 문화와 예술의 중심지</p>
                                    </div>
                                </div>
                                
                                <div class="route-card">
                                    <div class="route-image">
                                        <img src="placeholder.jpg" alt="강남">
                                    </div>
                                    <div class="route-info">
                                        <h5>강남</h5>
                                        <p>비즈니스와 쇼핑의 중심지</p>
                                    </div>
                                </div>
                                
                                <div class="route-card">
                                    <div class="route-image">
                                        <img src="placeholder.jpg" alt="여의도">
                                    </div>
                                    <div class="route-info">
                                        <h5>여의도</h5>
                                        <p>금융과 비즈니스의 중심, 한강 공원 인접</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- MBTI 모달 -->
    <div class="modal" id="mbti-modal">
        <div class="modal-overlay"></div>
        <div class="modal-content">
            <button class="modal-close">
                <i class="fas fa-times"></i>
            </button>
            
            <div class="modal-body">
                <img src="" alt="MBTI 테스트" class="modal-image">
                
                <div class="modal-question-container">
                    <h3 class="modal-question" id="modal-question">입대표 버스도 <더를 역세권> 동네라면 대환영?</h3>
                    
                    <div class="modal-buttons">
                        <button class="modal-btn yes-btn">YES!</button>
                        <button class="modal-btn no-btn">NO!</button>
                    </div>
                    
                    <div class="modal-progress">
                        <span class="progress-dot active"></span>
                        <span class="progress-dot"></span>
                        <span class="progress-dot"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // 메인 슬라이더 기능
        let mainCurrentSlide = 0;
        const mainSlides = document.querySelectorAll('#main-slider .slide');
        const mainDots = document.querySelectorAll('#main-dots .dot');
        const mainPrevBtn = document.getElementById('main-prev');
        const mainNextBtn = document.getElementById('main-next');
        
        function showMainSlide(n) {
            mainCurrentSlide = n;
            
            if (mainCurrentSlide < 0) {
                mainCurrentSlide = mainSlides.length - 1;
            }
            if (mainCurrentSlide >= mainSlides.length) {
                mainCurrentSlide = 0;
            }
            
            // 모든 슬라이드 숨기기
            mainSlides.forEach(slide => {
                slide.style.transform = `translateX(-${mainCurrentSlide * 100}%)`;
            });
            
            // 현재 도트 활성화
            mainDots.forEach((dot, index) => {
                dot.classList.toggle('active', index === mainCurrentSlide);
            });
        }
        
        mainPrevBtn.addEventListener('click', () => {
            showMainSlide(mainCurrentSlide - 1);
        });
        
        mainNextBtn.addEventListener('click', () => {
            showMainSlide(mainCurrentSlide + 1);
        });
        
        mainDots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                showMainSlide(index);
            });
        });
        
        // 자동 슬라이드
        setInterval(() => {
            showMainSlide(mainCurrentSlide + 1);
        }, 5000);
        
        // 노선 슬라이더 기능
        let routeCurrentSlide = 0;
        const routeSlides = document.querySelectorAll('#route-slider .route-slide');
        const routePrevBtn = document.getElementById('route-prev');
        const routeNextBtn = document.getElementById('route-next');
        
        function showRouteSlide(n) {
            routeCurrentSlide = n;
            
            if (routeCurrentSlide < 0) {
                routeCurrentSlide = routeSlides.length - 1;
            }
            if (routeCurrentSlide >= routeSlides.length) {
                routeCurrentSlide = 0;
            }
            
            document.getElementById('route-slider').style.transform = `translateX(-${routeCurrentSlide * 100}%)`;
        }
        
        routePrevBtn.addEventListener('click', () => {
            showRouteSlide(routeCurrentSlide - 1);
        });
        
        routeNextBtn.addEventListener('click', () => {
            showRouteSlide(routeCurrentSlide + 1);
        });
        
        // MBTI 모달 기능
        const mbtiModal = document.getElementById('mbti-modal');
        const mbtiModalOverlay = document.querySelector('.modal-overlay');
        const mbtiModalClose = document.querySelector('.modal-close');
        const mbtiModalQuestion = document.getElementById('modal-question');
        const mbtiYesBtn = document.querySelector('.yes-btn');
        const mbtiNoBtn = document.querySelector('.no-btn');
        const mbtiProgressDots = document.querySelectorAll('.progress-dot');
        const mbtiBanner = document.getElementById('mbti-banner');
        
        const mbtiQuestions = [
            "입대표 버스도 <더를 역세권> 동네라면 대환영?",
            "혼자 사는데 역세권보다 조용한 동네가 좋아요",
            "주변에 맛집이 많은 곳이 좋아요"
        ];
        
        let currentQuestion = 0;
        
        function showQuestion(n) {
            currentQuestion = n;
            
            if (currentQuestion >= mbtiQuestions.length) {
                // 테스트 완료
                alert("MBTI 테스트 완료! 결과: 당신에게 맞는 동네는 홍대입구입니다.");
                closeModal();
                return;
            }
            
            mbtiModalQuestion.textContent = mbtiQuestions[currentQuestion];
            
            // 진행 상태 업데이트
            mbtiProgressDots.forEach((dot, index) => {
                dot.classList.toggle('active', index === currentQuestion);
            });
        }
        
        function openModal() {
            mbtiModal.classList.add('show');
            currentQuestion = 0;
            showQuestion(currentQuestion);
        }
        
        function closeModal() {
            mbtiModal.classList.remove('show');
        }
        
        mbtiBanner.addEventListener('click', openModal);
        mbtiModalClose.addEventListener('click', closeModal);
        mbtiModalOverlay.addEventListener('click', closeModal);
        
        mbtiYesBtn.addEventListener('click', () => {
            showQuestion(currentQuestion + 1);
        });
        
        mbtiNoBtn.addEventListener('click', () => {
            showQuestion(currentQuestion + 1);
        });
        
        // 초기화
        showMainSlide(0);
</script>
<footer class="mt-auto py-2 text-center w-100" style="background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
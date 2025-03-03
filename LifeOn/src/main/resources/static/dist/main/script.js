document.addEventListener("DOMContentLoaded", () => {
    // 메인 배너 왼쪽 슬라이더 기능
    const slides = document.querySelectorAll(".slide")
    const indicators = document.querySelectorAll(".indicator")
    let currentSlide = 0
    let slideInterval

    // 초기 슬라이드 설정
    slides[0].classList.add("active")

    // 슬라이드 표시 함수
    function showSlide(index) {
        // 현재 활성화된 슬라이드 비활성화
        slides.forEach((slide) => {
            slide.classList.remove("active")
        })

        // 인디케이터 업데이트
        indicators.forEach((indicator) => {
            indicator.classList.remove("active")
        })

        // 새 슬라이드 활성화
        slides[index].classList.add("active")
        indicators[index].classList.add("active")
    }

    // 다음 슬라이드로 이동
    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length
        showSlide(currentSlide)
    }

    // 이전 슬라이드로 이동
    function prevSlide() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length
        showSlide(currentSlide)
    }

    // 자동 슬라이드 시작
    function startSlideShow() {
        slideInterval = setInterval(nextSlide, 5000)
    }

    // 자동 슬라이드 정지
    function stopSlideShow() {
        clearInterval(slideInterval)
    }

    // 인디케이터 클릭 이벤트
    indicators.forEach((indicator, index) => {
        indicator.addEventListener("click", () => {
            currentSlide = index
            showSlide(currentSlide)
            stopSlideShow()
            startSlideShow()
        })
    })

    // 슬라이드 컨테이너에 마우스 오버/아웃 이벤트
    const sliderContainer = document.querySelector(".slider-container")

    sliderContainer.addEventListener("mouseenter", stopSlideShow)
    sliderContainer.addEventListener("mouseleave", startSlideShow)

    // 자동 슬라이드 시작
    startSlideShow()

    // 오른쪽 작은 배너 캐러셀 기능
    const carouselLeftBtn = document.querySelector(".carousel-control.left")
    const carouselRightBtn = document.querySelector(".carousel-control.right")
    const pageIndicator = document.querySelector(".page-indicator")

    let currentPage = 1
    const totalPages = 3

    function updatePage(direction) {
        if (direction === "next") {
            currentPage = currentPage < totalPages ? currentPage + 1 : 1
        } else {
            currentPage = currentPage > 1 ? currentPage - 1 : totalPages
        }

        pageIndicator.textContent = `${currentPage}/${totalPages} 페이지`
    }

    carouselLeftBtn.addEventListener("click", () => {
        updatePage("prev")
    })

    carouselRightBtn.addEventListener("click", () => {
        updatePage("next")
    })



    // 상품 카드 클릭 이벤트
    const productCards = document.querySelectorAll(".product-card, .group-buy-card")

    productCards.forEach((card) => {
        card.addEventListener("click", () => {
            alert("상품 상세 페이지로 이동합니다.")
        })
    })

    // 지역 모임 클릭 이벤트
    const meetingItems = document.querySelectorAll(".meeting-list li")

    meetingItems.forEach((item) => {
        item.addEventListener("click", function () {
            const meetingTitle = this.querySelector("p:first-child").textContent
            alert(`${meetingTitle} 모임 상세 페이지로 이동합니다.`)
        })
    })

    // 지역 새소식 클릭 이벤트
    const localNews = document.querySelector(".local-news")

    localNews.addEventListener("click", () => {
        alert("지역 새소식 상세 페이지로 이동합니다.")
    })
})


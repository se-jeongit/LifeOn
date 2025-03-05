document.addEventListener("DOMContentLoaded", () => {
    console.log("DOM이 로드되었습니다.")

    // 메인 배너 왼쪽 슬라이더 기능
    const mainBannerLeft = document.querySelector(".main-banner-left")
    const sliderContainer = document.querySelector(".slider-container")
    const slides = document.querySelectorAll(".slide")
    const indicators = document.querySelectorAll(".indicator")

    console.log("슬라이더 컨테이너:", sliderContainer ? "찾음" : "못찾음")
    console.log("슬라이드 개수:", slides.length)
    console.log("인디케이터 개수:", indicators.length)

    let currentSlide = 0
    let slideInterval

    // 슬라이드 표시 함수 - 현재 CSS 구조에 맞게 수정
    function showSlide(index) {
        console.log("슬라이드 표시:", index)

        // 모든 슬라이드 비활성화
        slides.forEach((slide) => {
            slide.classList.remove("active")
        })

        // 선택한 슬라이드만 활성화
        if (slides[index]) {
            slides[index].classList.add("active")
        }

        // 인디케이터 업데이트
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index)
        })

        currentSlide = index
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
        if (slideInterval) {
            clearInterval(slideInterval)
        }
        slideInterval = setInterval(nextSlide, 5000)
    }

    // 자동 슬라이드 정지
    function stopSlideShow() {
        clearInterval(slideInterval)
    }

    // 인디케이터 클릭 이벤트
    indicators.forEach((indicator, index) => {
        indicator.addEventListener("click", () => {
            console.log("인디케이터 클릭:", index)
            showSlide(index)
            stopSlideShow()
            startSlideShow()
        })
    })

    // 슬라이더에 마우스 오버/아웃 이벤트
    if (sliderContainer) {
        sliderContainer.addEventListener("mouseenter", stopSlideShow)
        sliderContainer.addEventListener("mouseleave", startSlideShow)
    } else if (mainBannerLeft) {
        mainBannerLeft.addEventListener("mouseenter", stopSlideShow)
        mainBannerLeft.addEventListener("mouseleave", startSlideShow)
    }

    // 초기 슬라이드 설정 및 자동 슬라이드 시작
    if (slides.length > 0) {
        console.log("초기 슬라이드 설정")
        // 첫 번째 슬라이드를 기본적으로 활성화
        slides[0].classList.add("active")
        startSlideShow()
    }

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

        if (pageIndicator) {
            pageIndicator.textContent = `${currentPage}/${totalPages} 페이지`
        }
    }

    if (carouselLeftBtn) {
        carouselLeftBtn.addEventListener("click", () => {
            updatePage("prev")
        })
    }

    if (carouselRightBtn) {
        carouselRightBtn.addEventListener("click", () => {
            updatePage("next")
        })
    }
})


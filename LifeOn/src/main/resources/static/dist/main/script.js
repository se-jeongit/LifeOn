document.addEventListener("DOMContentLoaded", () => {
    // 캐러셀 기능 구현
    const carouselLeftBtn = document.querySelector(".carousel-control.left")
    const carouselRightBtn = document.querySelector(".carousel-control.right")
    const pageIndicator = document.querySelector(".page-indicator")

    let currentPage = 1
    const totalPages = 3

    // 페이지 업데이트 함수
    function updatePage(direction) {
        if (direction === "next") {
            currentPage = currentPage < totalPages ? currentPage + 1 : 1
        } else {
            currentPage = currentPage > 1 ? currentPage - 1 : totalPages
        }

        pageIndicator.textContent = `${currentPage}/${totalPages} 페이지`
    }

    // 이벤트 리스너 추가
    carouselLeftBtn.addEventListener("click", () => {
        updatePage("prev")
    })

    carouselRightBtn.addEventListener("click", () => {
        updatePage("next")
    })

    // 더보기 버튼 기능
    const moreButtons = document.querySelectorAll(".more-btn")

    moreButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const sectionTitle = this.closest(".section-header").querySelector("h2").textContent
            alert(`${sectionTitle} 더보기 클릭됨`)
        })
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


    // 메인 배너 왼쪽 슬라이더 기능
    const imageSlider = document.querySelector(".image-slider");
    const slides = document.querySelectorAll(".slide");
    const indicators = document.querySelectorAll(".indicator");
    let currentSlide = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.style.transform = `translateX(${(i - index) * 100}%)`;
        });
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }

    function prevSlide() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        showSlide(currentSlide);
    }

    indicators.forEach((indicator, index) => {
        indicator.addEventListener("click", () => {
            currentSlide = index;
            showSlide(currentSlide);
        });
    });

    let slideInterval = setInterval(nextSlide, 5000);

    imageSlider.addEventListener("mouseenter", () => {
        clearInterval(slideInterval);
    });

    imageSlider.addEventListener("mouseleave", () => {
        slideInterval = setInterval(nextSlide, 5000);
    });

    showSlide(currentSlide);

})


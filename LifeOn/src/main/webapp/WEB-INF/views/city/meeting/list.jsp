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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/meeting.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/city/layout/menu.jsp"/>
</header>

  <main class="min-vh-100">
      <div class="banner-container">
      	<div class="banner">
      		<img alt="" src="/images/banner-pc.png">
      		<img alt="" src="/images/banner-pc-1.png">
      		<img alt="" src="/images/banner-pc-2.png">
      	</div>
   		<div class="banner__btn banner__btn--left icon icon-arrow-left"></div>
    	<div class="banner__btn banner__btn--right icon icon-arrow-right"></div>
      </div>
      

   <div class="search-bar">
          <input
            id="search-bar-input"
            class="search-content"
            type="text"
            placeholder="원하는 모임을 찾아보세요!"
          />
          <span class="icon icon-search" ><i class="bi bi-search" style="font-size: 16px; padding-top: 3px;"></i></span>
        </div>
	
        <div class="category-container">
          <nav class="category-nav">
            <ul class="category-subcontainer">
              <li data-id=0 class="category selected">전체</li>
              <li data-id=1 class="category">밥/카페</li>
              <li data-id=2 class="category">운동</li>
              <li data-id=3 class="category">스터디</li>
              <li data-id=4 class="category">문화생활</li>
              <li data-id=5 class="category">기타</li>
            </ul>
          </nav>
        </div>

        <div class="meeting__options">
          <div class="region-category">
            <label for="category"></label>
            <div class="select-box select-box--input select-box--round">
              <select id="select-box__options" class="dropdown">
                <option>서울</option>
                <option>금천구</option>
                <option>관악구</option>
                <option>구로구</option>
                <option>강서구</option>
                <option>강북구</option>
                <option>강남구</option>
                <option>강동구</option>
                <option>광진구</option>
                <option>노원구</option>
                <option>도봉구</option>
                <option>동작구</option>
                <option>동대문구</option>
                <option>마포구</option>
                <option>서초구</option>
                <option>송파구</option>
                <option>성동구</option>
                <option>성북구</option>
                <option>서대문구</option>
                <option>양천구</option>
                <option>영등포구</option>
                <option>용산구</option>
                <option>종로구</option>
                <option>중구</option>
                <option>중랑구</option>
            </select>
            </div>
          </div>
          <div class="meeting-activate-option">
            <span>모집완료 제외</span>
            <input type="checkbox" id="toggle" checked hidden />
            <label for="toggle" class="toggle-switch">
              <span class="toggle-button"></span>
            </label>
          </div>
        </div>
      </header>
      
      	<div style="display: flex; justify-content: flex-end; margin: 10px auto 10px; max-width: 1280px;">
          <button class="btn" onclick="location.href='${pageContext.request.contextPath}/city/meeting/write';">글쓰기</button>
        </div>

      <section class="main__content" >
        <ul id="meetings" class="meetings">
          <li th:each="meeting : ${meetings}" th:attr="data-id=${meeting.id}">
            <a class="meeting" th:href="@{/meeting/{id}(id = ${meeting.id})}">
              <div class="meeting__header">
                <div class="meeting__info-detail-more">
                  <span class="meeting__category" th:text="${meeting.category}"
                    >카테고리</span
                  >
                  <span
                    class="meeting__region add-deco-img-left deco-img-location"
                    th:text="${meeting.region}"
                    ><i class="bi bi-geo-alt"></i>지역</span
                  >
                 
                  <span class="meeting__date" th:text="${meeting.startedAt}"
                    ><i class="bi bi-calendar-check"></i>11.01(일)</span
                  >
                
                </div>
                <h3 class="meeting__title" th:text="${meeting.title}">제목</h3>
              </div>
              
                <div class="status-box" style="font-size: 15px; font-weight: bold; margin-left: auto;">
				    <div class="meeting__status ${dto.status eq '모집완료' ? 'meeting__status--off' : 'meeting__status--on'}">
				       	모집중 ${dto.status}
				    </div>
				
				    <c:if test="${dto.status eq '모집중'}">
				        <p style="font-size: 22px">남은 수량 : ${dto.ptq}개</p>
				    </c:if>
				</div>
				
                  <div class="meeting__info-detail-more" >
                    <div>
						<i class="tip_icon bi bi-bookmark"></i>
						<span>${dto.boardLikeCount}&nbsp;&nbsp;</span>
						<i class="tip_icon bi bi-eye"></i>
						<span>${dto.hitCount}&nbsp;&nbsp;</span>
						<i class="tip_icon bi bi-chat-dots"></i>
						<span>${dto.replyCount}&nbsp;&nbsp;</span>
					</div>
                  </div>
           
            </a>
          </li>
        </ul>
      </section>

    </main>
    
<script type="text/javascript">
document.querySelectorAll('.category').forEach(function(category) {
	category.addEventListener('click', function() {
	
	document.querySelectorAll('.category').forEach(function(c) {
	      c.classList.remove('selected');
	    });

	    // 클릭한 카테고리에 selected 클래스 추가
	    category.classList.add('selected');
	});
});
</script>

<footer class="mt-auto py-2 text-center w-100" style="background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
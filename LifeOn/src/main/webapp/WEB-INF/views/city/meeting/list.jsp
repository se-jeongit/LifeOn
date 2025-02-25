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

  <main layout:fragment="content" class="main">
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
          <span class="icon icon-search">돋보기</span>
          <input
            id="search-bar-input"
            class="search-content"
            type="text"
            placeholder="원하는 집합을 찾아보세요!"
          />
        </div>

        <div class="category-container">
          <nav class="category-nav">
            <ul class="category-subcontainer">
              <li data-id=0 class="category selected">전체</li>
              <li data-id=1 class="category">밥/카페</li>
              <li data-id=2 class="category">운동</li>
              <li data-id=3 class="category">스터디</li>
              <li data-id=4 class="category">방탈출</li>
              <li data-id=5 class="category">보드게임</li>
              <li data-id=6 class="category">문화</li>
              <li data-id=7 class="category">펫</li>
              <li data-id=8 class="category">기타</li>
            </ul>
          </nav>
        </div>

        <div class="meeting__options">
          <div class="region-category">
            <label for="category"></label>
            <div class="select-box select-box--input select-box--round">
              <span>지역</span>
              <ul class="select-box__options">
                  <li data-id=1>서울</li>
                  <li data-id=2>인천/경기</li>
                  <li data-id=3>경남/부산/울산</li>
                  <li data-id=4>충청/대전/세종</li>
                  <li data-id=5>전라/광주</li>
                  <li data-id=6>강원</li>
                  <li data-id=7>경북/대구</li>
                  <li data-id=8>제주</li>
                  <li data-id=9>온라인</li>
              </ul>
            </div>
          </div>
          <div class="meeting-activate-option">
            <span>모집 중만 보기</span>
            <input type="checkbox" id="toggle" checked hidden />
            <label for="toggle" class="toggle-switch">
              <span class="toggle-button"></span>
            </label>
          </div>
        </div>
      </header>

      <section class="main__content">
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
                    >지역</span
                  >
                  <span class="meeting__date" th:text="${meeting.startedAt}"
                    >11.01(일)</span
                  >
                </div>
                <h3 class="meeting__title" th:text="${meeting.title}">제목</h3>
              </div>
              
                  <div
                    class="meeting__status meeting__status--on"
                    th:if="${!meeting.isClosed}"
                  >
                    모집중
                  </div>
                  <div
                    class="meeting__status meeting__status--off"
                    th:if="${meeting.isClosed}"
                  >
                    모집완료
                  </div>
                  <div class="meeting__info-detail-more">
                    <div
                      class="meeting__views add-deco-img-left deco-img-eyes"
                      th:text="${meeting.viewCount}"
                    >
                      조회수
                    </div>
                    <div
                      class="meeting__comments add-deco-img-left deco-img-speech-bubble"
                      th:text="${meeting.commentCount}"
                    >
                      댓글수
                    </div>
                  </div>
               
              
            </a>
          </li>
        </ul>
        <!-- no search result -->
        <!-- <div class="search-result-none hidden">
          <p>
            '<strong class="search-keyword">검색어</strong>'에 대한 검색 결과가
            없어요 !
          </p>
          <p>검색할 단어를 변경하거나, 검색어를 확인해주세요.</p>
        </div> -->
        <!-- no result -->
        <div class="result-none hidden">
          <p>찾고있는 모임이 없네요!</p>
          <p>교집합을 만들어볼까요?</p>
        </div>
      </section>

      <!--  loading   -->
      <div class="lds-roller">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
      </div>
    </main>

<footer class="mt-auto py-2 text-center w-100" style="background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
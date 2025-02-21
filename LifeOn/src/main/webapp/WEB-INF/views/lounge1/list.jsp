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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/photo.css" type="text/css">

<style type="text/css">
.photo-card {
 border: 1px solid #E6E6E6;
 padding: 15px;
 text-align: center; 
 border-radius: 20px;
 box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
 height: 100%;
}

.photo-card img {
 width: 100%; 
 height: 250px; 
 object-fit: cover; 
 border-radius: 5px;
}
.photo-grid {
 display: grid;
 grid-template-columns: repeat(4, 1fr);
 gap: 20px;
}


.main_menu {
    padding: 0 20px; /* 좌우 20px의 패딩 추가 */
    display: flex; /* 플렉스박스를 사용하여 자식 요소 배치 */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: space-between; /* 양쪽 끝 정렬 */
    flex-wrap: wrap; /* 자식 요소가 넘칠 경우 줄바꿈 */
}
    
.pull-right {
     float: right; 
}

</style>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge2/layout/menu.jsp"/>
</header>

<main class="container d-flex flex-column min-vh-100 align-items-center" style="padding-top: 50px;">
 <div class="row w-100">
  <section class="col-md-6 mx-auto" style="width: 100%;">
  			<h2>
			<c:choose>
				<c:when test="${bdtype == 'room'}">인테리어</c:when> 
				<c:when test="${bdtype == 'recipe'}">자취 레시피</c:when> 
			</c:choose>
			</h2>
    <div class="main_content">
      <!-- 상단메뉴 -->
      <div class="main_menu">
        <div style="display: flex; justify-content: center; align-items: center; margin-bottom: 8px;" >
          <p style="margin: 0;">총 게시글 ${dataCount}개 (${page} / ${total_page} 페이지)</p>
        </div>
        
        <div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 8px;">
        </div>
        </div>
        </div>
        <div style="    display: flex; justify-content: flex-end;">
          <button class="btn" onclick="location.href='${pageContext.request.contextPath}/lounge1/${bdtype}/write';">글쓰기</button>
        </div>
        </section>
    
      <!-- 글리스트 -->
      <div class="photo-grid">
        <c:forEach var="dto" items="${list}" varStatus="status">
          <div class="photo-card">
            <div class="mx-3">
              <div onclick="location.href='${articleUrl}/${dto.psnum}?${query}'">
                <table class="table table-hover m-0">		
                  <img src="${pageContext.request.contextPath}/dist/images/roomt.jpg">
                  <h4 class="ph_subject">${dto.subject}</h4>
                  <div class='ph_info'>
                      <span class='ph_userName'>${dto.nickname}</span>
                      <span>&nbsp;&nbsp;</span>
                      <span>${dto.reg_date}</span>
                    <div>
                      <i class="ph_icon bi bi-bookmark"></i>
                      <span>${dto.boardLikeCount}&nbsp;&nbsp;</span>
                      <i class="ph_icon bi bi-eye"></i>
                      <span>${dto.hitCount}&nbsp;&nbsp;</span>
                      <i class="ph_icon bi bi-chat-dots"></i>
                      <span>${dto.replyCount}&nbsp;&nbsp;</span>
                    </div>
                  </div>
                </table>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      
      <div class="page-navigation">
        ${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
      </div>
      
      <div style="display: flex; align-items: center; margin: 0 20px;">
        <!-- 검색상자 -->
        <input type="search" class="input-group searchBox">
        
        <!-- 검색버튼 -->
        <button class="input-group btn mybtn">검색</button>
      </div>
    </div> <!-- .main_content -->
  </section> <!-- .col-md-6 -->
 </div> <!-- .row -->
</main>

<footer class="mt-auto py-2 text-center w-100" style="background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
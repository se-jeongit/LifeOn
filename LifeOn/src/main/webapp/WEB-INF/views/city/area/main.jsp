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

  
   <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/area.css" type="text/css">


</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/city/layout/menu.jsp"/>
</header>
 
    <!-- 메인 콘텐츠 -->
    <main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 84px;">
        <!-- 상단 슬라이더 -->
        <div class="main-banner">
        <!-- MBTI 배너 -->
        <div class="mbti-banner" id="mbti-banner">
            <img src="${pageContext.request.contextPath}/dist/images/mbti.png" alt="MBTI 테스트 배너">
        </div>
        
        <!-- 지역 정보 -->
        <div class="top5">
            
            <div class="region-info-card">
                
                <div class="region-list">
               		 <div class="region-item">
                        <div class="region-details">
                            <h5 style="font-size: 20px;">인기순 TOP5</h5>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">1</div>
                        <div class="region-details">
                            <h5 style="font-size: 15px">가산디지털단지</h5>
                            <p style="font-size: 11px;">새로운 신흥 지구가 형성된 G.O.A.T</p>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">2</div>
                        <div class="region-details">
                            <h5>성신여대입구</h5>
                            <p>연인들에게 좋은 곳! 쇼핑가 볼거리 풍부!</p>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">3</div>
                        <div class="region-details">
                            <h5>선정릉</h5>
                            <p>높은 빌딩 사이, 한적하고 안전한 지역</p>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">4</div>
                        <div class="region-details">
                            <h5>선정릉</h5>
                            <p>높은 빌딩 사이, 한적하고 안전한 지역</p>
                        </div>
                    </div>
                    
                    <div class="region-item">
                        <div class="region-number">5</div>
                        <div class="region-details">
                            <h5>선정릉</h5>
                            <p>높은 빌딩 사이, 한적하고 안전한 지역</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
        
        <div class="search-bar">
          <input id="search-bar-input" class="search-content" type="text" placeholder="원하는 지역을 찾아보세요!"/>
          <span class="icon icon-search" ><i class="bi bi-search" style="font-size: 16px; padding-top: 3px;"></i></span>
        </div>
            
            <!-- 전체 노선 슬라이더 -->
         
                <div class="category-container">
          			<nav class="category-nav">
           			 <ul>
					    <li class="category-subcontainer">
					        <a class="category ${empty param.lnum ? 'selected' : ''}" href="<c:url value='/city/area/main'/>">전체</a>
					    </li>
				    <c:forEach var="main" items="${listCategory}">
				        <li class="category-subcontainer">
				            <a class="category ${param.lnum eq main.lnum ? 'selected' : ''}" href="<c:url value='/city/area/main?lnum=${main.lnum}'/>">${main.ssname}</a>
				        </li>
		   			</c:forEach>
				</ul>
			</nav>
		</div>
                <div style="display: flex; justify-content: flex-end; margin: 10px auto 10px; max-width: 1280px;">
          <button class="btn" onclick="location.href='${pageContext.request.contextPath}/city/area/write';">글쓰기</button>
        </div>
                <div class="route-slider-container">
            			<!-- 지역 그리드  -->
                            <div class="route-grid">
                <c:forEach var="dto" items="${list}">
		       <div class="product-item" id="${dto.rvnum}" onclick="location.href='<c:url value='${articleUrl}/${dto.rvnum}?${query}'/>'" style="cursor: pointer;">
                                <div class="route-card">
                                    <div class="route-image">
                                    <c:if test="${empty dto.thp}">
			                    	<img class="route-image" src="${pageContext.request.contextPath}/dist/images/noimage.png">
			                    	</c:if>
					                   <c:if test="${not empty dto.thp}">
                                        <img class="route-image" src="${pageContext.request.contextPath}/uploadPath/area/${dto.thp}" alt="지역사진">
					                    </c:if> 
                                    </div>
                                    <div class="route-info">
                                        <h5>${dto.rvsubject}</h5>
                                        <p>${dto.rssubject}</p>
			                                <div style="margin-top: 5px">
												<i class="tip_icon bi bi-bookmark"></i>
												<span>${dto.boardLikeCount}&nbsp;&nbsp;</span>
												<i class="tip_icon bi bi-eye"></i>
												<span>${dto.hitCount}&nbsp;&nbsp;</span>
												<i class="tip_icon bi bi-chat-dots"></i>
												<span>${dto.replyCount}&nbsp;&nbsp;</span>
						                 	 </div>
                                    </div>
                                </div>
                                
                            </div>
	          		</c:forEach>
                        
                    </div>
                </div>
        
        <div class="page-navigation" style="margin-block: auto;">
					${dataCount == 0 ? "등록된 지역정보가 없습니다." : paging}
		</div>
</main>  

<!-- MBTI 모달  -->

		<div class="modal-overlay" id="modalOverlay">
		    <!-- 모달 컨테이너 -->
		    <div class="modal-container">
		        <!-- 닫기 버튼 -->
		        <button class="close-btn" id="closeModal">&times;</button>
		        
		        <!-- 진행 상태 표시 -->
		        <div class="progress-indicator">
		            <span class="current-step">1</span>/<span class="total-steps">7</span>
		        </div>
		        
		        <!-- 질문 모달들 -->
		        <div class="modal-content" id="question1">
		            <div class="question-header">Q1.</div>
		            <div class="question-text">입대로 비싸도 &lt;더블 역세권&gt; 동네라면 대환영?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="question2">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="question2">NO!</button>
		            </div>
		        </div>
		        
		        <div class="modal-content" id="question2" style="display: none;">
		            <div class="question-header">Q2.</div>
		            <div class="question-text">동네에 맛집이 많은 것이 중요한가요?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="question3">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="question3">NO!</button>
		            </div>
		        </div>
		        
		        <div class="modal-content" id="question3" style="display: none;">
		            <div class="question-header">Q3.</div>
		            <div class="question-text">조용한 주거환경을 선호하시나요?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="question4">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="question4">NO!</button>
		            </div>
		        </div>
		        
		        <div class="modal-content" id="question4" style="display: none;">
		            <div class="question-header">Q4.</div>
		            <div class="question-text">대중교통 접근성이 좋은 곳을 선호하시나요?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="question5">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="question5">NO!</button>
		            </div>
		        </div>
		        
		        <div class="modal-content" id="question5" style="display: none;">
		            <div class="question-header">Q5.</div>
		            <div class="question-text">문화시설이 가까이 있는 것이 중요한가요?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="question6">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="question6">NO!</button>
		            </div>
		        </div>
		        
		        <div class="modal-content" id="question6" style="display: none;">
		            <div class="question-header">Q6.</div>
		            <div class="question-text">자연환경이 가까이 있는 것을 선호하시나요?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="question7">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="question7">NO!</button>
		            </div>
		        </div>
		        
		        <div class="modal-content" id="question7" style="display: none;">
		            <div class="question-header">Q7.</div>
		            <div class="question-text">동네의 안전성이 가장 중요한 요소인가요?</div>
		            <div class="answer-buttons">
		                <button class="answer-btn" data-answer="yes" data-next="result">YES!</button>
		                <button class="answer-btn" data-answer="no" data-next="result">NO!</button>
		            </div>
		        </div>
		        
		        <!-- 결과 모달 -->
		        <div class="modal-content result-modal" id="result" style="display: none;">
		            <h2 class="result-title">#똑똑똑... 혹시... 나온 집 없어요?</h2>
		            
		            <div class="result-content">
		                <p class="result-emoji">👨</p>
		                <p class="result-description">네 없어요... 서촌은 이사 온 사람들이 잘 안 나가기도 하고, 부동산 매물 수가 적어서 이사를 가고 싶어도 쉽게 이사를 갈 수 없는 동네에요. 그만큼 만족도가 높은 동네란 뜻이겠죠?</p>
		            </div>
		            
		            <div class="result-tag">#핫플</div>
		            
		            <div class="result-content">
		                <p class="result-emoji">🔥</p>
		                <p class="result-description">서촌의 동쪽은 핫한 미술관이나 박물관이 있고, 서쪽으로 가면 고즈넉한 월플레이스가 등장해. 같은 동네인데 두 가지 면모를 갖고 있는 매력적인 동네야</p>
		            </div>
		            
		            <button class="more-info-btn" id="moreInfoBtn">&lt;경복궁&gt; 살기 어떤지 궁금해?</button>
		        </div>
		    </div>
		</div>  
		     
  
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


<script type="text/javascript">
//MBTI 모달 스크립트
document.addEventListener("DOMContentLoaded", function() {
  // 필요한 요소들 선택
  const mbtiModal = {
    banner: document.getElementById("mbti-banner"),
    overlay: document.getElementById("modalOverlay"),
    closeBtn: document.getElementById("closeModal"),
    questions: {
      question1: document.getElementById("question1"),
      question2: document.getElementById("question2"),
      question3: document.getElementById("question3"),
      question4: document.getElementById("question4"),
      question5: document.getElementById("question5"),
      question6: document.getElementById("question6"),
      question7: document.getElementById("question7"),
      result: document.getElementById("result")
    },
    progressIndicator: document.querySelector(".current-step"),
    totalSteps: document.querySelector(".total-steps"),
    moreInfoBtn: document.getElementById("moreInfoBtn"),
    answers: {}
  };

  // 총 질문 수 설정
  if (mbtiModal.totalSteps) {
    mbtiModal.totalSteps.textContent = "7";
  }

  // 모달 열기 함수
  function openModal() {
    console.log("Opening modal");
    if (mbtiModal.overlay) {
      mbtiModal.overlay.style.display = "flex";
      
      // 모든 질문 숨기기
      for (const key in mbtiModal.questions) {
        if (mbtiModal.questions[key]) {
          mbtiModal.questions[key].style.display = "none";
        }
      }
      
      // 첫 번째 질문만 표시
      if (mbtiModal.questions.question1) {
        mbtiModal.questions.question1.style.display = "flex";
      }
      
      // 진행 상태 업데이트
      updateProgress(1);
    }
  }

  // 모달 닫기 함수
  function closeModal() {
    console.log("Closing modal");
    if (mbtiModal.overlay) {
      mbtiModal.overlay.style.display = "none";
      resetTest();
    }
  }

  // 다음 질문으로 이동하는 함수
  function goToNextQuestion(currentId, nextId) {
    console.log(`Moving from ${currentId} to ${nextId}`);
    
    // 현재 질문 숨기기
    const currentQuestion = mbtiModal.questions[currentId];
    if (currentQuestion) {
      currentQuestion.style.display = "none";
    }
    
    // 다음 질문 표시
    const nextQuestion = mbtiModal.questions[nextId];
    if (nextQuestion) {
      nextQuestion.style.display = "flex";
      
      // 진행 상태 업데이트 (결과 페이지가 아닌 경우)
      if (nextId !== "result" && mbtiModal.progressIndicator) {
        const step = parseInt(nextId.replace("question", ""));
        updateProgress(step);
      }
    }
  }

  // 진행 상태 업데이트 함수
  function updateProgress(step) {
    if (mbtiModal.progressIndicator) {
      mbtiModal.progressIndicator.textContent = step.toString();
    }
  }

  // 테스트 초기화 함수
  function resetTest() {
    // 모든 질문 숨기기
    for (const key in mbtiModal.questions) {
      if (mbtiModal.questions[key]) {
        mbtiModal.questions[key].style.display = "none";
      }
    }
    
    // 사용자 응답 초기화
    mbtiModal.answers = {};
  }

  // 이벤트 리스너 등록
  
  // 배너 클릭 시 모달 열기
  if (mbtiModal.banner) {
    mbtiModal.banner.addEventListener("click", openModal);
    console.log("Banner click event listener added");
  }
  
  // 닫기 버튼 클릭 시 모달 닫기
  if (mbtiModal.closeBtn) {
    mbtiModal.closeBtn.addEventListener("click", closeModal);
    console.log("Close button event listener added");
  }
  
  // 모달 외부 클릭 시 닫기
  if (mbtiModal.overlay) {
    mbtiModal.overlay.addEventListener("click", function(e) {
      if (e.target === mbtiModal.overlay) {
        closeModal();
      }
    });
  }
  
  // 더 알아보기 버튼 클릭 이벤트
  if (mbtiModal.moreInfoBtn) {
    mbtiModal.moreInfoBtn.addEventListener("click", function() {
      alert("게시글로 이동합니다!");
      // 여기에 게시글로 이동하는 코드 추가
      // 예: window.location.href = '게시글 URL';
    });
  }
  
  // 각 질문의 답변 버튼에 이벤트 리스너 추가
  for (let i = 1; i <= 7; i++) {
    const currentQuestionId = `question${i}`;
    const nextQuestionId = i < 7 ? `question${i+1}` : "result";
    
    const currentQuestion = mbtiModal.questions[currentQuestionId];
    if (currentQuestion) {
      const answerButtons = currentQuestion.querySelectorAll(".answer-btn");
      
      answerButtons.forEach(function(button) {
        button.addEventListener("click", function() {
          // 사용자 응답 저장
          mbtiModal.answers[currentQuestionId] = this.dataset.answer;
          
          // 다음 질문으로 이동
          goToNextQuestion(currentQuestionId, nextQuestionId);
        });
      });
      
      console.log(`Added event listeners to answer buttons in ${currentQuestionId}`);
    }
  }
  
  console.log("MBTI modal script initialized");
});
</script>

<footer class="mt-auto py-2 text-center w-100" style="background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
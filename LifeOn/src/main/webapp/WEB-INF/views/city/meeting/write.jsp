<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>

<style type="text/css">
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  flex-direction: column;
  justify-content: space-between;
}

.body-container {
  width: 70%; 
  padding: 30px;
  background-color: #fff;
  border: 1px solid #ccc; /* 외부 테두리 */
  border-radius: 10px; /* 둥근 테두리 */
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 */
  margin: 0 auto; /* 수평 중앙 정렬 */
}

.box-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: rgba(0, 0, 0, 0.1); /* 배경을 어둡게 */
}
.header {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}

.section {
  margin-bottom: 20px;
}

.label {
  font-size: 14px;
  font-weight: 600;
  margin-bottom: 8px;
  display: block;
}

/* 인풋박스, 드롭다운, 날짜 선택 */
.input-box,
.dropdown,
.date-picker {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 14px;
}

.date-picker-container {
        position: relative; 
    }

.input-box::placeholder,
.dropdown::placeholder,
.date-picker::placeholder {
  color: #888;
}

.button-group {
  display: flex;
  justify-content: space-between;
}

.button {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 14px;
  cursor: pointer;
}

.button.cancel {
  background-color: #f0f0f0;
  color: #333;
}

.button.submit {
  background-color: #007bff;
  color: #fff;
}

.calendar-icon {
  position: absolute;
  right: 12px; 
  top: 20%; 
  font-size: 20px;
  color: #222;
  cursor: pointer;

}

main {
  flex: 1;
  display: flex;
  justify-content: center; /* 중앙 정렬 */
  align-items: center; /* 수직 중앙 정렬 */
  padding-top: 50px; /* 헤더와 모달 사이 간격 */
  padding-bottom: 50px; /* 모달과 푸터 사이 간격 */
}
</style>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="container">
    	<div class="body-container">
        <h2> 모임 등록 </h2>
        
		<hr>
		<form name="meetingForm" method="post" enctype="multipart/form-data">
            <h4>📌 모임 정보 입력</h4>
            
        <div class="section">
            <label class="label" for="meeting-date">날짜/시간</label>
             <div class="date-picker-container">
       			 <input type="text" id="meeting-date" class="date-picker" placeholder="YYYY-MM-DD">
       			 <i id="calendar-icon" class="bi bi-calendar-check calendar-icon"></i>
    		</div>
        </div>
        
        <div class="section">
                <label for="label">카테고리</label>
                <select id="bigCategory" name="cbn" class="dropdown" required onchange="categoryCheck();">
                     <option>지역을 선택하세요</option>
		                <option>밥/카페</option>
		                <option>운동</option>
		                <option>스터디</option>
		                <option>문화생활</option>
		                <option>기타</option>
                    <c:forEach var="dto" items="${Category}">
                        <option value="${dto.cbn}">${dto.cbc}</option>
                    </c:forEach>
                </select>
            </div>

        <div class="section">
            <label class="label" for="location">지역</label>
            <select id="location" class="dropdown">
                <option>지역을 선택하세요</option>
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

        <div class="section">
            <label class="label" for="detail-location">상세 장소</label>
            <input type="text" id="detail-location" class="input-box" placeholder="상세 장소를 입력하세요">
        </div>

        <div class="section">
            <label class="label" for="age-group">연령대</label>
            <select id="age-group" class="dropdown">
                <option>연령대를 선택하세요</option>
                <option>상관 없음</option>
                <option>20대</option>
                <option>30대</option>
                <option>40대</option>
                <option>50대</option>
                <option>60대 이상</option>

            </select>
        </div>

        <div class="section">
            <label class="label" for="gender">성별</label>
            <select id="gender" class="dropdown">
                <option>성별을 선택하세요</option>
                <option>상관없음</option>
                <option>남성</option>
                <option>여성</option>
            </select>
        </div>

        <div class="section">
            <label class="label" for="participants">모집 인원</label>
            <select id="participants" class="dropdown">
                <option>모집 인원을 선택하세요</option>
                <option>1~5명</option>
                <option>6~10명</option>
                <option>10명 이상</option>
            </select>
        </div>

        <div class="section">
            <label class="label" for="title">제목</label>
            <input type="text" id="title" class="input-box" placeholder="제목을 입력하세요">
        </div>

        <div class="section">
            <label class="label" for="description">내용</label>
            <textarea id="description" class="input-box" rows="4" placeholder="모임에 대해 소개해주세요."></textarea>
        </div>

        <div class="button-group">
            <button class="button cancel">취소</button>
            <button class="button submit">등록하기</button>
        </div>
    </form>
    </div>
  </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script> 
<script>
document.addEventListener('DOMContentLoaded', function () {
    const meetingDatePicker = flatpickr("#meeting-date", {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        time_24hr: true,
        minuteIncrement: 30,
        allowInput: true,
        locale: "ko",
    });
   	 // 달력 아이콘 클릭 시 달력 열리도록 설정
       document.getElementById("calendar-icon").addEventListener("click", function() {
           meetingDatePicker.open(); // flatpickr 달력 열기
            });  
    });

</script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    p {
        margin: 0;
        padding: 0;
    }

    .detail-thumbnail-prize {
        width: 500px;
        height: 400px;
    }

    .modal-thumbnail-prize {
        width: 180px;
        height: 120px;
    }

    .detail-img-prize {
        width: 800px;
        height: 400px;
    }

    .head-main {
        padding-top: 15px;
    }

    .moneyText1 {
        font-size: 28px;
        font-weight: 600;
        color: #CA3B3B;

    }

    .moneyText2 {
        font-size: 42px;
        font-weight: 600;
        color: #CA3B3B;
    }

    .time-Text1 {
        font-size: 28px;
        font-weight: 600;

    }

    .time-Text2 {
        font-size: 35px;
        font-weight: 600;
        color: #CA3B3B;
    }

    .btn-modal {
        padding-left: 230px;
    }

    .btn-click {
        width: 200px;
        height: 50px;
        border: 0;
        background-color: rgba(207, 207, 207, 0.68);
        border-radius: 10px;
        font-size: 25px;

    }


    /* 모달 창 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed; /* 화면에 고정 */
        z-index: 1; /* 다른 요소 위에 표시 */
        left: 0;
        top: 0;
        width: 100%; /* 전체 화면 너비 */
        height: 100%; /* 전체 화면 높이 */
        overflow: auto; /* 스크롤 가능 */
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 화면 중앙에 위치 */
        padding: 20px;
        border: 1px solid #888;
        width: 500px; /* 너비 */
        height: 350px; /* 높이 */
    }

    .close {
        color: #aaa;
        position: absolute; /* 부모 요소 기준으로 절대 위치 */
        top: 10px; /* 상단에서 10px 떨어짐 */
        right: 10px; /* 우측에서 10px 떨어짐 */
        font-size: 28px; /* &times; 크기에 맞게 조정 */
        font-weight: bold;
        line-height: 1; /* &times; 크기에 맞게 조정 */
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
    }
</style>

<div style="display: flex; padding-top: 5px; margin: 10px auto; width: 1130px;">
    <img src="${pageContext.request.contextPath}/dist/images/sunset.jpg" alt="이미지" class="detail-thumbnail-prize">
    <div style="margin-left: 70px;">
        <div style="display: flex;">
            <p style="font-size: 35px; font-weight: 600; width: 330px">${prize.prName} </p>
            <div>
                <p style="font-size: 15px; padding: 5px 0 0 30px; ">판매자 : ${prize.sellerName} </p>
                <p style="font-size: 15px; padding: 0 0 0 30px; width: 270px">등록일 : ${prize.upToDate} </p>
            </div>
        </div>
        <div style="width: 560px">
            <hr style="border: 1px solid black; margin-top: 10px;">
        </div>
        <div>
            <div class="head-main" style="display: flex;">
                <div>
                    <c:if test="${prize.prStatus eq '진행전'}">
                        <p class="moneyText1">시작가 </p>
                        <p class="moneyText2"><fmt:formatNumber value="${prize.price}" type="currency"
                                                                currencySymbol="₩"/>원</p>
                    </c:if>
                    <c:if test="${prize.prStatus eq '진행중'}">
                        <p class="moneyText1">현재가 </p>
                        <p class="moneyText2"><fmt:formatNumber value="${prize.price}" type="currency"
                                                                currencySymbol="₩"/>원</p>
                    </c:if>
                    <c:if test="${prize.prStatus eq '마감'}">
                        <p class="moneyText1">낙찰가 </p>
                        <p class="moneyText2"><fmt:formatNumber value="${prize.finalP}" type="currency"
                                                                currencySymbol="₩"/>원</p>
                    </c:if>
                </div>
            </div>
            <div class="head-main">
                <c:if test="${prize.prStatus eq '진행전'}">
                    <p class="time-Text1">시작까지 남은시간 </p>
                    <p class="time-Text2"></p>
                </c:if>
                <c:if test="${prize.prStatus eq '진행중'}">
                    <p class="time-Text1">마감까지 남은시간 </p>
                    <p class="time-Text2"></p>
                </c:if>
                <c:if test="${prize.prStatus eq '마감'}">
                    <p style="padding-top: 30px; font-size: 50px;">마감</p>
                </c:if>
            </div>

            <div style="padding-top: 30px; display: flex; height: 100px">
                <p style="font-size: 20px; font-weight: 500; padding-top: 20px">거래방법 : ${prize.tradeType}</p>
                <span class="btn-modal">
                <button class="btn-click" onclick="prizeAuction('${prize.prStatus == '마감' ? '종료' : prize.prStatus == '진행중' ? '입찰' : '진행전'}')">${prize.prStatus == '마감' ? '종료' : prize.prStatus == '진행중' ? '입찰' : '진행전'}</button>
                </span>
            </div>
        </div>
    </div>
</div>

<div style="padding-top: 5px; margin: 10px auto; width: 1130px;">
    <hr style="border: 1px solid black;">

    <div style="padding-top: 30px;">
        <div style="">
            <h2 style="color: #6E6E6E">상품소개</h2>
            <p style="font-size: 18px;">
                ${prize.prContent}
            </p>
        </div>

        <div style="padding-top: 100px;">
            <h2 style="color: #6E6E6E">상품이미지</h2>
            <div style=" text-align: center;">
                <img src="${pageContext.request.contextPath}/dist/images/sunset.jpg" alt="이미지" class="detail-img-prize" style="margin: 0 auto;">
            </div>
        </div>

    </div>
</div>

<div style="padding-top: 55px; padding-bottom: 55px; margin: 10px auto; width: 1130px;">
    <hr style="border: 1px solid black;">
    <div style="height: 100px">
    </div>
    <hr style="border: 1px solid black;">
</div>


<!-- 모달 창 -->
<div id="auctionModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div>
            <div style="text-align: center">
                <p style="font-size: 25px">입찰창</p>
            </div>
            <img src="${pageContext.request.contextPath}/dist/images/sunset.jpg" alt="이미지" class="modal-thumbnail-prize">
        </div>
    </div>
</div>

<script>
    $(function () {
        let stDate = '${prize.stDate}';
        let edDate = '${prize.edDate}';
        let now = new Date();
        let austDay = new Date(stDate);
        let stRemainingTime = new Date(stDate) - now;
        let edRemainingTime = new Date(edDate) - now;
        if (stRemainingTime > 0) {
            stDate = stDate.substring(0, 16);
            $('.time-Text2').countdown({
                until: austDay,
                format: 'dHMS',
                layout: '<span class="time">' + stDate + '</span>'
            });
        } else if (edRemainingTime > 0) {
            let austDay = new Date(edDate);
            $('.time-Text2').countdown({
                until: austDay,
                format: 'dHMS',
                layout: '<span class="time">{dn}일 {hn}시간 {mn}분 {sn}초</span>'
            });
        }
    });


    // 모달 창 제어 스크립트
    function prizeAuction(status) {
        let userId = "${userId}";
        if (status === '진행전') {
            alert('아직 경매가 시작되지 않았습니다.');
        } else if (status === '입찰') {
            //TODO: 로그인 여부 확인 (다시 주석 풀어야함)
            /*
            if (userId === 'none') {
                alert('로그인 후 이용해주세요.');
                return;
            }*/
            // 모달 창 표시
            let modal = document.getElementById("auctionModal");
            modal.style.display = "block";
        } else if (status === '종료') {
            alert('경매가 종료되었습니다.');
        }
    }

    // 모달 창 닫기
    let span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        let modal = document.getElementById("auctionModal");
        modal.style.display = "none";
    }

    // 모달 창 외부 클릭 시 닫기
    window.onclick = function(event) {
        let modal = document.getElementById("auctionModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }

</script>




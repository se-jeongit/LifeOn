<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    p {
        margin: 0;
        padding: 0;
    }

    .detail-img-prize {
        width: 500px;
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


</style>

<div style="display: flex; padding-top: 5px; margin: 10px auto; width: 1130px;">
    <img src="${pageContext.request.contextPath}/dist/images/sunset.jpg" alt="이미지" class="detail-img-prize">
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
                <div style=" padding-left : 200px; font-size: 40px; font-weight: 300">
                    <p> ${prize.prStatus} </p>
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
                <button class="btn-click">${prize.prStatus == '마감' ? '종료' : prize.prStatus == '진행중' ? '입찰' : '진행전'}</button>
                </span>
            </div>

        </div>
    </div>
</div>

<div style="padding-top: 5px; margin: 10px auto; width: 1130px;">
    <hr style="border: 1px solid black;">
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


</script>


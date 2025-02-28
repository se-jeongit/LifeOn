<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 상품 스크립트문  --%>
<%-- 카테고리 이동후 클릭시 실행 안됨 --%>
<script>
    function tagMove(event) {
        // 모든 tag-line 요소에서 select-line 클래스를 제거합니다.
        document.querySelectorAll('.tag-line').forEach(tag => {
            tag.classList.remove('select-line');
        });

        // 클릭한 요소에 select-line 클래스를 추가합니다.
        event.target.classList.add('select-line');
    }

    document.addEventListener('DOMContentLoaded', function () {
        // 각 tag-line 요소에 이벤트 리스너를 추가합니다.
        document.querySelectorAll('.tag-line').forEach(tag => {
            tag.addEventListener('click', tagMove);
        });
    });
</script>

<script>
    $(function () {
        $('.span-img').each(function (index, element) {
            let stDate = $(element).data('stdate');
            let edDate = $(element).data('eddate');
            let prName = $(element).data('prname');
            let now = new Date();
            let austDay = new Date(stDate);
            let stRemainingTime = new Date(stDate) - now;
            let edRemainingTime = new Date(edDate) - now;

            if (stRemainingTime > 0) {
                $(element).find('.prize-name.remaining-time').countdown({
                    until: austDay,
                    format: 'dHMS',
                    layout: prName + '<span class="time-content">오픈시간</span>' +
                        '<span class="time">{dn}일 {hn}시간 {mn}분 {sn}초</span>'
                });
            } else if (edRemainingTime > 0) {
                austDay = new Date(edDate);
                $(element).find('.prize-name.remaining-time').countdown({
                    until: austDay,
                    format: 'dHMS',
                    layout: prName + '<span class="time-content">마감시간</span>' +
                        '<span class="time">{dn}일 {hn}시간 {mn}분 {sn}초</span>'
                });
            }
        });
    });


    //  상품 상세페이지로 이동
    function prizeMove(num) {

        location.href = "${pageContext.request.contextPath}/auction/prizeDetail?pnum=" + num;

    }

</script>



<style>
    .tag-line {
        margin: auto;
        width: 150px;
        cursor: pointer;
        font-size: 25px;
        text-align: center;
        display: inline-block;
    }

    .select-line {
        border: 3px solid #A2A2A2;
        border-bottom: none;
        padding: 5px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .prize-line {
        border: 3px solid #A2A2A2;
        padding: 12px;
        margin: auto;
        width: 1300px;
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start; /* Align items to the left */
    }

    .span-img {
        width: 250px;
        height: 350px;
        padding: 15px 20px 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: left; /* Align text to the left */
        cursor: pointer;
        margin: 10px; /* Add margin to space out items */
    }

    .span-img div {
        width: 95%; /* Make div take full width of span-img */
    }

    .span-img p {
        margin: 0 0; /* Set top and bottom margin to 0 */
    }

    .span-img span {
        margin: 0; /* Set top and bottom margin to 0 */
    }

    .img-prize {
        width: 200px;
        height: 200px;
    }

    .prize-name {
        font-size: 20px;
        font-weight: bold;
    }

    .price1 {
        font-size: 15px;
        color: #CA3B3B;
    }

    .price2 {
        font-size: 20px;
        color: #CA3B3B;
    }

    .time {
        font-size: 12px;
        float: right;
        display: flex;
        align-items: flex-end;
        justify-content: flex-end;
    }

    .time-content {
        font-size: 12px;
        float: right;
        display: flex;
        align-items: flex-end;
        justify-content: flex-end;
        height: 29%;
    }

    .situation {
        font-size: 20px;
        float: right;
        display: flex;
        align-items: flex-end;
        justify-content: flex-end;
        color: black;
    }

    .last-line {
        font-size: 13px;
    }
</style>


<div style="padding-top: 5px; margin: 10px auto; width: 1000px;">
    <div style="padding-top: 5px; width: 1000px;">
    <span class="tag-line select-line" onclick="tagMove(event)">
        전체
    </span>
        <span class="tag-line" onclick="tagMove(event)">
        시작전 상품
    </span>
        <span class="tag-line" onclick="tagMove(event)">
        진행중 상품
    </span>
    </div>
    <div style="display: flex; justify-content: center;">
        <div class="prize-line">
            <c:forEach var="in" items="${category.prizeList}">
                <div style="display: flex; justify-content: center;">
                    <c:forEach var="out" items="${in}">
                        <span class="span-img" data-stdate="${out.stDate}"
                              data-prname="${out.prName}" data-eddate="${out.edDate}" onclick="prizeMove(${out.pnum})">
                            <img src="${pageContext.request.contextPath}/uploads/seller/${out.thumbnail}" alt="상품 이미지"
                                 class="img-prize">
                            <div>
                                <p class="prize-name remaining-time">
                                        ${out.prName}
                                </p>
                                <c:if test="${out.prStatus == '진행중'}">
                                    <p class="price1">현재가</p>
                                </c:if>
                                <c:if test="${out.prStatus == '진행전'}">
                                    <p class="price1">시작가</p>
                                </c:if>
                                <c:if test="${out.prStatus == '마감'}">
                                    <p class="price1">낙찰가</p>
                                </c:if>
                                <p class="price2">
                                    <fmt:formatNumber value="${out.price}" type="currency" currencySymbol="₩"/>원
                                    <span class="situation">${out.prStatus}</span>
                                </p>
                                <p class="last-line">
                                    판매자 : ${out.sellerName}
                                    <span class="time">거래방식 : ${out.tradeType}</span>
                                </p>
                            </div>
                        </span>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </div>
</div>






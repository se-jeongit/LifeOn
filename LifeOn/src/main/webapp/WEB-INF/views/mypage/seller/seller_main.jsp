<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LifeOn</title>

    <%-- TODO 진행전, 중, 성공 ,실패 미완 --%>

    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu3.css" type="text/css">
    <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/menu2.js"></script> -->
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        p {
            margin: 0;
            padding: 0;
        }


        .btn-seller {
            width: 300px;
            padding: 0;

        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .table th {
            background-color: #f4f4f4;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }


        .wrapper {
            display: flex;
            padding: 20px 20px 20px 350px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 8px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .table td {
            border: 1px solid #ddd;
            padding: 5px 0 5px 0;
            text-align: center;
        }

        .table th {
            background-color: #f4f4f4;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-order {

            background-color: #28a745;
            color: white;
        }

        .status-tabs {
            display: flex;
            gap: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        .status-tabs a {
            text-decoration: none;
            color: black;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .status-tabs a.active {
            background-color: #007bff;
            color: white;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .search-date {
            width: 100px;
            border: 1px solid rgba(184, 184, 184, 0.59);
            border-radius: 8px;

        }

        .search-date-btn {
            border: 0;
            width: 80px;
            height: 30px;
            border-radius: 8px;
            background: #b8b6b6;
            color: white;
            font-size: 13px;
            font-weight: 100;
        }

        .container-seller {
            width: 1300px;
        }

        .search-date::placeholder {
            color: #c8c8c8;
        }

        .sell-select-box {
            border: 0;
            border-radius: 8px;
            width: 100px;
            height: 30px;
            background: #e6e6e6
        }

        .registration-btn {
            background: rgba(29, 35, 39, 0.38);
            margin-left: 10px;
        }

        .sell-btn {
            display: flex;
            padding: 30px 0 30px 0;
            gap: 10px;
            align-items: center;

        }

    </style>

    <script !src="">
        function dateSearch() {
            location.href = "${pageContext.request.contextPath}/mypage/seller/info?stDate=" + $(".search-date:eq(0)").val() + "&edDate=" + $(".search-date:eq(1)").val();
        }
    </script>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="wrapper">
    <jsp:include page="/WEB-INF/views/admin/layout/left.jsp"/>
    <div class="container-seller">
        <h2>경매 상품목록</h2>
        <div class="d-flex flex-column align-items-start w-100">
            <div>
                <p style="font-size: 30px; font-weight: 500;">판매내역</p>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center w-100">
            <label style="padding-top: 10px; font-size: 13px;">
                <div>
                    등록일 기반 검색
                </div>
                <input class="search-date" type="date" value="${stDate}"> ~
                <input class="search-date" type="date" value="${edDate}">
                <button class="search-date-btn" onclick="dateSearch()">기간적용</button>
            </label>
            <div class="d-flex">
                <button type="button" class="btn registration-btn"
                        onclick="location.href='<c:url value='/mypage/seller/registration'/>'">상품 등록
                </button>
            </div>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>번호</th>
                <th>경매 상태</th>
                <th>경매기간</th>
                <th>상품</th>
                <th>등록일</th>
                <th>판매방법</th>
                <th>비고</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="prize" items="${prizeList}" varStatus="status">
                <tr>
                    <td>${dataCount - (page-1) * size - status.index}</td>
                    <td>[${prize.prStatus}]</td>
                    <td class="date-check" data-st="${prize.stDate}" data-ed="${prize.edDate}">
                        시작일 : ${prize.stDate}<br>
                        종료일 : ${prize.edDate}<br><br>
                        <p id="date-time">

                        </p>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/auction/prizeDetail?pnum=${prize.pnum}">
                            <img src="${pageContext.request.contextPath}/uploads/seller/${prize.thumbnail}" alt="상품 이미지"
                                 width="50">
                            <br>${prize.prName}
                            <br>현재가 : <fmt:formatNumber value="${prize.price}" type="currency"/>
                            <br>낙찰가 : <fmt:formatNumber value="${prize.finalP}" type="currency"/>
                        </a>
                    </td>
                    <td>${prize.upToDate}</td>
                    <td>${prize.tradeType}</td>
                    <td class="btn-seller">
                        <div class="sell-btn">
                            <c:if test="${prize.prStatus eq '진행중'}">
                                <span style="padding-left: 10px;"></span>
                            </c:if>
                            <c:if test="${prize.prStatus ne '진행중'}">
                                <span style="padding-left: 55px;"></span>
                            </c:if>
                            <button class="btn btn-order"
                                    onclick="location.href='${pageContext.request.contextPath}/mypage/seller/seller-update?pnum=${prize.pnum}'">
                                수정하기
                            </button>
                            <c:if test="${prize.prStatus eq '마감'}">
                                <button class="btn btn-edit">판매완료</button>
                            </c:if>
                            <c:if test="${prize.prStatus eq '진행중'}">
                                <button class="btn btn-delete"
                                        onclick="if(confirm('진짜 낙찰처리 하시겠습니까?')) location.href='${pageContext.request.contextPath}/mypage/seller/bidding?pnum=${prize.pnum}'">
                                    낙찰처리
                                </button>
                            </c:if>
                            <c:if test="${prize.prStatus ne '마감'}">
                                <button class="btn btn-delete"
                                        onclick="if(confirm('진짜 경매를 취소 하시겠습니까?')) location.href='${pageContext.request.contextPath}/mypage/seller/seller-delete?pnum=${prize.pnum}'">
                                    경매취소
                                </button>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="page-navigation">
            ${dataCount == 0 ? "상품목록이 없습니다." : paging}
        </div>
    </div>
</main>


<script type="text/javascript">

    $(function () {
        $('.date-check').each(function (index, element) {
            let stDate = $(element).data('st');
            let edDate = $(element).data('ed');
            let now = new Date();
            let austDay = new Date(stDate);
            let stRemainingTime = new Date(stDate) - now;
            let edRemainingTime = new Date(edDate) - now;

            if (stRemainingTime > 0) {
                $(element).find('#date-time').countdown({
                    until: austDay,
                    format: 'dHMS',
                    layout: '<span class="time-content">오픈시간</span> <br>' +
                        '<span class="time">{dn}일 {hn}시간 {mn}분 {sn}초</span>'
                });
            } else if (edRemainingTime > 0) {
                austDay = new Date(edDate);
                $(element).find('#date-time').countdown({
                    until: austDay,
                    format: 'dHMS',
                    layout: '<span class="time-content">마감시간</span> <br>' +
                        '<span class="time">{dn}일 {hn}시간 {mn}분 {sn}초</span>'
                });
            }
        });
    });


</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
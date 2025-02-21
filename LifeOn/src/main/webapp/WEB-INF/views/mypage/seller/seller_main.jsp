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

    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu3.css" type="text/css">
    <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/menu2.js"></script> -->
    <style>
        p {
            margin: 0;
            padding: 0;
        }

        .sejin-table th, .sejin-table td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .sejin-table th {
            background: #EAEAEA;
            font-size: 1.2rem;
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

        .low-stock {
            color: red;
            font-weight: bold;
        }

        .thumbnail {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
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
    </style>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="d-flex flex-column min-vh-100" style="padding-top: 54px; padding-left: 210px;">
    <jsp:include page="/WEB-INF/views/mypage/left.jsp"/>
    <div class="container d-flex flex-column align-items-center">
        <div class="d-flex flex-column align-items-start w-100">
            <div>
                <p style="font-size: 30px; font-weight: 500;">판매내역</p>
            </div>
            <div>
                <p style="padding-top: 5px; margin-bottom: 0; font-size: 18px;">판매목록 | 전체 2건</p>
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center w-100">
            <label style="padding-top: 10px; font-size: 13px;">
                <input class="search-date" type="text" placeholder=" 시작일"> ~ <input class="search-date" type="text"
                                                                                    placeholder=" 종료일">
                <button class="search-date-btn">기간적용</button>
            </label>
            <div class="d-flex">
                <label style="padding-top: 3px;">
                    <select class="sell-select-box">
                        <option value="all">&nbsp;전체</option>
                        <option value="auction">&nbsp;경매</option>
                        <option value="rental">&nbsp;물품대여</option>
                    </select>
                </label>
                <button type="button" class="btn registration-btn"
                        onclick="location.href='<c:url value='/mypage/seller/registration'/>'">상품 등록
                </button>
            </div>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>썸네일</th>
                <th>상품명</th>
                <th>업체명</th>
                <th>카테고리 (대 / 소)</th>
                <th>현재 재고</th>
                <th>공동구매 등록여부</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><img src="${pageContext.request.contextPath}/dist/images/profile.png" alt="상품 이미지"
                         class="thumbnail"></td>
                <td>유기농 사과</td>
                <td>자연농원</td>
                <td>과일 / 사과</td>
                <td class="">20 개</td>
                <td>
                    <button type="button"
                            onclick="location.href='${pageContext.request.contextPath}/admin/productManage/register'"
                            class="btn btn-primary mt-3">공동구매 등록
                    </button>
                </td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/dist/images/profile.png" class="thumbnail"></td>
                <td>신선한 딸기</td>
                <td>베리팜</td>
                <td>과일 / 딸기</td>
                <td class="low-stock">3 개</td>
                <td>
                    <button type="button"
                            onclick="location.href='${pageContext.request.contextPath}/admin/productManage/register'"
                            class="btn btn-primary mt-3">공동구매 등록
                    </button>
                </td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/dist/images/profile.png" class="thumbnail"></td>
                <td>무항생제 계란</td>
                <td>청정농장</td>
                <td>유제품 / 계란</td>
                <td>50 개</td>
                <td>
                    <button type="button"
                            onclick="location.href='${pageContext.request.contextPath}/admin/productManage/register'"
                            class="btn btn-primary mt-3">공동구매 등록
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</main>

<script type="text/javascript">


</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
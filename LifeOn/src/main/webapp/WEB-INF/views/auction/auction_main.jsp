<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/photo.css" type="text/css">
    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
    <style>
        .main-container {
            width: 100%;
            max-width: 1820px;
        }

        .resent {
            padding-top: 50px;
            position: fixed;
            top: 160px;
            right: 40px;
            z-index: 1000;
        }

    </style>

    <style>

        .category-text {
            margin-left: 5px;
            margin-right: 20px;
            cursor: pointer;
        }

        .main-category {
            font-size: 18px;
            display: flex;
            list-style: none;
            padding: 5px 10px;
            margin-bottom: 5px;
        }
    </style>


    <title>LifeOn</title>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
    <jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>

<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 10px;">
    <div class="main-container">
        <div class="resent">
            <jsp:include page="/WEB-INF/views/layout/rmaket.jsp"/>
        </div>
        <div class="container">
            <h3 style="padding-top: 30px; padding-left: 120px">경매장</h3>
            <div style="border: 2px solid #e9ecef; padding: 0; margin: 5px auto; width: 1000px;">
                <div id="category-container">
                    <c:if test="${category.categoryType != 'all'}">
                                <span style="font-size: 18px; cursor: pointer; position: relative; bottom: -5px;"
                                      onClick="toggleAllCategory()">
                                    ←&nbsp;&nbsp;${category.categoryBigName}
                        </span>
                    </c:if>
                    <ul id="main-category" class="main-category">
                        <c:if test="${category.categoryType eq 'all'}">
                            <c:forEach var="category" items="${category.categoryList}">
                                <li class="category-text"
                                    onclick="toggleBigCategory(${category.cbn},'big','${category.cbc}','${category.cbc}')">${category.cbc}</li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${category.categoryType eq 'big' || category.categoryType eq 'small'}">
                            <li class="category-text"
                                onclick="toggleSmallCategory(${category.cbn},'big','${category.categoryBigName}','전체')"
                                style="${param.categoryName eq '전체' || param.categoryType eq 'big' ? 'color: #006AFF' : ''}">전체
                            </li>
                            <c:forEach var="categoryBig" items="${category.categoryList}">
                                <li class="category-text"
                                    onclick="toggleSmallCategory(${category.cbn},'small','${category.categoryBigName}','${categoryBig.csc}')"
                                    style="${category.categoryType eq 'small' && (categoryBig.csc eq param.categoryName || param.categoryName eq '전체') ? 'color: #006AFF' : ''}">${categoryBig.csc}</li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div id="auction-main-prize">
                <jsp:include page="/WEB-INF/views/auction/auction_main_prize.jsp"/>
            </div>
        </div>
        <div class="page-navigation">
            ${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
        </div>
    </div>
</main>


<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>


<script !src="">

    function toggleAllCategory() {
        let url = `${pageContext.request.contextPath}/auction`;

        location.href = url;
    }

    function toggleBigCategory(cbn, categoryType, BCategoryName, categoryName,) {
        let url = `${pageContext.request.contextPath}/auction`;

        let rCategoryType = encodeURIComponent(categoryType);
        let rCategoryName = encodeURIComponent(categoryName);

        let searchType = '';
        let searchTerm = '';
        let page = 1;

        location.href = url + '/category?cbn=' + cbn + '&categoryType=' + rCategoryType + '&categoryName=' + rCategoryName + '&searchType=' + searchType + '&searchTerm=' + searchTerm + '&page=' + page;


    }


    function toggleSmallCategory(cbn, categoryType, BCategoryName, categoryName,) {
        let url = `${pageContext.request.contextPath}/auction`;

        let rCategoryType = encodeURIComponent(categoryType);
        let rCategoryName = encodeURIComponent(categoryName);

        let searchType = '';
        let searchTerm = '';
        let page = 1;

        let BigCategoryName = encodeURIComponent(BCategoryName);
        location.href = url + '/category?cbn=' + cbn + '&categoryType=' + rCategoryType + '&categoryBName=' + BigCategoryName + '&categoryName=' + rCategoryName + '&searchType=' + searchType + '&searchTerm=' + searchTerm + '&page=' + page;


    }


</script>






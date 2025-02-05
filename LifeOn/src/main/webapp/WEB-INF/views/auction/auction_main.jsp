<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <style>
        .main-container {
            width: 100%;
            max-width: 1820px;
        }

        .resent {
            padding-top: 50px;
            position: fixed;
            top: 66px;
            right: 40px;
            z-index: 1000;
        }
    </style>
    <title>LifeOn</title>

    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="main-container">
        <div class="resent">
            <jsp:include page="/WEB-INF/views/layout/rmaket.jsp"/>
        </div>
        <div class="container">
            <h3 style="padding-top: 30px; padding-left: 120px">경매장</h3>
            <div style="border: 2px solid #e9ecef; padding: 10px; margin: 10px auto; width: 1000px;">
                <div id="category-container">
                    <ul id="main-category" style="display: flex; list-style: none; padding: 0;">
                        <c:forEach var="category" items="${category.categoryList}">
                            <li style="margin-right: 20px; cursor: pointer;"
                                onclick="toggleSubCategory(${category.cbn},'big','${category.cbc}')">${category.cbc}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
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
    function toggleSubCategory(cbn,categoryType, categoryName) {
        let url = '${pageContext.request.contextPath}/auction/category';

        if (categoryType === 'small') {
            let params = {
                cbn : cbn,
                categoryType: "big",
                pageNo: 0,
                searchType: '',
                searchTerm: ''
            };

            const fn = function (data) {
                addNewContent(data);
            }

            ajaxRequest(url, 'post', params, 'json', fn);

        } else if (categoryType === 'big') {
            let params = {
                cbn : cbn,
                categoryType: "small",
                pageNo: 0,
                categoryName: '',
                searchType: '',
                searchTerm: ''
            };

            const fn = function (data) {
                console.log(data);
                addNewContent(data);
            }

            ajaxRequest(url, 'post', params, 'json', fn);
        }

    }

    function addNewContent(data) {
        const categoryContainer = document.getElementById('category-container');

        categoryContainer.innerHTML = '';

        if (data.categoryType === 'small' || data.categoryType === 'final') {
            const backButton = document.createElement('span');
            backButton.textContent = '←';
            backButton.style.cursor = 'pointer';
            backButton.onclick = () => toggleSubCategory(0, 'small');
            categoryContainer.appendChild(backButton);
        }

        const mainCategoryList = document.createElement('ul');
        mainCategoryList.id = 'main-category';
        mainCategoryList.style.display = 'flex';
        mainCategoryList.style.listStyle = 'none';
        mainCategoryList.style.padding = '0';

        if (data.categoryType === 'small') {
            data.categoryList.forEach(category => {
                const listItem = document.createElement('li');
                listItem.style.marginRight = '20px';
                listItem.style.cursor = 'pointer';
                listItem.textContent = category.csc;
                listItem.onclick = () => toggleSubCategory(category.cbn,'final', category.csc);
                mainCategoryList.appendChild(listItem);
            });
        }else if (data.categoryType === 'big') {
            data.categoryList.forEach(category => {
                const listItem = document.createElement('li');
                listItem.style.marginRight = '20px';
                listItem.style.cursor = 'pointer';
                listItem.textContent = category.cbc;
                listItem.onclick = () => toggleSubCategory(category.cbn,'big', category.cbc);
                mainCategoryList.appendChild(listItem);
            });
        }else if (data.categoryType === 'final') {
            //TODO 소분류 클릭하여 클릭한 소분류 띄우기
            data.categoryList.forEach(category => {
                const listItem = document.createElement('li');
                listItem.style.marginRight = '20px';
                listItem.style.cursor = 'pointer';
                listItem.textContent = category.csc;
                listItem.onclick = () => toggleSubCategory(category.cbn,'small', category.csc);
                mainCategoryList.appendChild(listItem);
            });
        }


        categoryContainer.appendChild(mainCategoryList);
    }

</script>


<%--
<script>
    let currentMainCategory = null;
    let currentSubCategory = null;

    function toggleSubCategory(id, isMainCategory = false) {
        if (isMainCategory) {

            if (currentMainCategory !== id) {
                document.querySelectorAll('.sub-category').forEach(function (el) {
                    el.style.display = 'none';
                });
                currentMainCategory = id;
                currentSubCategory = null;
            }
        } else {
            if (currentSubCategory !== id) {
                if (currentSubCategory) {
                    document.querySelectorAll(`#${currentSubCategory}.sub-category`).forEach(function (el) {
                        el.style.display = 'none';
                    });
                }
                currentSubCategory = id;
            }
        }

        let el = document.getElementById(id);
        if (el.style.display === 'none' || el.style.display === '') {
            el.style.display = 'block';
        } else {
            el.style.display = 'none';
        }
    }
</script>

--%>
<%--
<script>
    let currentMainCategory = null;
    let currentSubCategory = null;

    function toggleSubCategory(id, isMainCategory = false) {
        if (isMainCategory) {
            // 다른 상위 카테고리가 클릭되면 모든 하위 카테고리를 숨깁니다.
            if (currentMainCategory !== id) {
                document.querySelectorAll('.sub-category').forEach(function(el) {
                    el.style.display = 'none';
                });
                currentMainCategory = id;
                currentSubCategory = null;
            }
        } else {
            // 다른 하위 카테고리가 클릭되면 해당 하위 카테고리의 하위만 숨깁니다.
            if (currentSubCategory !== id) {
                if (currentSubCategory) {
                    document.querySelectorAll(`#${currentSubCategory} .sub-category`).forEach(function(el) {
                        el.style.display = 'none';
                    });
                }
                currentSubCategory = id;
            }
        }

        // 선택된 하위 카테고리 또는 하위 하위 카테고리를 토글합니다.
        let el = document.getElementById(id);
        if (el.style.display === 'none' || el.style.display === '') {
            el.style.display = 'block';
        } else {
            el.style.display = 'none';
        }
    }
</script>

                    <c:if test="${smallCategory} != null">
                        <ul id="sub-category-${category.csn}" class="sub-category" style="display: none;">
                            <c:forEach var="subCategory" items="${category.subCategoryList}">
                                <li style="cursor: pointer"
                                    onclick="toggleSubCategory('sub-sub-category-${subCategory.cbn}', false)">${subCategory.cbc}</li>
                            </c:forEach>
                        </ul>
                    </c:if>


--%>
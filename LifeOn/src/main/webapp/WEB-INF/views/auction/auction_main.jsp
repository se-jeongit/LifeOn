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
            <jsp:include page="/WEB-INF/views/auction/auction_main_content.jsp"/>
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

    function toggleSubCategory(cbn, categoryType, categoryName) {
        const url = `${pageContext.request.contextPath}/auction/category`;
        const params = {
            cbn: cbn,
            categoryType: categoryType === 'small' ? 'big' : categoryType === 'big' ? 'small' : 'final',
            categoryName: categoryName || '',
            searchType: '',
            searchTerm: ''
        };

        const fn = function (data) {
            console.log(data);
            addNewContent(data);
        };

        ajaxRequest(url, 'post', params, 'json', fn);
    }

    function addNewContent(data) {
        const categoryContainer = document.getElementById('category-container');
        const mainCategoryList = document.createElement('ul');
        if (data.categoryType === 'small' || data.categoryType === 'big') {
            mainCategoryList.id = 'main-category';
            mainCategoryList.style.display = 'flex';
            mainCategoryList.style.listStyle = 'none';
            mainCategoryList.style.padding = '0';
        }



        if (data.categoryType === 'small') {
            categoryContainer.innerHTML = '';

            const backButton = document.createElement('span');
            backButton.textContent = '←         ' + data.categoryName;
            backButton.style.cursor = 'pointer';
            backButton.onclick = () => toggleSubCategory(0, 'small');
            categoryContainer.appendChild(backButton);

            extracted(data);

        }else if (data.categoryType === 'big') {
            categoryContainer.innerHTML = '';
            extracted(data);

        }else if (data.categoryType === 'final') {
            const listItems = categoryContainer.querySelectorAll('li');
            listItems.forEach(item => {
                if (item.textContent === data.categoryName) {
                    item.style.color = '#006AFF';
                    item.style.fontWeight = 'bold';
                } else {
                    item.style.color = '';
                    item.style.fontWeight = '';
                }
            });

        }
        categoryContainer.appendChild(mainCategoryList);
    }

    // TODO 웹에서의 실행상태 미확인(코드 미완성일수 있음)
    function extracted(data) {
        let content = data.categoryType === 'small' ? 'csc' : 'cbc';
        let type  = data.categoryType === 'small' ? 'final' : 'big';

        data.categoryList.forEach(category => {
            const listItem = document.createElement('li');
            listItem.style.marginRight = '20px';
            listItem.style.cursor = 'pointer';
            listItem.textContent = category.csc;
            listItem.onclick = () => toggleSubCategory(category.cbn, type, category[content]);
            mainCategoryList.appendChild(listItem);
        });


    }

</script>


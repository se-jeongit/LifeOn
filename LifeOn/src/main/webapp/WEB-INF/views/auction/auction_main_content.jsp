<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

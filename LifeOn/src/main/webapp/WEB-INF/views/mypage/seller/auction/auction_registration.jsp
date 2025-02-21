<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LifeOn</title>

    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/free.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu3.css" type="text/css">

    <style>
        .write-content {
            width: 800px;
        }

        .write-form {
            width: 100%;
        }

        .input-name {
            width: 200px;
            height: 30px;
        }

        .input-price {
            width: 100px;
            height: 25px;
        }

        .select-box-prize {
            text-align: left;
            display: flex;
            align-items: center;
            padding: 13px 0 8px 0;
            font-size: 18px;
        }

        .price-box-prize {
            text-align: left;
            display: flex;
            align-items: center;
            padding: 7px 0 8px 0;
            font-size: 18px;
        }

        .sell-select-box {
            width: 100px;
            height: 30px;
        }

        .box-color {
            border: 1px solid #cfcfcf;
            border-radius: 8px;
        }

        .input-date {
            width: 120px;
            height: 30px;
        }

        .hh-select-box {
            text-align: center;
            text-align-last: center;
            width: 50px;
            height: 30px;
        }

        .tt-select-box {
            text-align: center;
            text-align-last: center;
            width: 60px;
            height: 30px;
        }

        .select-box {
            width: 100px;
            height: 30px;
        }
    </style>

    <script !src="">
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.querySelector('input[name="startDate"]').setAttribute('min', today);
            document.querySelector('input[name="endDate"]').setAttribute('min', today);
        });

        document.addEventListener('DOMContentLoaded', function() {
            const now = new Date();
            const currentHour = now.getHours();
            const currentMinute = now.getMinutes();

            const stTT = document.getElementById('stTT');
            const stHH = document.getElementById('stHH');
            const stMM = document.getElementById('stMM');
            const edTT = document.getElementById('edTT');
            const edHH = document.getElementById('edHH');
            const edMM = document.getElementById('edMM');


            if (currentHour >= 12) {
                stTT.querySelector('option[value="am"]').disabled = true;
                edTT.querySelector('option[value="am"]').disabled = true;
            }

            function updateOptions(timeSelect, hourSelect, minuteSelect) {
                const selectedTT = timeSelect.value;
                Array.from(hourSelect.options).forEach(option => {
                    const hour = parseInt(option.value, 10);
                    if ((selectedTT === 'am' && hour < currentHour % 12) || (selectedTT === 'pm' && hour < (currentHour % 12 || 12))) {
                        option.disabled = true;
                    } else {
                        option.disabled = false;
                    }
                });

                Array.from(minuteSelect.options).forEach(option => {
                    const minute = parseInt(option.value, 10);
                    if (selectedTT === (currentHour >= 12 ? 'pm' : 'am') && parseInt(hourSelect.value, 10) === (currentHour % 12 || 12) && minute-10 < currentMinute) {
                        option.disabled = true;
                    } else {
                        option.disabled = false;
                    }
                });
            }

            stHH.value = currentHour % 12 || 12;
            stMM.value = Math.ceil(currentMinute / 5) * 5+10;
            edHH.value = currentHour % 12 || 12;
            edMM.value = Math.ceil(currentMinute / 5) * 5+10;

            // 오전/오후 설정
            document.getElementById('stTT').value = currentHour >= 12 ? 'pm' : 'am';
            document.getElementById('edTT').value = currentHour >= 12 ? 'pm' : 'am';

            stTT.addEventListener('change', function() {
                updateOptions(stTT, stHH, stMM);
            });
            stHH.addEventListener('change', function() {
                updateOptions(stTT, stHH, stMM);
            });

            edTT.addEventListener('change', function() {
                updateOptions(edTT, edHH, edMM);
            });
            edHH.addEventListener('change', function() {
                updateOptions(edTT, edHH, edMM);
            });

            updateOptions(stTT, stHH, stMM);
            updateOptions(edTT, edHH, edMM);
        });


    </script>



</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<script type="text/javascript">

    function check() {
        const f = document.freeForm;
        let str;
        const now = new Date();
        const currentHour = now.getHours();
        const currentMinute = now.getMinutes();

        str = f.prName.value.trim();
        if (!str) {
            alert('이름을 입력하세요.');
            f.prName.focus();
            return false;
        }

        str = f.startDate.value.trim();
        if (!str) {
            alert('시작일을 입력하세요.');
            f.startDate.focus();
            return false;
        } else if (str < now.toISOString().split('T')[0]) {
            alert('시작일은 오늘 이후로 입력하세요.');
            f.startDate.focus();
            return false;
        }

        str = f.startDateTime.value.trim();
        if (str === 'am' && currentHour >= 12) {
            alert('오전은 현재시간 이후로 선택하세요.');
            f.startDateTime.focus();
            return false;
        } else if (str === 'pm' && currentHour < 12) {
            alert('오후는 현재시간 이후로 선택하세요.');
            f.startDateTime.focus();
            return false;
        }

        str = f.startDateHH.value.trim();
        if (str < (currentHour % 12 || 12)) {
            alert('시작시간은 현재시간 이후로 선택하세요.');
            f.startDateHH.focus();
            return false;
        }

        let hh = f.startDateHH.value.trim();
        str = f.startDateMM.value.trim();
        if (hh < (currentHour % 12 || 12) || (hh === (currentHour % 12 || 12) && str < Math.ceil(currentMinute / 5) * 5 + 5)) {
            alert('시작분은 현재시간보다 10분 이후로 선택하세요.');
            f.startDateMM.focus();
            return false;
        }

        str = f.endDate.value.trim();
        if (!str) {
            alert('종료일을 입력하세요.');
            f.endDate.focus();
            return false;
        } else if (str < now.toISOString().split('T')[0]) {
            alert('종료일은 오늘 이후로 입력하세요.');
            f.endDate.focus();
            return false;
        }

        const startDate = new Date(f.startDate.value);
        const endDate = new Date(f.endDate.value);
        if (endDate < startDate) {
            alert('종료일은 시작일보다 늦을 수 없습니다.');
            f.endDate.focus();
            return false;
        }

        str = f.endDateHH.value.trim();
        if (str < (currentHour % 12 || 12)) {
            alert('종료시간은 현재시간 이후로 선택하세요.');
            f.endDateHH.focus();
            return false;
        }
        hh = f.endDateHH.value.trim();
        str = f.endDateMM.value.trim();
        if (endDate.getTime() === startDate.getTime() && (hh < f.startDateHH.value.trim() || (hh === f.startDateHH.value.trim() && str < f.startDateMM.value.trim()))) {
            alert('종료시간은 시작시간보다 늦을 수 없습니다.');
            f.endDateMM.focus();
            return false;
        }

        str = f.sellBox.value.trim();
        if (str === 'none') {
            alert('상품의 종류를 선택하세요.');
            f.sellBox.focus();
            return false;
        }

        str = f.prPrice.value.trim();
        if (!str) {
            alert('가격을 입력하세요.');
            f.prPrice.focus();
            return false;
        }

        str = f.mainCategory.value.trim();
        if (str === 'none') {
            alert('대분류를 선택하세요.');
            f.mainCategory.focus();
            return false;
        }

        str = f.subCategory.value.trim();
        if (str === 'none') {
            alert('소분류를 선택하세요.');
            f.subCategory.focus();
            return false;
        }

        str = f.content.value.trim();
        if (!str || str === '<p><br></p>') {
            alert('내용을 입력하세요.');
            f.content.focus();
            return false;
        }

        f.action = '${pageContext.request.contextPath}/lounge2/tip/${mode}';
        f.submit();
    }

</script>

<main class="min-vh-100">
    <jsp:include page="/WEB-INF/views/mypage/left.jsp"/>
    <div class="body-container" style="margin-left: 10%; margin-top: 20px;">
        <div class="body-content" style="margin-left: 20%; margin-top: 20px;">
            <div class="write-content">
                <div class="write-content" style="margin-top: 60px;">
                    <div style="text-align: left; font-size: 30px;">
                        상품등록창
                    </div>
                </div>
                <form name="freeForm" class="freeForm" method="post" enctype="multipart/form-data">
                    <div class="write-form">
                        <div class="form-row" style="text-align: left; display: flex; align-items: center;">
                            <span style="width: 128px; font-size: 20px;">상품이름 입력</span>
                            <span style="flex-grow: 1;">
                                <input type="text" name="prName" maxlength="100" class="input-name box-color"
                                       value="${prize.prName}">
                                <input type="hidden" class="form-control-plaintext"
                                       value="${sessionScope.member.nickName}">
                            </span>
                            <span style="font-size: 15px">
                                시작일 :
                                <label>
                                    <input type="date" name="startDate" class="input-date box-color"
                                           value="${prize.startDate}" placeholder="">
                                   <select name="startDateTime" id="stTT" class="tt-select-box box-color">
                                        <option value="am">&nbsp;오전</option>
                                        <option value="pm" selected>&nbsp;오후</option>
                                    </select>
                                    <select name="startDateHH" id="stHH" class="hh-select-box box-color">
                                        <c:forEach var="i" begin="1" end="12">
                                            <option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>시
                                    <select name="startDateMM" id="stMM" class="hh-select-box box-color">
                                        <c:forEach var="i" begin="0" end="50" step="5">
                                            <option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>분
                                </label>
                            </span>
                        </div>
                        <div class="select-box-prize">
                            <span style="padding-right: 10px;">
                                    <label>
                                        상품의 종류
                                        <select name="sellBox" class="sell-select-box box-color">
                                            <option value="none">&nbsp;선택</option>
                                            <option value="auction">&nbsp;경매</option>
                                            <option value="rental">&nbsp;물품대여</option>
                                        </select>
                                    </label>
                            </span>
                            <span style="font-size: 15px; padding-left: 172px;">
                                종료일 :
                                 <label>
                                    <input type="date" name="endDate" class="input-date box-color"
                                           value="${prize.endDate}">
                                    <select name="endDateTime" id="edTT" class="tt-select-box box-color">
                                        <option value="am">&nbsp;오전</option>
                                        <option value="pm" selected>&nbsp;오후</option>
                                    </select>
                                   <select name="endDateHH" id="edHH" class="hh-select-box box-color">
                                        <c:forEach var="i" begin="1" end="12">
                                            <option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>시
                                    <select name="endDateMM" id="edMM" class="hh-select-box box-color">
                                        <c:forEach var="i" begin="0" end="50" step="5">
                                            <option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>분
                                </label>
                            </span>
                        </div>
                        <div class="price-box-prize">
                            <span> 상품의 가격
                                <label>
                                    <input type="text" name="prPrice" maxlength="50" class="input-price box-color" value="${prize.prName}">
                                    원
                                </label>
                                 <span style="padding-left: 420px;">카테고리 분류</span>
                            </span>
                        </div>
                        <div class="" style="text-align: left;">
                            <span style="padding-top: 20px; font-size: 20px;">상품설명 작성</span>
                            <label style="padding-left: 340px; padding-bottom: 10px;">
                                대분류
                                <select id="mainCategory" name="mainCategory" class="select-box box-color" style="font-size: 14px">
                                    <option value="none">선택해주세요</option>
                                    <c:forEach var="big" items="${category.bigCategory}">
                                        <option value="${big.cbn}">${big.cbc}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                소분류
                                <select id="subCategory" name="subCategory" class="select-box box-color" style="font-size: 14px">
                                    <option value="none">선택해주세요</option>
                                </select>
                            </label>
                            <span>
                                <textarea name="content" placeholder="내용을 작성해주세요." class="free-control"
                                          style="height: 200px;">${prize.content}</textarea>
                            </span>
                        </div>
                        <div class="" style="text-align: left">
                            <span >첨부파일</span>
                            <span>
                                <div class="filebox">
                                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly="readonly">
                                    <label for="file">파일선택</label>
                                    <input type="file" id="file" name="selectFile" multiple>
                                </div>
                            </span>
                        </div>
                        <c:if test="${mode == 'update'}">
                            <c:forEach var="vo" items="${listFile}">
                                <div class="">
                                    <span>첨부된파일</span>
                                    <span>
                                        <p class="free-control">
                                            <span class="delete-file" data-fileNum="${vo.fnum}"><i
                                                    class="bi bi-trash"></i></span>
                                            ${vo.cpfname}
                                        </p>
                                    </span>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <table class="table table-borderless">
                        <tr>
                            <td class="text-center">
                                <button type="button" class="btn" onclick="check();">${mode=='update'?'수정완료':'등록완료'}&nbsp;<i
                                        class="bi bi-check2"></i></button>
                                <button type="button" class="btn"
                                        onclick="location.href='${pageContext.request.contextPath}/mypage/seller/info';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
                                        class="bi bi-x"></i></button>

                                <c:if test="${mode == 'update'}">
                                    <input type="hidden" name="num" value="${prize.num}">
                                    <input type="hidden" name="psnum" value="${prize.psnum}">
                                    <input type="hidden" name="page" value="${page}">
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

    <c:if test="${mode=='update'}">
        <script type="text/javascript">
            $('.delete-file').click(function () {
                if (!confirm('선택한 파일을 삭제 하시겠습니까 ? ')) {
                    return false;
                }

                let $tr = $(this).closest('tr');
                let fnum = $(this).attr('data-fileNum');
                let url = '${pageContext.request.contextPath}/lounge2/tip/deleteFile';

                $.ajaxSetup({
                    beforeSend: function (e) {
                        e.setRequestHeader('AJAX', true);
                    }
                });
                $.post(url, {fnum: fnum}, function (data) {
                    $($tr).remove();
                }, 'json').fail(function (jqXHR) {
                    console.log(jqXHR.responseText);
                });
            });
        </script>
    </c:if>

    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/se2/js/service/HuskyEZCreator.js"
            charset="utf-8"></script>
    <script type="text/javascript">
        $("#file").on('change', function () {
            var fileCount = $("#file")[0].files.length;
            $(".upload-name").val(fileCount + "개 파일 선택됨");
        });



        const subcategories = {};
        // 예제 소분류 데이터
        <c:forEach var="small" items="${category.smallCategory}">
            if (!subcategories["${small.cbn}"]) {
                subcategories["${small.cbn}"] = [];
            }
            subcategories["${small.cbn}"].push({
                csn: "${small.csn}",
                csc: "${small.csc}"
            });
        </c:forEach>

        document.getElementById('mainCategory').addEventListener('change', function () {
            const mainCategoryId = this.value;
            const subCategorySelect = document.getElementById('subCategory');

            // 기존 옵션 제거
            subCategorySelect.innerHTML = '<option value="none">선택해주세요</option>';

            // 선택된 대분류에 따른 소분류 가져오기
            const selectedSubcategories = subcategories[mainCategoryId] || [];

            // 소분류 옵션 업데이트
            selectedSubcategories.forEach(subCategory => {
                const option = document.createElement('option');
                option.value = subCategory.csn;
                option.textContent = subCategory.csc;
                subCategorySelect.appendChild(option);
            });
        });
    </script>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
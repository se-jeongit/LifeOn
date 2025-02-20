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
            width: 60%;
        }

        .write-form {
            width: 100%;
        }

    </style>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<script type="text/javascript">
    function check() {
        const f = document.freeForm;
        let str;

        str = f.prName.value.trim();
        if (!str) {
            alert('제목을 입력하세요. ');
            f.prName.focus();
            return false;
        }

        str = f.content.value.trim();
        if (!str || str === '<p><br></p>') {
            alert('내용을 입력하세요. ');
            f.content.focus();
            return false;
        }

        f.action = '${pageContext.request.contextPath}/lounge2/tip/${mode}';
        f.submit();
        // return true;
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
                        <div class="form-row">
                            <span style="width: 0; font-size: 20px;">상품이름</span>
                            <span style="width: 10px;">
                                <input type="text" name="prName" maxlength="100" class="free-control"
                                       value="${prize.prName}" style="width: 250px;">
                                <input type="hidden" class="form-control-plaintext"
                                       value="${sessionScope.member.nickName}">
                            </span>
                        </div>
                        <div class="form-row">
                            <span scope="row">
                                <div>
                                    <label>
                                        상품종류
                                        <select name="sell-box" class="sell-select-box">
                                            <option value="all">&nbsp;전체</option>
                                            <option value="auction">&nbsp;경매</option>
                                            <option value="rental">&nbsp;물품대여</option>
                                        </select>
                                    </label>
                                </div>
                            </span>
                            <span scope="row">
                                <div>
                                    상품가격
                                    input
                                </div>
                            </span>
                        </div>
                        <div class="form-row">
                            <span scope="row" style="padding-top: 20px;">상품설명</span>
                            <span>
                                <textarea name="content" placeholder="내용을 작성해주세요." class="free-control"
                                          style="height: 200px;">${prize.content}</textarea>
                            </span>
                        </div>
                        <div class="form-row">
                            <span scope="row">첨부파일</span>
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
                                <div class="form-row">
                                    <span scope="row">첨부된파일</span>
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
                                        onclick="location.href='${pageContext.request.contextPath}/lounge2/tip';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
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
    </script>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
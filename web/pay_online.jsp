<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Thanh toán | Saitama</title>
    <%@include file="headAllPage.jsp" %>
    <style>
        body {
            margin: auto;
        }

        .title_big {
            font-size: 18px;
            color: #fff;
        }

        .card-body li, b {
            font-size: 16px;
            text-align: center;
        }

        .card-header {
            background-color: #ff6700;
        }
    </style>
</head>
<body>

<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================    BODY    ==============--%>
<section id="main_body">
    <div class="container ">
        <div class="pt-3">
            <p class="title_detail">Thanh toán online</p>
        </div>
        <div id="row">
            <div class="col-md-6 col-12 mx-auto pb-5">
                <div class="card m-auto">
                    <div class="card-header">
                        <p class="title_big text-center">THÔNG TIN GIAO DỊCH</p>
                    </div>
                    <div class="card-body">
                        <%
                            ListCart listCart = (ListCart) session.getAttribute("list_cart");
                        %>
                        <li class="mb-4"><b>Số tiền :</b><%=Util.convertPrice(listCart.totalPrice())%>
                        </li>
                        <li class="mb-4"><b>Nội dung thanh toán : </b> mua hàng</li>
                        <div class="custom-file my-3 mx-auto my-4">
                            <input name="file" type="file" class="custom-file-input" id="inputPrivateKey" size="50">
                            <label class="custom-file-label" for="inputPrivateKey">Khoá bí mật</label>
                        </div>
                        <hr>
                        <form method="get" action="<%=Util.fullPath("pay_online")%>">
                            <h5 class="font-weight-bold text-center mt-4">Tài khoản</h5>
                            <div class="form-label-group mx-auto my-4">
                                <input name="name_atm" type="text" id="name" class="form-control"
                                       placeholder="Tên chủ tài khoản" required
                                       oninvalid="this.setCustomValidity('Bạn chưa nhập tên tài khoản.')"
                                       oninput="setCustomValidity('')">
                            </div>
                            <div class="form-label-group  mx-auto mb-4">
                                <input name="number_atm" type="number" id="inputSTK" class="form-control"
                                       placeholder="Số tài khoản" required
                                       oninvalid="this.setCustomValidity('Bạn chưa nhập số tài khoản.')"
                                       oninput="setCustomValidity('')">
                            </div>
                            <div class="input-group my-3 mx-auto mb-4">
                                <input name="signatures" type="text" id="signatures" class="form-control"
                                       placeholder="Chữ ký" required
                                       oninvalid="this.setCustomValidity('Bạn chưa ký.')"
                                       oninput="setCustomValidity('')">
                                <div class="input-group-append">
                                    <span class="btn btn-danger input-group-append" id="sign">Ký</span>
                                </div>
                            </div>

                            <input type="hidden" name="info" value="<c:out value="${requestScope.info}"/>">
                            <input type="hidden" name="data_sign" id="data_sign">
                            <hr>
                            <div align="center">
                                <button class="btn btn_pay px-5" type="submit">OK</button>
                                <a class="btn btn-secondary px-5" href="<%=Util.fullPath("show_cart")%>"> HỦY </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<textarea style="display: none" id="outputPrivateKey"></textarea>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>

</body>
<script>
    <c:if test="${not empty requestScope.atm_error}">
    swal.fire({
        title: '<%=request.getAttribute("atm_error")%>',
        confirmButtonColor: '#ff6700'
    });
    </c:if>
</script>
<script>

    var data = '';
    <c:forEach var="item" items="${sessionScope.list_cart.list_cart}">
    data += '${item.pro.id_product}' + '${item.total}';
    </c:forEach>

    data += '${requestScope.info}' + '${sessionScope.user.user_name}';

    var input = document.getElementById("inputPrivateKey");
    var output = document.getElementById("outputPrivateKey");

    input.addEventListener("change", function () {
        if (this.files && this.files[0]) {
            var myFile = this.files[0];
            var reader = new FileReader();
            reader.addEventListener('load', function (e) {
                output.value = e.target.result;
            });
            reader.readAsBinaryString(myFile);
        }
    });

    $("#sign").click(function () {
        var key = document.getElementById("outputPrivateKey").value;
        console.log(key);
        var sign = new JSEncrypt();
        sign.setPrivateKey(key);
        var signature = sign.sign(data, CryptoJS.SHA256, "sha256");
        document.getElementById("signatures").setAttribute("value", signature);
        document.getElementById("data_sign").setAttribute("value", data);
    });
</script>
</html>
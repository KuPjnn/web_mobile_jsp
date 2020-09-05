<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--=============   MODAL PAY INFO    ==============--%>
<div class="modal fade" id="payModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <!-- Modal content-->
        <div class="modal-content w-75 m-auto">
            <div class="card-body">
                <h4 class="card-title text-center font-weight-bold">Thanh toán</h4>
                <div class="custom-file my-3 mx-auto">
                    <input name="file" type="file" class="custom-file-input" id="inputPrivateKey" size="50">
                    <label class="custom-file-label" for="inputPrivateKey">Khoá bí mật</label>
                </div>
                <form method="get" action="<c:url value="/pay"/>" class="form-signin">
                    <div class="form-label-group mb-3">
                        <input name="address" type="text" id="address" class="form-control"
                               placeholder="Nhập địa chỉ" required
                               oninvalid="this.setCustomValidity('Bạn chưa nhập địa chỉ.')"
                               oninput="setCustomValidity('')"
                               autofocus>
                    </div>
                    <div class="form-label-group">
                        <input name="phone" type="number" id="phone" class="form-control"
                               placeholder="Nhập số điện thoại" minlength="123" required
                               oninvalid="this.setCustomValidity('Bạn chưa nhập nhập số điện thoại.')"
                               oninput="setCustomValidity('')"
                        >
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
                    <div class="option_pay row mb-5">
                        <div class="col-md-6 col-12">
                            <input type="radio" name="pay" value="prepayment" id="prepayment"
                                   class="pay-switch" checked>
                            <label for="prepayment" class="pay_switch-label rounded">Trả trước</label>
                        </div>
                        <div class="col-md-6 col-12">
                            <input type="radio" name="pay" value="pay_later" id="pay_later"
                                   class="pay-switch">
                            <label for="pay_later" class="pay_switch-label rounded">Trả sau</label>
                        </div>
                    </div>
                    <input type="hidden" name="info" value="<c:out value="${requestScope.info}"/>">
                    <input type="hidden" name="data_sign" id="data_sign">
                    <button class="btn_pay btn btn-lg btn-block text-uppercase" type="submit">Thanh toán</button>
                </form>
            </div>
        </div>
    </div>
</div>
<textarea style="display: none" id="outputPrivateKey"></textarea>

<script>

    var data = '';
    <c:forEach var="item" items="${sessionScope.list_cart.list_cart}">
    data += '${item.pro.id_product}' + '${item.total}';
    </c:forEach>

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
        data += document.getElementById('address').value + '~' + document.getElementById('phone').value + '${sessionScope.user.user_name}';
        var key = document.getElementById("outputPrivateKey").value;
        console.log(key);
        var sign = new JSEncrypt();
        sign.setPrivateKey(key);
        var signature = sign.sign(data, CryptoJS.SHA256, "sha256");
        document.getElementById("signatures").setAttribute("value", signature);
        document.getElementById("data_sign").setAttribute("value", data);
    });


    /*Thong bao loi*/
    <c:if test="${not empty requestScope.message}">
    swal.fire({
        title: '${requestScope.message}',
        confirmButtonColor: '#ff6700'
    });
    </c:if>
</script>
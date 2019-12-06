<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--=============   MODAL PAY INFO    ==============--%>
<div class="modal fade" id="payModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <!-- Modal content-->
        <div class="modal-content w-75 m-auto">
            <div class="card-body">
                <h4 class="card-title text-center font-weight-bold">Thanh toán</h4>
                <form method="get" action="<%=Util.fullPath("pay")%>" class="form-signin">
                    <div class="form-label-group mb-5 mt-5">
                        <input name="address" type="text" id="name" class="form-control"
                               placeholder="Nhập địa chỉ"
                               autofocus>
                    </div>
                    <div class="form-label-group">
                        <input name="phone" type="tel" id="phone" class="form-control"
                               placeholder="Nhập số điện thoại"
                        >
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
                    <button class="btn_pay btn btn-lg btn-block text-uppercase" type="submit">Thanh toán</button>
                </form>
            </div>
        </div>
    </div>
</div>
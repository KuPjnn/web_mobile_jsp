<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--================= CHANGE PASSWORD ==============-->
<!-- Modal -->
<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content w-75 m-auto">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title text-center font-weight-bold">Đổi mật khẩu</h4>
                </div>
                <div class="card-body">
                    <form method="GET">
                        <div class="form-label-group my-5">
                            <input type="password" id="pass" class="form-control"
                                   placeholder="Nhập mật khẩu hiện tại"
                                   autofocus>
                        </div>
                        <div class="form-label-group mb-5">
                            <input type="password" id="newPass" class="form-control"
                                   placeholder="Nhập mật khẩu mới">
                        </div>
                        <div class="form-label-group mb-5">
                            <input type="password" id="rePass" class="form-control"
                                   placeholder="Nhập lại mật khẩu mới">
                        </div>
                        <button class="btn_login btn btn-lg btn-block text-uppercase" type="submit">Đổi mật khẩu
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
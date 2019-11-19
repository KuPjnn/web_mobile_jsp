<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--================= REGISTER ==============-->
<!-- Modal -->
<div class="modal fade" id="regisModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content  w-75 m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="card-title text-center font-weight-bold">Đăng ký</h4>
                </div>
                <div class="card-body">
                    <form action="<%=Util.fullPath("register")%>" method="GET" class="form-regis">
                        <div class="form-label-group mb-4 mt-5">
                            <input name="user_register" type="text" id="inputUser" class="form-control"
                                   placeholder="Nhập tên đăng nhập"
                                   autofocus>
                        </div>
                        <div class="form-label-group mb-4">
                            <input name="pass_register" type="password" id="inputPass" class="form-control"
                                   placeholder="Nhập mật khẩu"
                            >
                        </div>
                        <div class="form-label-group mb-4">
                            <input name="rePass_register" type="password" id="inputRePass" class="form-control"
                                   placeholder="Nhập lại mật khẩu"
                            >
                        </div>
                        <div class="form-label-group mb-4">
                            <input name="name_register" type="text" id="inputName" class="form-control"
                                   placeholder="Nhập họ và tên"
                            >
                        </div>
                        <div class="form-label-group mb-4">
                            <input name="mail_register" type="email" id="inputMail" class="form-control"
                                   placeholder="Nhập Email"
                            >
                        </div>
                        <div class="form-label-group mb-4">
                            <input name="phone_register" type="tel" id="inputPhone" class="form-control"
                                   placeholder="Nhập số điện thoại"
                            >
                        </div>
                        <button class="btn_regis btn btn-lg btn-block text-uppercase" type="submit">Đăng
                            ký
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
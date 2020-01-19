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
                    <form action="<%=Util.fullPath("register")%>" method="POST" class="form-regis" name="register">

                        <div class="input-group mb-4 mt-5">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-user"></i>
                                </span>
                            </div>
                            <input name="user_register" type="text" id="inputUser" class="form-control"
                                   placeholder="Nhập tên đăng nhập"
                                   autofocus>
                        </div>
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-key"></i>
                                </span>
                            </div>
                            <input name="pass_register" type="password" id="inputPass" class="form-control"
                                   placeholder="Nhập mật khẩu"
                            >
                        </div>
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-key"></i>
                                </span>
                            </div>
                            <input name="rePass_register" type="password" id="inputRePass" class="form-control"
                                   placeholder="Nhập lại mật khẩu"
                            >
                        </div>
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-id-card"></i>
                                </span>
                            </div>
                            <input name="name_register" type="text" id="inputName" class="form-control"
                                   placeholder="Nhập họ và tên"
                            >
                        </div>
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </span>
                            </div>
                            <input name="mail_register" type="email" id="inputMail" class="form-control"
                                   placeholder="Nhập Email"
                            >
                        </div>
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-phone"></i>
                                </span>
                            </div>
                            <input name="phone_register" type="tel" id="inputPhone" class="form-control"
                                   placeholder="Nhập số điện thoại"
                            >
                        </div>
                        <button id="submitRegis" class="btn_regis btn btn-lg btn-block text-uppercase" type="submit">
                            Đăng ký
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
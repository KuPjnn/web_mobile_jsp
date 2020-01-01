<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--================= LOGIN ==============-->
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content w-75 m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Đăng nhập</h4>
                </div>
                <div class="card-body">
                    <form id="formLogin" class="form-signin">
                        <div class="input-group mb-5 mt-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-user"></i>
                                </span>
                            </div>
                            <input name="username" type="text" id="username" class="form-control"
                                   placeholder="Nhập tên đăng nhập" autofocus>
                        </div>
                        <div class="input-group mb-5">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-key"></i>
                                </span>
                            </div>
                            <input name="password" type="password" id="password" class="form-control"
                                   placeholder="Nhập mật khẩu">
                        </div>
                        <button id="submitLogin" type="submit" class="btn_login btn btn-lg btn-block text-uppercase">
                            Đăng nhập
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


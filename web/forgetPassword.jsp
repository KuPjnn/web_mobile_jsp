<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quên mật khẩu | Saitama</title>
    <%@include file="headAllPage.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">
    <div class="row py-5">
        <div class="col-12 col-md-5 mx-auto">
            <div class="card m-auto">
                <div class="card-body">
                    <form id="formForgetPass" class="form-signin">
                        <div class="input-group mb-5 mt-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </span>
                            </div>
                            <input name="email" type="email" id="email" class="form-control"
                                   placeholder="Nhập email xác thực" autofocus>
                        </div>
                        <div class="input-group mb-5 mt-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-user"></i>
                                </span>
                            </div>
                            <input name="username_" type="text" id="username_" class="form-control"
                                   placeholder="Nhập tên đăng nhập" autofocus>
                        </div>
                        <div class="input-group mb-5">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-key"></i>
                                </span>
                            </div>
                            <input name="password" type="password" id="password_" class="form-control"
                                   placeholder="Nhập mật khẩu">
                        </div>
                        <div class="input-group mb-5">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fa fa-key"></i>
                                </span>
                            </div>
                            <input name="rePassword" type="password" id="rePassword_" class="form-control"
                                   placeholder="Nhập lại mật khẩu">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="fas fa-qrcode"></i>
                                </span>
                            </div>
                            <input id="code_" type="text" name="code" class="form-control"
                                   placeholder="Nhập mã xác nhận">
                            <div class="input-group-append">
                                <a id="sendCode" class="btn btn-danger btn-block text-light">
                                    Gửi mã
                                </a>
                            </div>
                        </div>
                        <button id="submitForgot" class="btn_login btn btn-lg btn-block text-uppercase">
                            Xác nhận
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
<script>

    /*send code*/
    $("#sendCode").click(function () {
        var email = $('#email').val();
        var username = $('#username_').val();
        if (email != '' && username != '') {
            $.ajax({
                url: "<%=Util.fullPath("sendCode")%>",
                type: "post",
                data: {
                    email: email,
                    username: username
                },
                success: function (mess) {
                    swal.fire({
                        title: mess,
                        confirmButtonColor: '#ff6700'
                    });
                },
                error: function (error) {
                    alert(error)
                }
            });
        } else {
            Swal.fire({
                title: 'Vui lòng nhập đầy đủ email và tên đăng nhập.',
                confirmButtonColor: '#ff6700',
            });
        }
    });

    /*confirm code*/
    $("#submitForgot").click(function (e) {
        var email = $('#email').val();
        var username = $('#username_').val();
        var password = $('#password_').val();
        var rePassword = $('#rePassword_').val();
        var code = $('#code_').val();
        e.preventDefault();
        if (code != '' && username != '' && password != '' && rePassword != '' && password == rePassword) {
            $.ajax({
                url: "<%=Util.fullPath("confirmCode")%>",
                type: "get",
                data: {
                    email: email,
                    username: username,
                    password: password,
                    rePassword: rePassword,
                    code: code
                },
                success: function (mess) {
                    if (mess == 'true') {
                        swal.fire({
                            title: 'Đổi mật khẩu thành công.',
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#ff6700',
                            preConfirm: () => {
                                location.href = "<%=Util.fullPath("home")%>";
                            }
                        });
                    } else {
                        swal.fire({
                            title: mess,
                            confirmButtonColor: '#ff6700'
                        });
                    }

                },
                error: function (error) {
                    alert(error);
                }
            });
        } else if (password != rePassword) {
            Swal.fire({
                title: 'Mật khẩu của bạn không khớp nhau.',
                confirmButtonColor: '#ff6700',
            });

        } else {
            Swal.fire({
                title: 'Vui lòng nhập đầy đủ thông tin.!',
                confirmButtonColor: '#ff6700',
            });
        }
    });
</script>
</html>

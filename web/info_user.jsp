<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Thông tin cá nhân | Saitama</title>
    <%@include file="headAllPage.jsp" %>
    <style>
        th {
            font-size: 16px;
        }
    </style>
</head>
<body>
<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================   BODY      =============--%>
<section id="main_body">
    <div class="container">
        <div class="pt-3">
            <p class="title_detail">Thông tin cá nhân</p>
        </div>
        <div class="row pb-5">
            <div class="col-md-9 mx-auto">
                <div class="card m-auto">
                    <div class="card-body">
                        <div class="table-responsive">
                            <%
                                User user = (User) session.getAttribute("user");
                                if (user != null) {
                            %>
                            <table class="table m-auto">
                                <form id="update_info">
                                    <tr>
                                        <th>Tên đăng nhập:</th>
                                        <th><input type="text" class="form-control"
                                                   value="<%=user.getUser_name()%>" disabled>
                                            <input name="user_name" type="hidden" class="form-control"
                                                   value="<%=user.getUser_name()%>">
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>Họ và tên:</th>
                                        <th><input name="full_name" type="text" class="form-control"
                                                   value="<%=user.getFull_name()%>"></th>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <th><input name="email" type="email" class="form-control"
                                                   value="<%=user.getEmail()%>">
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>Số điện thoại:</th>
                                        <th><input name="phone" type="tel" class="form-control"
                                                   value="<%=user.getPhone()%>"
                                        >
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th align="center">
                                            <input id="btnUpdateInfo" class="btn btn_pay px-5 w-100" type="button"
                                                   value="Cập nhật">
                                        </th>
                                    </tr>
                                </form>

                                <tr>
                                    <th>Mật khẩu:</th>
                                    <th>
                                        <button class="btn btn-danger w-100" data-toggle="modal"
                                                data-target="#changePassModal">
                                            Đổi mật khẩu
                                        </button>
                                    </th>
                                </tr>
                            </table>

                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%-----------------------------------------------%>


<!--================= MODAL CHANGE PASSWORD ==============-->
<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content w-75 m-auto">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title text-center font-weight-bold">Đổi mật khẩu</h4>
                </div>
                <div class="card-body">
                    <form>
                        <input name="user" type="hidden" class="form-control"
                               value="<%=user.getUser_name()%>">
                        <div class="form-label-group my-5">
                            <input type="password" name="pass" class="form-control"
                                   placeholder="Nhập mật khẩu hiện tại" autofocus>
                        </div>
                        <div class="form-label-group mb-5">
                            <input type="password" name="new_pass" class="form-control"
                                   placeholder="Nhập mật khẩu mới">
                        </div>
                        <div class="form-label-group mb-5">
                            <input type="password" name="re_pass" class="form-control"
                                   placeholder="Nhập lại mật khẩu mới">
                        </div>
                        <button id="btnUpdatePass" class="btn_login btn btn-lg btn-block text-uppercase" type="submit">
                            Đổi mật khẩu
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%------------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<script>
    /*Cập nhật thông tin*/
    $("#btnUpdateInfo").click(function () {
        var user_name = $('input[name=user_name]').val();
        var full_name = $('input[name=full_name]').val();
        var email = $('input[name=email]').val();
        var phone = $('input[name=phone]').val();
        $.ajax({
            url: "<%=Util.fullPath("change_info")%>",
            type: "post",
            data: {
                user_name: user_name,
                full_name: full_name,
                email: email,
                phone: phone
            },
            success: function (result) {
                Swal.fire({
                    title: result,
                    confirmButtonColor: '#ff6700'
                }).then((result) => {
                    if (result.value) {
                        location.reload();
                    }
                })
            },
            error: function (error) {
                alert(error)
            }
        });
    });

    /*Thay đổi mật khẩu*/
    $("#btnUpdatePass").click(function (e) {
        e.preventDefault();
        var user_name = $('input[name=user]').val();
        var pass = $('input[name=pass]').val();
        var new_pass = $('input[name=new_pass]').val();
        var re_pass = $('input[name=re_pass]').val();
        if (pass == '' || new_pass == '' || re_pass == '') {
            Swal.fire({
                title: 'Vui lòng nhập đầy đủ thông tin!',
                confirmButtonColor: '#ff6700'
            });
        } else {
            $.ajax({
                url: "<%=Util.fullPath("change_pass")%>",
                type: "post",
                data: {
                    user_name: user_name,
                    pass: pass,
                    new_pass: new_pass,
                    re_pass: re_pass
                },
                success: function (result) {
                    if (result == 'true') {
                        Swal.fire({
                            title: 'Cập nhật mật khẩu thành công!',
                            confirmButtonColor: '#ff6700'
                        }).then((result) => {
                            if (result.value) {
                                $("#changePassModal").modal('hide');
                            }
                        })
                    } else {
                        Swal.fire({
                            title: 'Lỗi cập nhật',
                            confirmButtonColor: '#ff6700',
                        });
                    }
                },
                error: function (error) {
                    alert(error)
                }
            });
        }
    });
</script>
</body>
</html>
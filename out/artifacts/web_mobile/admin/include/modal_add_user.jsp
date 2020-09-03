<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--================= REGISTER ==============-->
<!-- Modal -->
<div class="modal fade" id="modal_add_user" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content  w-75 m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="card-title text-center font-weight-bold">Thêm người dùng</h4>
                </div>
                <div class="card-body">
                    <form class="form-regis" name="form-regis" method="post">
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
                                   placeholder="Nhập email"
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
                        <button id="submitAddUser" class="btn_regis btn btn-lg btn-block text-uppercase">
                            Thêm
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

</script>
<script>
    /*===========          Register       =============*/
    var inputs = document.forms['form-regis'].getElementsByTagName('input');
    var run_onchange = false;

    function valid() {
        var errors = false;
        var reg_mail = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
        for (var i = 0; i < inputs.length; i++) {
            var value = inputs[i].value;
            var id = inputs[i].getAttribute('id');

            // Tạo phần tử span lưu thông tin lỗi
            var span = document.createElement('span');
            // Nếu span đã tồn tại thì remove
            var p = inputs[i].parentNode;
            if (p.lastChild.nodeName == 'SPAN') {
                p.removeChild(p.lastChild);
            }
            // Kiểm tra rỗng
            if (value == '') {
                span.innerHTML = 'Không hợp lệ';
            } else {
                // Kiểm tra các trường hợp khác
                if (id == 'inputMail') {
                    if (reg_mail.test(value) == false) {
                        span.innerHTML = 'Email không hợp lệ (ví dụ: abc@gmail.com)';
                    }
                    var email = value;
                }
                if (id == 'inputUser') {
                    if (value.length < 4) {
                        span.innerHTML = 'Tên đăng nhập chưa đúng';
                    }

                }
                // Kiểm tra password
                if (id == 'inputPass') {
                    if (value.length < 8) {
                        span.innerHTML = 'Password phải từ 8 ký tự';
                    }
                    var pass = value;
                }
                // Kiểm tra số điện thoại
                if (id == 'inputPhone' && isNaN(value) == true) {
                    span.innerHTML = 'Số điện thoại phải là kiểu số';
                }
            }

            // Nếu có lỗi thì chèn span vào hồ sơ, chạy onchange, submit return false, highlight border
            if (span.innerHTML != '') {
                inputs[i].parentNode.appendChild(span);
                errors = true;
                run_onchange = true;
                inputs[i].style.border = '1px solid red';
            }
        }// end for

        if (errors == false) {
            /*===========          ADD USER       =============*/
            $(document).ready(function () {
                $('#submitAddUser').click(function (e) {
                        e.preventDefault();
                        var username = $('#inputUser').val();
                        var pass = $('#inputPass').val();
                        var fullname = $('#inputName').val();
                        var mail = $('#inputMail').val();
                        var phone = $('#inputPhone').val();
                        if (username == '' || pass == '' || fullname == '' || mail == '' || phone == '') {
                            Swal.fire({
                                title: 'Vui lòng nhập đầy đủ thông tin!',
                                confirmButtonColor: '#ff6700',
                            });
                        } else {
                            $.ajax({
                                url: '<%=Util.fullPath("/admin/user")%>',
                                type: 'POST',
                                data: { /*Dữ liệu post lên server*/
                                    user_register: username,
                                    pass_register: pass,
                                    name_register: fullname,
                                    mail_register: mail,
                                    phone_register: phone
                                },
                                success: function (msg) { /*Thành công thì thực hiện function(success)*/
                                    if (msg == 'true') {
                                        Swal.fire({
                                            title: 'Đăng kí thành công!',
                                            confirmButtonColor: '#ff6700'
                                        }).then((result) => {
                                            if (result.value) {
                                                $("#modal_add_user").modal('hide');
                                            }
                                        })
                                    } else {
                                        Swal.fire({
                                            title: msg,
                                            confirmButtonColor: '#ff6700',
                                        });
                                    }
                                },
                                error: function (error) { /*Lỗi thì thực hiện function(error)*/
                                    console.log(error);
                                }
                            })
                        }
                    }
                );
            });
        }
        return !errors;
    }// end valid()

    // Chạy hàm kiểm tra valid()
    var register = document.getElementById('submitAddUser');
    register.onclick = function () {
        return valid();
    }

    // Kiểm tra lỗi với sự kiện onchange -> gọi lại hàm valid()
    for (var i = 0; i < inputs.length; i++) {
        var id = inputs[i].getAttribute('id');
        inputs[i].onchange = function () {
            if (run_onchange == true) {
                this.style.border = '1px solid #999';
                valid();
            }
        }
    }
</script>
<style>
    #modal_add_user span {
        width: 100%;
        color: red;
        padding-top: 5px;
    }
</style>
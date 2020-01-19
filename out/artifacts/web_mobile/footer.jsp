<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer id="main_footer">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4 col-4">
                <div class="footer">
                    <h4>Hỗ trợ</h4>
                    <div class="support">
                        <i class="fa fa-phone"></i>
                        <span>+84 123 456 789</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-4">
                <div class="footer">
                    <h4>Địa chỉ</h4>
                    <div>
                        <a>
                            <i class="fas fa-map-marker-alt"></i>
                            <span>Hồ Chí Minh</span>
                        </a>
                    </div>
                    <div>
                        <a>
                            <i class="fas fa-map-marker-alt"></i>
                            <span>Hà Nội</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-4">
                <div class="footer">
                    <h4>Liên hệ</h4>
                    <div>
                        <a class="contact" href="#">
                            <i class="fab fa-facebook"></i>
                            <span>Facebook</span>
                        </a>
                    </div>
                    <div>
                        <a class="contact" href="#">
                            <i class="fas fa-envelope"></i>
                            <span>Email</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy_right text-center">
            <p>Copyright &#x24B8; 2019 - Bản quyền thuộc @saitama_team. Design by Saitama_Team</p>
        </div>
    </div>
</footer>

<script type="text/javascript">
    /*=============      Login      ====================*/
    $(document).ready(function () {
        $('#submitLogin').click(function (e) {
            e.preventDefault();

            var name = $('#username').val();
            var pass = $('#password').val();

            if (name == '' || pass == '') {
                Swal.fire({
                    title: 'Vui lòng nhập đầy đủ thông tin!',
                    confirmButtonColor: '#ff6700',
                });
            } else
                $.ajax({
                    url: '<%=Util.fullPath("login")%>',
                    type: 'POST',
                    data: { /*Dữ liệu post lên server*/
                        username: name,
                        password: pass
                    },
                    success: function (result) { /*Thành công thì thực hiện function(success)*/
                        if (result == 'true') {
                            Swal.fire({
                                title: 'Đăng nhập thành công!',
                                confirmButtonColor: '#ff6700'
                            }).then((result) => {
                                if (result.value) {
                                    location.reload();
                                }
                            })
                        } else if (result == 'true_ad') {
                            Swal.fire({
                                title: 'Đăng nhập thành công!',
                                confirmButtonColor: '#ff6700'
                            }).then((result) => {
                                if (result.value) {
                                    window.location.assign("<%=Util.fullPath("admin/")%>");
                                }
                            })
                        } else {
                            Swal.fire({
                                title: 'Sai tên đăng nhập hoặc mật khẩu!',
                                confirmButtonColor: '#ff6700',
                            });
                        }
                    },
                    error: function (error) { /*Lỗi thì thực hiện function(error)*/
                        console.log(error);
                    }
                })
        });
    });

    /*=========== Logout =============*/
    function logout() {
        swal.fire({
            title: 'Bạn có thực sự mốn đăng xuất!',
            showCancelButton: true,
            confirmButtonText: 'Đăng xuất',
            cancelButtonText: 'Hủy',
            confirmButtonColor: '#ff6700',
            preConfirm: () => {
                fetch(`<%=Util.fullPath("logout")%>`);
                window.location.href = "<%=Util.fullPath("home")%>";
            }
        });
    }

    /*============ Add to cart =============*/
    $(".btn_add").click(function () {
        var id_product = $(this).find(".id_product").val();
        $.ajax({
            url: "<%=Util.fullPath("add")%>",
            type: "get",
            data: {
                id: id_product
            },
            success: function () {
                swal.fire({
                    title: 'Đã thêm vào giỏ.',
                    confirmButtonColor: '#ff6700'
                });
            },
            error: function (error) {
                alert(error)
            }
        });
    });
</script>
<script>
    /*===========          Register       =============*/
    var inputs = document.forms['register'].getElementsByTagName('input');
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
                if (id == 'confirm_email' && value != email) {
                    span.innerHTML = 'Email nhập lại chưa đúng';
                }
                // Kiểm tra password
                if (id == 'inputPass') {
                    if (value.length < 8) {
                        span.innerHTML = 'Password phải từ 8 ký tự';
                    }
                    var pass = value;
                }
                // Kiểm tra password nhập lại
                if (id == 'inputRePass' && value != pass) {
                    span.innerHTML = 'Password nhập lại chưa đúng';
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
            $(document).ready(function () {
                $('#submitRegis').click(function (e) {
                        e.preventDefault();
                        var username = $('#inputUser').val();
                        var pass = $('#inputPass').val();
                        var rePass = $('#inputRePass').val();
                        var fullname = $('#inputName').val();
                        var mail = $('#inputMail').val();
                        var phone = $('#inputPhone').val();
                        if (username == '' || pass == '' || rePass == '' || fullname == '' || mail == '' || phone == '') {
                            Swal.fire({
                                title: 'Vui lòng nhập đầy đủ thông tin!',
                                confirmButtonColor: '#ff6700',
                            });
                        } else {
                            $.ajax({
                                url: '<%=Util.fullPath("register")%>',
                                type: 'POST',
                                data: { /*Dữ liệu post lên server*/
                                    user_register: username,
                                    pass_register: pass,
                                    rePass_register: rePass,
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
                                                $("#regisModal").modal('hide');
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
    var register = document.getElementById('submitRegis');
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
    #regisModal span {
        width: 100%;
        color: red;
        padding-top: 5px;
    }
</style>
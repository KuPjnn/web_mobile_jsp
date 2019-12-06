<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Thông tin cá nhân | Saitama</title>
    <%@include file="headAllPage.jsp" %>
    <style>
        th {
            font-size: 18px;
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
                        <div class="table-responsive ">
                            <table class="table m-auto ">
                                <tr>
                                    <th>Tên đăng nhập:</th>
                                    <th><input type="text" class="form-control" value="hoangvanlong" disabled=>
                                    </th>
                                    <th>
                                        <button class="btn btn-dark" style="padding: 5px 20px" disabled>X
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Họ và tên:</th>
                                    <th><input type="text" class="form-control" value="Hoang Van Long" disabled></th>
                                    <th>
                                        <button class="btn btn-dark">Sửa</button>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <th><input type="email" class="form-control" value="hvl@gmail.com" disabled></th>
                                    <th>
                                        <button class="btn btn-dark">Sửa</button>
                                    </th>
                                </tr>
                                <tr>
                                    <th>SĐT:</th>
                                    <th><input type="tel" class="form-control" value="0123456789" disabled>
                                    <th>
                                        <button class="btn btn-dark">Sửa</button>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Mật khẩu:</th>
                                    <th><input id="changePass" type="password" class="form-control" value="0123456789"
                                               disabled>
                                    <th>
                                        <button class="btn btn-dark" data-toggle="modal"
                                                data-target="#changePassModal">
                                            Sửa
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th align="center">
                                        <input class="btn btn_pay px-5 w-100" type="submit" value="Cập nhật">
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<!--======   MODAL CHANGE PASSWORD   ===========-->
<%@include file="change_password.jsp" %>
<%-----------------------------------------------%>

</body>
</html>
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
                        <div class="table-responsive">
                            <%
                                User user = (User) session.getAttribute("user");
                                if (user != null) {
                            %>
                            <table class="table m-auto">
                                <form>
                                    <tr>
                                        <th>Tên đăng nhập:</th>
                                        <th><input name="user_name" type="text" class="form-control"
                                                   value="<%=user.getUser_name()%>" disabled=>
                                        </th>
                                        <th>
                                            <button class="btn btn-dark" style="padding: 5px 20px" disabled>X
                                            </button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>Họ và tên:</th>
                                        <th><input name="full_name" type="text" class="form-control"
                                                   value="<%=user.getFull_name()%>"
                                                   disabled></th>
                                        <th>
                                            <button class="btn btn-dark">Sửa</button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <th><input name="email" type="email" class="form-control"
                                                   value="<%=user.getEmail()%>"
                                                   disabled>
                                        </th>
                                        <th>
                                            <button class="btn btn-dark">Sửa</button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>SĐT:</th>
                                        <th><input name="phone" type="tel" class="form-control"
                                                   value="<%=user.getPhone()%>"
                                                   disabled>
                                        <th>
                                            <button class="btn btn-dark">Sửa</button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th align="center">
                                            <input class="btn btn_pay px-5 w-100" type="submit" value="Cập nhật">
                                        </th>
                                    </tr>
                                </form>

                                <tr>
                                    <th>Mật khẩu:</th>
                                    <th>
                                        <button class="btn btn-dark px-5 w-100" data-toggle="modal"
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

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<!--======   MODAL CHANGE PASSWORD   ===========-->
<%@include file="change_password.jsp" %>
<%-----------------------------------------------%>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin User</title>
    <%@include file="../headAllPage.jsp" %>
    <link rel="stylesheet" href="<%=Util.fullPath("css/admin.css")%>">
</head>
<body>
<%@include file="include/admin_header.jsp" %>
<div id="admin_body">
    <div class="container-fluid">
        <div class="row">
            <%--=======     INCLUB NAV      =========--%>
            <%@include file="include/admin_nav.jsp" %>
            <%-------------------------------------%>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <div id="admin_khachhang" class="card mt-1 tab-pane active">
                    <div class="card-header">Người dùng

                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Tên đăng nhập</th>
                                <th>Tên khách hàng</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Quyền hạn</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<User> list_user = (List<User>) request.getAttribute("list_user");
                                if (list_user != null)
                                    for (User user : list_user) {
                            %>
                            <tr>
                                <th><%=user.getUser_name()%>
                                </th>
                                <th><%=user.getFull_name()%>
                                </th>
                                <th><%=user.getEmail()%>
                                </th>
                                <th><%=user.getPhone()%>
                                </th>
                                <th><%=user.getPrivileges()%>
                                </th>
                                <th class="d-flex justify-content-end">
                                    <a href="<%="#"%>" class="mx-3"
                                       data-toggle="modal"
                                       data-target="#<%=user.getUser_name()%>">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                    </a>
                                    <a onclick="return confirm('Xóa <%=user.getUser_name()%>')"
                                       href="<%=Util.fullPath("/admin/user")%>?action=del&&id=<%=user.getUser_name()%>"
                                       class="mx-3">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </a>
                                </th>
                            </tr>
                            <%--==========      MODAL ADD NEW ITEMS     =================--%>
                            <div class="modal fade" id="<%=user.getUser_name()%>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content m-auto">
                                        <div class="card">
                                            <div class="card-header bg-light">
                                                <h4 class="text-center font-weight-bold">Chỉnh sửa thông tin</h4>
                                            </div>
                                            <div class="card-body">
                                                <form action="<%=Util.fullPath("admin/user")%>" method="get"
                                                      enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="edit">
                                                    <%--User name--%>
                                                    <div class="input-group my-3">
                                                        <div class="input-group-append">
                                                            <a class="input-group-text" data-toggle="tooltip"
                                                               title="User name">
                                                                <i class="fas fa-user-circle text-dark"></i>
                                                            </a>
                                                        </div>
                                                        <input type="text" name="user_name"
                                                               value="<%=user.getUser_name()%>" style="display: none"/>
                                                        <input class="form-control" type="text" name=""
                                                               title="User name"
                                                               value="<%=user.getUser_name()%>" disabled/>
                                                    </div>
                                                    <%--Pass--%>
                                                    <div class="input-group my-3">
                                                        <div class="input-group-append">
                                                            <a class="input-group-text" data-toggle="tooltip"
                                                               title="Mật khẩu">
                                                                <i class="fas fa-key text-dark"></i>
                                                            </a>
                                                        </div>
                                                        <input class="form-control" type="password" name="pass"
                                                               title="Mật khẩu" placeholder="Mật khẩu"
                                                               value="<%=user.getPassword()%>"/>
                                                    </div>
                                                    <%--Full name--%>
                                                    <div class="input-group my-3">
                                                        <div class="input-group-append">
                                                            <a class="input-group-text" data-toggle="tooltip"
                                                               title="Full name">
                                                                <i class="fas fa-user text-dark"></i>
                                                            </a>
                                                        </div>
                                                        <input class="form-control" type="text"
                                                               name="full_name" title="Full name"
                                                               value="<%=user.getFull_name()%>"/>

                                                    </div>
                                                    <%--Email--%>
                                                    <div class="input-group my-3">
                                                        <div class="input-group-append">
                                                            <a class="input-group-text" data-toggle="tooltip"
                                                               title="Email">
                                                                <i class="fas fa-mail-bulk text-dark"></i>
                                                            </a>
                                                        </div>
                                                        <input class="form-control" type="email"
                                                               name="email" title="Email"
                                                               value="<%=user.getEmail()%>"/>

                                                    </div>
                                                    <%--Phone--%>
                                                    <div class="input-group my-3">
                                                        <div class="input-group-append">
                                                            <a class="input-group-text" data-toggle="tooltip"
                                                               title="Phone">
                                                                <i class="fas fa-phone text-dark"></i>
                                                            </a>
                                                        </div>
                                                        <input class="form-control" type="tel"
                                                               name="phone" title="phone"
                                                               value="<%=user.getPhone()%>"/>
                                                    </div>

                                                    <%--Phân quyền--%>
                                                    <ul class="nav nav-tabs" style="padding-bottom: 3px">
                                                        <li class="">
                                                            <a class="nav-link active text-dark " data-toggle="collapse"
                                                               href="#collapseConfigure"
                                                               role="button"
                                                               aria-expanded="false" aria-controls="collapseConfigure"
                                                               style="background: #c5cccc">
                                                                PHÂN QUYỀN
                                                            </a>
                                                        </li>

                                                        <div class="collapse" id="collapseConfigure">
                                                            <div class="card card-body"
                                                                 style="border: none;padding: 0px;margin-left: 30px">
                                                                <div class="custom-control-inline" style="">
                                                                    <span class="m-2">
                                                                        <input value="ad" type="radio"
                                                                               name="privileges"
                                                                               id="ad<%=user.getUser_name()%>"
                                                                                <%=user.getPrivileges().equals("ad") ? "checked" : ""%> />
                                                                        <label for="ad<%=user.getUser_name()%>">ADMIN</label>
                                                                    </span>

                                                                    <span class="m-2"> <input value="kh" type="radio"
                                                                                              name="privileges"
                                                                                              id="kh<%=user.getUser_name()%>"
                                                                            <%=user.getPrivileges().equals("kh") ? "checked" : ""%>/>
                                                                        <label for="kh<%=user.getUser_name()%>">KHÁCH HÀNG</label>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ul>
                                                    <input class="btn btn-danger d-block w-100 mx-auto "
                                                           style="margin-top: 10px" type="submit" value="Chỉnh sửa"/>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function check(element, power) {
        if (element.checked == true) {
            power.value = 'ad';
        }
    }

    function check1(elements, powers) {
        if (elements.checked == true) {
            powers.value = 'kh';
        }
    }
</script>
</html>


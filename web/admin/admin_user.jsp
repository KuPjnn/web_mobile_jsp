<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--USER--%>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Page</title>
    <%@include file="../headAllPage.jsp" %>
    <link rel="stylesheet" href="<%=Util.fullPath("css/admin.css")%>">
</head>
<body>
<%@include file="admin_header.jsp" %>
<div id="admin_body">
    <div class="container-fluid">
        <div class="row">
            <%--=======     INCLUB NAV      =========--%>
            <%@include file="admin_nav.jsp" %>
            <%-------------------------------------%>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <div id="admin_khachhang" class="card mt-1 tab-pane active">
                    <div class="card-header">Người dùng
                        <button class="btn btn-danger ml-xl-5">Phân quyền</button>
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
                                <th>Sửa</th>
                                <th>Xóa</th>
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
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                    </button>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </button>
                                </th>
                            </tr>
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
</html>


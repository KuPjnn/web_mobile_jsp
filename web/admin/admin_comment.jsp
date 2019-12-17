<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Comment</title>
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
                <div id="admin_binhluan" class="card mt-1 tab-pane active">
                    <div class="card-header">Bình luận</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên người dùng</th>
                                <th>Tên sản phẩm</th>
                                <th>Nội dung</th>
                                <th>Ngày bình luận</th>
                                <th>Hiển thị</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật Bản
                                </th>
                                <th>12/10/2019</th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </button>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </button>
                                </th>
                            </tr>
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


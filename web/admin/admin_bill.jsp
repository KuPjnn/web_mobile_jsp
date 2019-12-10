<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--BILL--%>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
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
                <div id="admin_donhang" class="card mt-1 tab-pane active">
                    <div class="card-header">Đơn hàng</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Mã khách hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày lập</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái</th>
                                <th>Xác nhận</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#98765</th>
                                <th>#55132</th>
                                <th>Văn Công Khôi</th>
                                <th>12/12/2019</th>
                                <th>TP. HCM</th>
                                <th>Đã thanh toán</th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle ml-3">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
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

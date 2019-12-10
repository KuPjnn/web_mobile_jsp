<%--ITEMS--%>
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
                <div id="admin_hanghoa" class="card mt-1 tab-pane active">
                    <div class="card-header">Hàng hóa
                        <button class="btn btn-danger ml-xl-5">Thêm hàng hóa</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Hiện thị</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#98765</th>
                                <th>Laptop</th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle ">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </button>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle ">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </button>
                                </th>
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

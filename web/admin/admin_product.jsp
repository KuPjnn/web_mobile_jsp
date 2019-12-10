<%@ page import="vn.edu.nlu.fit.model.Product" %>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Product</title>
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
                <div id="admin_sanpham" class="card mt-1 tab-pane active">
                    <div class="card-header">Sản phẩm
                        <button class="btn btn-danger ml-xl-5">Thêm sản phẩm</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Tên hàng hóa</th>
                                <th>Nhà cung cấp</th>
                                <th>Giá</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th>Cấu hình</th>
                                <th>Hiển thị</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Product> list = (List<Product>) request.getAttribute("list");
                                if (list != null) {
                                    for (Product product : list) {
                            %>
                            <tr>
                                <th><%=product.getId_product()%>
                                </th>
                                <th><%=product.getProduct_name()%>
                                </th>
                                <th><%=product.getId_items()%>
                                </th>
                                <th><%=product.getId_supplier()%>
                                </th>
                                <th><%=Util.convertPrice(product.getPrice())%>
                                </th>
                                <th><img class="img-fluid img-thumbnail" src="<%=Util.splitImg(product.getImg())%>"
                                         width="50px"></th>
                                <th><%=product.getTotal()%>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle mt-3">
                                        <i style="color: #ff6700" class="fas fa-tools"></i>
                                    </button>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle mt-3">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </button>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle mt-3">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                    </button>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle mt-3">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </button>
                                </th>
                            </tr>
                            <%
                                    }
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

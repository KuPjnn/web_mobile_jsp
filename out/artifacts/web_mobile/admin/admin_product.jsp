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
<%@include file="include/admin_header.jsp" %>
<div id="admin_body">
    <div class="container-fluid">
        <div class="row">
            <%--=======     INCLUB NAV      =========--%>
            <%@include file="include/admin_nav.jsp" %>
            <%-------------------------------------%>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <div id="admin_sanpham" class="card mt-1 row">
                    <div class="card-header">Sản phẩm
                        <button class="btn btn-danger ml-5" data-toggle="modal"
                                data-target="#addProduct">Thêm sản phẩm
                        </button>
                        <div class="d-flex input-group float-right w-50">
                            <input type="text" class="form-control " placeholder="Tìm kiếm......">
                            <div class="input-group-append">
                                <button class="btn btn-dark border-0" type="button"><i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
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
                                <th><img class="NO-CACHE img-fluid img-thumbnail"
                                         src="<%=Util.splitImg(product.getImg())%>" width="50px">
                                </th>
                                <th><%=product.getTotal()%>
                                </th>

                                <th>
                                    <%
                                        if (product.getActive() == 1) {
                                    %>
                                    <a href="product?action=hide&id_product=<%=product.getId_product()%>"
                                       class="__icon mt-5">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a href="product?action=active&id_product=<%=product.getId_product()%>">
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                </th>
                                <th>
                                    <button onclick="" class="border-0 btn-outline-light rounded-circle mt-3">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                    </button>
                                </th>
                                <th>
                                    <a onclick="return confirm('Xóa sản phẩm : <%=product.getProduct_name()%>')"
                                       href="product?action=del&id_product=<%=product.getId_product()%>"
                                       class="border-0 btn-outline-light rounded-circle mt-3">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </a>
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

<%@include file="include/modal_add_product.jsp" %>

</body>
</html>


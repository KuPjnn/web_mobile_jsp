<%@ page import="vn.edu.nlu.fit.dao.ConfigureDAO" %>
<%@ page import="vn.edu.nlu.fit.model.Configure" %>
<%@ page import="vn.edu.nlu.fit.model.Product" %>
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
            <%-----------------------------------------%>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <div id="admin_sanpham" class="card mt-1 row">
                    <div class="card-header">Sản phẩm
                        <button id="add_pro" class="btn btn-danger ml-5" data-toggle="modal"
                                data-target="#addProduct">Thêm sản phẩm
                        </button>
                        <%--<div class="d-flex input-group float-right w-50">
                            <input type="text" class="form-control " placeholder="Tìm kiếm......">
                            <div class="input-group-append">
                                <button class="btn btn-danger border-0" type="button"><i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>--%>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Loại</th>
                                <th>Nhà cung cấp</th>
                                <th>Giá</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th></th>
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
                                <th><img class="img-fluid img-thumbnail"
                                         src="<%=Util.splitImg(product.getImg())%>" width="50px">
                                </th>
                                <th><%=product.getTotal()%>
                                </th>
                                <th>
                                    <%
                                        if (product.getActive() == 1) {
                                    %>
                                    <a class="mx-3" href="product?action=hide&id_product=<%=product.getId_product()%>">
                                        <i style="color: #ff6700" class="far fa-check-circle "></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a class="mx-3"
                                       href="product?action=active&id_product=<%=product.getId_product()%>">
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                    <a href="#" class="edit_product mx-3" data-toggle="modal"
                                       data-target="#addProduct">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                        <input class="id_items" value="<%=product.getId_items()%>" type="hidden">
                                        <input class="id_supplier" value="<%=product.getId_supplier()%>" type="hidden">
                                        <input class="id_product" value="<%=product.getId_product()%>" type="hidden">
                                        <input class="name_product" value="<%=product.getProduct_name()%>"
                                               type="hidden">
                                        <input class="price" value="<%=product.getPrice()%>" type="hidden">
                                        <input class="total" value="<%=product.getTotal()%>" type="hidden">
                                        <input class="active" value="<%=product.getActive()%>" type="hidden">
                                        <%Configure conf = new ConfigureDAO().getConfigure(product.getId_product());%>
                                        <input class="display" value="<%=conf.getDisplay()%>" type="hidden">
                                        <input class="camera_font" value="<%=conf.getCamera_font()%>" type="hidden">
                                        <input class="camera_back" value="<%=conf.getCamera_back()%>" type="hidden">
                                        <input class="ram" value="<%=conf.getRam()%>" type="hidden">
                                        <input class="rom" value="<%=conf.getRom()%>" type="hidden">
                                        <input class="cpu" value="<%=conf.getCpu()%>" type="hidden">
                                        <input class="gpu" value="<%=conf.getGpu()%>" type="hidden">
                                        <input class="battery" value="<%=conf.getBattery()%>" type="hidden">
                                        <input class="os" value="<%=conf.getOs()%>" type="hidden">
                                        <input class="sim" value="<%=conf.getSim()%>" type="hidden">
                                    </a>
                                    <a onclick="return confirm('Xóa sản phẩm : <%=product.getProduct_name()%>')"
                                       href="product?action=del&id_product=<%=product.getId_product()%>"
                                       class="mx-3">
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

<%--==================       INCLUDE        ===================--%>
<%@include file="include/modal_add_product.jsp" %>
<%---------------------------------------------------------------%>
</body>
</html>
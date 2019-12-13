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
                        <button class="btn btn-danger ml-xl-5" data-toggle="modal"
                                data-target="#addProduct">Thêm sản phẩm
                        </button>
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
</body>
</html>

<%--==========      MODAL ADD NEW ITEMS     =================--%>
<div class="modal fade" id="addProduct" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Thêm mặt hàng mới</h4>
                </div>
                <div class="card-body">
                    <form action="<%=Util.fullPath("admin/product")%>" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add">
                        <div class="input-group my-3">
                            <select name="id_items" class="custom-select w-50" id="items">
                                <option selected label="Chọn loại hàng hóa" hidden></option>
                                <option value="DT">Điện thoại</option>
                                <option value="LT">Laptop</option>
                                <option value="MTB">Máy tính bảng</option>
                            </select>
                        </div>
                        <div class="input-group my-3">
                            <select name="id_supplier" class="custom-select w-50" id="supplier">
                                <option selected label="Chọn nhà sản xuất" hidden></option>
                                <option value="APP">Apple</option>
                                <option value="XIA">Xiaomi</option>
                                <option value="SAM">Samsung</option>
                            </select>
                        </div>
                        <%--Tên sản phẩm--%>
                        <div class="input-group my-3">
                            <input class="form-control" type="text" name="name" title="Tên sản phẩm"
                                   placeholder="Tên sản phẩm"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Tên sản phẩm">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <%--Giá sản phẩm--%>
                        <div class="input-group my-3">
                            <input class="form-control" type="number" name="name" title="Giá sản phẩm"
                                   placeholder="Giá sản phẩm" min="0"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Giá sản phẩm">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <%--Tổng số lượng sản phẩm--%>
                        <div class="input-group my-3">
                            <input class="form-control" type="number" name="name" title="Số lượng sản phẩm"
                                   placeholder="Tổng số lượng sản phẩm" min="0"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Tổng số lượng sản phẩm">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <%--Ảnh sản phẩm--%>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile" size="50">
                            <label class="custom-file-label" for="customFile">Ảnh sản phẩm</label>
                        </div>
                        <%--Hiển thị sản phẩm--%>
                        <div class="form-check my-3">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck" name="">
                                <label class="custom-control-label" for="customCheck">Hiển thị sản phẩm lên trang
                                    web.</label>
                            </div>
                        </div>
                        <%--Cấu hình sản phẩm--%>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active text-dark" data-toggle="collapse"
                                   href="#collapseConfigure"
                                   role="button"
                                   aria-expanded="false" aria-controls="collapseConfigure">
                                    Cấu hình sản phẩm
                                </a>
                            </li>

                            <div class="collapse" id="collapseConfigure">
                                <div class="card card-body">
                                    <div class="custom-control-inline">
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="Hệ điều hành"/>
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="Màn hình"/>
                                    </div>
                                    <div class="custom-control-inline">
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="Camera trước"/>
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="Camera sau"/>
                                    </div>
                                    <div class="custom-control-inline">
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="RAM"/>
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="ROM"/>
                                    </div>
                                    <div class="custom-control-inline">
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="CPU"/>
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="GPU"/>
                                    </div>
                                    <div class="custom-control-inline">
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="Pin"/>
                                        <input class="form-control m-2 w-50" type="text" name=""
                                               placeholder="Sim"/>
                                    </div>
                                </div>
                            </div>
                        </ul>
                        <br>
                        <input class="btn btn-danger d-block w-100 mx-auto" type="submit" value="Thêm"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    /**/
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
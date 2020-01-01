<%--ITEMS--%>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Supplier" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Supplier</title>
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
                <div id="admin_supplier" class="card mt-1 tab-pane active">
                    <div class="card-header">Thương hiệu
                        <button class="btn btn-danger ml-xl-5" data-toggle="modal"
                                data-target="#addSupplier">Thêm thương hiệu mới
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên thương hiệu</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Supplier> list = (List<Supplier>) request.getAttribute("list");
                                if (list != null) {
                                    for (Supplier item : list) {
                            %>
                            <tr>
                                <th><%=item.getId()%>
                                </th>
                                <th><%=item.getName()%>
                                </th>
                                <th class="d-flex justify-content-end">
                                    <%
                                        if (item.getActive() == 1) {
                                    %>
                                    <a href="supplier?action=hide&id_supplier=<%=item.getId()%>"
                                       class="mx-3">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a class="mx-3" href="supplier?action=active&id_supplier=<%=item.getId()%>">
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                    <a data-toggle="modal" class="mx-3"
                                       data-target="#<%=item.getId()%>"
                                       href="supplier?action=active&id_supplier=<%=item.getId()%>">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                    </a>
                                    <%--==========      MODAL Edit SUPPLIER     =================--%>
                                    <div class="modal fade" id="<%=item.getId()%>" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content m-auto">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        <h4 class="text-center font-weight-bold">Sửa thương hiệu</h4>
                                                    </div>
                                                    <div class="card-body">
                                                        <form action="<%=Util.fullPath("admin/supplier")%>"
                                                              method="post">
                                                            <input type="hidden" name="action" value="edit">
                                                            <div class="input-group my-3">
                                                                <input class="form-control" type="text"
                                                                       value="<%=item.getId()%>" min="0" required
                                                                       disabled/>
                                                                <input class="form-control " type="text"
                                                                       name="id_supplier"
                                                                       value="<%=item.getId()%>" min="0"
                                                                       style="display: none"/>
                                                                <div class="input-group-append">
                                                                    <a class="input-group-text" data-toggle="tooltip"
                                                                       title="ID thương hiệu">
                                                                        <i class="fas fa-info-circle text-dark"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="input-group my-3">
                                                                <input class="form-control" type="text"
                                                                       name="name_supplier"
                                                                       value="<%=item.getName()%>" required/>
                                                                <div class="input-group-append">
                                                                    <a class="input-group-text" data-toggle="tooltip"
                                                                       title="Tên thương hiệu">
                                                                        <i class="fas fa-info-circle text-dark"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <input class="btn btn-danger d-block w-100 mx-auto"
                                                                   type="submit" value="Sửa"/>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a onclick="return confirm('Xóa thương hiệu : <%=item.getName()%>')"
                                       class="mx-3"
                                       href="supplier?action=del&id_supplier=<%=item.getId()%>">
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

<%--==========      MODAL ADD NEW SUPPLIER     =================--%>
<div class="modal fade" id="addSupplier" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Thêm thương hiệu mới</h4>
                </div>
                <div class="card-body">
                    <form action="<%=Util.fullPath("admin/supplier")%>" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="input-group my-3">
                            <input class="form-control" type="text" name="id_supplier"
                                   placeholder="ID thương hiệu" min="0" required/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="ID thương hiệu">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <div class="input-group my-3">
                            <input class="form-control" type="text" name="name_supplier"
                                   placeholder="Tên thương hiệu" required/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Tên thương hiệu">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <br>
                        <input class="btn btn-danger d-block w-100 mx-auto" type="submit" value="Thêm"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
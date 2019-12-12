<%--ITEMS--%>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Item" %>
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
                        <button class="btn btn-danger ml-xl-5" data-toggle="modal"
                                data-target="#addItem">Thêm hàng hóa
                        </button>
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
                            <%
                                List<Item> list = (List<Item>) request.getAttribute("list");
                                if (list != null) {
                                    for (Item item : list) {
                            %>
                            <tr>
                                <th><%=item.getId()%>
                                </th>
                                <th><%=item.getName()%>
                                </th>
                                <th>
                                    <%
                                        if (item.getActive() == 1) {
                                    %>
                                    <a href="items?action=hide&id_items=<%=item.getId()%>"
                                       class="border-0 btn-outline-light rounded-circle ">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a href="items?action=active&id_items=<%=item.getId()%>">
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>

                                </th>
                                <th>
                                    <a onclick="return confirm('Xóa mặt hàng : <%=item.getName()%>')"
                                       class="border-0 btn-outline-light rounded-circle"
                                       href="items?action=del&id_items=<%=item.getId()%>">
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
<div class="modal fade" id="addItem" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Thêm mặt hàng mới</h4>
                </div>
                <div class="card-body">
                    <form action="<%=Util.fullPath("admin/items")%>" method="post">
                        <input type="hidden" name="action" value="add">
                        <input class="form-control my-3" type="text" name="id_items" placeholder="ID mặt hàng"/>
                        <input class="form-control" type="text" name="name_items" placeholder="Tên mặt hàng "/>
                        <br>
                        <input class="btn btn-dark d-block w-100 mx-auto" type="submit" value="Thêm"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
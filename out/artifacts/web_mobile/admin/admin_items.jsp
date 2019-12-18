<%--ITEMS--%>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Items</title>
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
                <div id="admin_hanghoa" class="card mt-1 tab-pane active">
                    <div class="card-header">Hàng hóa
                        <button id="add_new_items" class="btn btn-danger ml-xl-5" data-toggle="modal"
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
                                <th>Sửa</th>
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
                                    <a class="btn info_items" data-toggle="modal"
                                       data-target="#addItem<%=item.getId()%>">
                                        <i style="color: #ff6700" class="fas fa-pen"></i>
                                        <%--<div style="display: none" class="id_items"><%=item.getId()%>--%>
                                        <%--</div>--%>
                                        <%--<div style="display: none" class="name_items"><%=item.getName()%>--%>
                                        <%--</div>--%>
                                    </a>
                                    <div class="modal fade" id="addItem<%=item.getId()%>" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content m-auto">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        <h4 id="title_editItem" class="text-center font-weight-bold">
                                                            Thêm mặt hàng mới</h4>
                                                    </div>
                                                    <div class="card-body">
                                                        <form id="formeditItems"
                                                              action="<%=Util.fullPath("admin/items")%>" method="get">
                                                            <input id="actionEdit" type="hidden" name="action"
                                                                   value="edit">
                                                            <div class="input-group my-3">
                                                                <input id="id_items_edit" class="form-control"
                                                                       type="text" value="<%=item.getId()%>" disabled/>
                                                                <input type="hidden" name="id_items"
                                                                       value="<%=item.getId()%>">
                                                                <div class="input-group-append">
                                                                    <a class="input-group-text" data-toggle="tooltip"
                                                                       title="ID mặt hàng">
                                                                        <i class="fas fa-info-circle text-dark"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="input-group my-3">
                                                                <input id="name_items_edit" class="form-control"
                                                                       type="text"
                                                                       name="name_items"
                                                                       placeholder="Tên thương hiệu"
                                                                       value="<%=item.getName()%>"/>
                                                                <div class="input-group-append">
                                                                    <a class="input-group-text" data-toggle="tooltip"
                                                                       title="Tên mặt hàng">
                                                                        <i class="fas fa-info-circle text-dark"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <button id="btnSubmitEditItems"
                                                                    class="btn btn-danger d-block w-100 mx-auto"
                                                                    type="submit">Sửa
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                    <h4 id="title_addItem" class="text-center font-weight-bold">Thêm mặt hàng mới</h4>
                </div>
                <div class="card-body">
                    <form id="formAddNewItems">
                        <input id="action" type="hidden" name="action" value="add">
                        <div class="input-group my-3">
                            <input id="id_items" class="form-control" type="text" name="id_items"
                                   placeholder="ID thương hiệu" min="0"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="ID mặt hàng">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <div class="input-group my-3">
                            <input id="name_items" class="form-control" type="text" name="name_items"
                                   placeholder="Tên thương hiệu"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Tên mặt hàng">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <br>
                        <button id="btnSubmitAddNewItems" class="btn btn-danger d-block w-100 mx-auto" type="submit"
                                value="Thêm">Thêm
                        </button>
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

<script>
    $('#btnSubmitAddNewItems').click(function (e) {
        e.preventDefault();
        var id_items = $('#id_items').val();
        var name_items = $('#name_items').val();
        var action = $('#action').val();
        $.ajax({
            url: '<%=Util.fullPath("admin/items")%>',
            type: 'POST',
            data: { /*Dữ liệu post lên server*/
                action: action,
                id_items: id_items,
                name_items: name_items
            },
            success: function (result) {
                alert(result);
                location.reload();
                $('#addItem').modal('hide');

            },
            error: function (error) {
                alert(error);
            }
        })
    });
</script>

<%--
<script>

    /*====================      BTN ADD NEW ITEMS       ==============================*/
    $("#add_new_items").click(function () {
        $("#title_addItem").html("Thêm hàng hóa!");

        $('#formAddNewItems input[name=id_items]').prop("disabled", false);
        $('#formAddNewItems input[name=id_items]').val("");
        $('#formAddNewItems input[name=name_items]').prop("disabled", false);
        $('#formAddNewItems input[name=name_items]').val("");
    });

    /*=====================     BTN EDIT ITEMS     ==============================*/
    $(".info_items").click(function () {
        $("#title_addItem").html("Sửa hàng hóa!");
        $("#btnSubmitAddNewItems").val("Sửa");

        var id_items = $(this).find(".id_items").html();
        var name_items = $(this).find(".name_items").html();

        $('#formAddNewItems input[name=id_items]').prop("disabled", true);
        $('#formAddNewItems input[name=id_items]').val(id_items);
        $('#formAddNewItems input[name=name_items]').prop("disabled", true);
        $('#formAddNewItems input[name=name_items]').val(name_items);
    });

</script>--%>

<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page import="vn.edu.nlu.fit.model.Cart" %>
<%@ page import="vn.edu.nlu.fit.model.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Giỏ hàng | Saitama</title>
    <link rel="stylesheet" href="<%=Util.fullPath("css/cart.css")%>">
    <%@include file="headAllPage.jsp" %>
</head>
<body>

<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================   BODY     ==============--%>
<section id="shop_cart">
    <div class="shopping_cart container">
        <h3 class="mt-3">Giỏ hàng</h3>
        <div class="row">
            <div class="col-md-8 col-12" style="height: 70vh; overflow: auto">
                <%
                    ListCart list_item = (ListCart) session.getAttribute("list_cart");
                    if (list_item.list_cart.isEmpty()) {
                %>
                <p style="font-size: 25px" align="center">Chưa có sản phẩm</p>
                <%
                } else {
                    for (Cart item : list_item.list_cart) {
                %>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <img width="100px" src="<%=Util.splitImg(item.getPro().getImg())%>" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span><%=item.getPro().getProduct_name()%></span> <br>
                            <span><%=Util.convertPrice(item.getPro().getPrice() - item.getPro().getDiscout())%></span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <div class="input-group-append">
                                <a class="minus_quantity btn rounded-left">
                                    <input class="id_product_minus" name="id_product_minus"
                                           value="<%=item.getPro().getId_product()%>" type="hidden">
                                    <i style="color: #000" class="fas fa-minus"></i>
                                </a>
                            </div>
                            <span type="number" class="form-control rounded text-center"><%=item.getTotal()%></span>
                            <div class="input-group-append">
                                <a id="add_quantity" class="add_quantity btn">
                                    <input class="id_product_add" name="id_product_add"
                                           value="<%=item.getPro().getId_product()%>" type="hidden">
                                    <i style="color: #000" class="fas fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <a class="delete_product btn ml-3" type="submit" name="delete_product">
                            <i style="color: #000" class="fa fa-trash"></i>
                            <input type="hidden" class="id_del" value="<%=item.getPro().getId_product()%>">
                        </a>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="col-md-4 col-12">
                <div class="product_total mb-5">
                    <p>Tổng tiền</p>
                    <span id="total" class="d-block my-4"><%=Util.convertPrice(list_item.totalPrice())%></span>

                    <%
                        UserModel user = (UserModel) session.getAttribute("user");
                        if (user == null) {
                    %>
                    <button onclick="Swal.fire({ title: 'Bạn chưa đăng nhập!', confirmButtonColor: '#ff6700',})"
                            class="btn m-auto" type="button">Đặt hàng
                    </button>
                    <%
                    } else if (list_item.list_cart.size() == 0) {
                    %>
                    <button onclick="Swal.fire({ title: 'Chưa có sản phẩm!', confirmButtonColor: '#ff6700',})"
                            class="btn m-auto" type="button">Đặt hàng
                    </button>
                    <%
                    } else {
                    %>
                    <button class="btn m-auto" type="submit" data-toggle="modal"
                            data-target="#payModal">Đặt hàng
                    </button>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</section>
<%----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<%--==============  MODAL PAY ONLINE    =======--%>
<%@include file="pay.jsp" %>
<%-----------------------------------------------%>

</body>
</html>

<script>
    /*=============     MINUS QUANTITY      ==================*/
    $(".minus_quantity").click(function () {
        var id_product = $(this).find(".id_product_minus").val();
        $.ajax({
            url: "<%=Util.fullPath("minus_quantity")%>",
            type: "get",
            data: {
                id_product: id_product
            },
            success: function () {
                window.location.reload();
            },
            error: function (error) {
                alert(error)
            }
        });
    });

    /*===========       ADD QUANTITY        ==================*/
    $(".add_quantity").click(function () {
        var id_product = $(this).find(".id_product_add").val();
        $.ajax({
            url: "<%=Util.fullPath("add_quantity")%>",
            type: "get",
            data: {
                id_product: id_product
            },
            success: function () {
                window.location.reload();
            },
            error: function (error) {
                alert(error)
            }
        });
    });

    /*===========       DELETE  PRODUCT     ==================*/
    $(".delete_product").click(function () {
        var id_product = $(this).find(".id_del").val();
        $.ajax({
            url: "<%=Util.fullPath("del")%>",
            type: "post",
            data: {
                id_del: id_product
            },
            success: function () {
                window.location.reload();
            },
            error: function (error) {
                alert(error);
            }
        });
    });

</script>

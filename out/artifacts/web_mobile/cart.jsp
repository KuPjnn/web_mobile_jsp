<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page import="vn.edu.nlu.fit.model.Cart" %>
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
            <div class="col-md-8 col-12">
                <%
                    ListCart list_item = (ListCart) session.getAttribute("list_cart");
                    if (list_item.list_cart.isEmpty()) {
                %>
                <p style="font-size: 30px">Chưa có sản phẩm</p>
                <%
                } else {
                    for (Cart item : list_item.list_cart) {
                %>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input type="checkbox" name="select_product" checked>
                            <img width="100px" src="<%=Util.splitImg(item.getPro().getImg())%>" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span><%=item.getPro().getProduct_name()%></span> <br>
                            <span><%=Util.convertPrice(item.getPro().getPrice())%></span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <div class="input-group-append">
                                <a href="minus_quality?id_product=<%=item.getPro().getId_product()+"&link="+Util.urlRedirect(request)%>"
                                   class="btn btn-dark rounded-left">
                                    <i style="color: #fff" class="fas fa-minus"></i>
                                </a>
                            </div>
                            <input type="text" class="form-control" min="1" value="<%=item.getTotal()%>" disabled>
                            <div class="input-group-append">
                                <a href="add_quality?id_product=<%=item.getPro().getId_product()+"&link="+Util.urlRedirect(request)%>"
                                   class="btn btn-dark">
                                    <i style="color: #fff" class="fas fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <form action="<%=Util.fullPath("del?id_del=" + item.getPro().getId_product())%>" method="post">
                            <input onclick="" class="btn btn-dark ml-3" type="submit"
                                   name="delete_product" value="Xóa">
                            <input type="hidden" name="link_cart" value="<%=Util.urlRedirect(request)%>">
                        </form>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="col-md-4 col-12">
                <div class="product_total mt-5 mb-5">
                    <p>Tổng tiền</p>
                    <span id="total"><%=Util.convertPrice(list_item.totalPrice())%></span>

                    <%
                        User user = (User) session.getAttribute("user");
                        if (user == null) {
                    %>
                    <button onclick="alert('Bạn cần đăng nhập.')" class="btn m-auto" type="button">Đặt hàng
                    </button>
                    <%
                    } else if (list_item.list_cart.size() == 0) {
                    %>
                    <button onclick="alert('Chưa có sản phẩm.')" class="btn m-auto" type="button">Đặt hàng
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
<%----------------------------------------------%>

</body>
</html>
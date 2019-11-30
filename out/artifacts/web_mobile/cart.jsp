<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page import="vn.edu.nlu.fit.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Giỏ hàng | Saitama</title>

    <link rel="icon" href="<%=Util.fullPath("img/logo/logo.png")%>" type="image">

    <!--    JQUERY  -->
    <script src="<%=Util.fullPath("lib/jquery/jquery-3.2.1.slim.min.js")%>"></script>

    <!--    BOOTSTRAP   -->
    <link rel="stylesheet" href="<%=Util.fullPath("lib/bootstrap/bootstrap.min.css")%>">
    <script src="<%=Util.fullPath("lib/bootstrap/bootstrap.min.js")%>"></script>
    <script src="<%=Util.fullPath("lib/bootstrap/popper.min.js")%>"></script>

    <!--    FONT AWESOME    -->
    <link rel="stylesheet" href="<%=Util.fullPath("lib/fontawesome/css/all.css")%>">

    <link rel="stylesheet" href="<%=Util.fullPath("css/style.css")%>">
    <link rel="stylesheet" href="<%=Util.fullPath("css/giohang.css")%>">
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
                    ListCart list_item = (ListCart) request.getAttribute("list_cart");
                    for (Cart item : list_item.list_cart) {
                %>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input id="<%=item.getPro().getId_product()%>" onclick="updateTotalPrice()" type="checkbox"
                                   name="select_product" checked>
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
                            <span class="input-group-text">Số lượng</span>
                            <input type="number" class="form-control" value="<%=item.getTotal()%>">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <input class="btn btn-dark ml-3" type="button" name="delete_product" value="Xóa">
                    </div>
                </div>


                <%
                    }
                %>

            </div>
            <div class="col-md-4 col-12">
                <div class="product_total mt-5 mb-5">
                    <p>Tổng tiền</p>
                    <span id="total"><%=Util.convertPrice(list_item.totalPrice())%></span>
                    <button class="btn m-auto" type="submit" data-toggle="modal"
                            data-target="#payModal">Đặt hàng
                    </button>
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
<%@include file="pay_online.jsp" %>
<%----------------------------------------------%>


</body>

<script type="text/javascript">
    var result =<%=list_item.totalPrice()%>;
    <% int i=0 ;%>

    function updateTotalPrice() {
        var checkbox = document.getElementById("<%=list_item.list_cart.get(i).getPro().getId_product()%>");

        <%--for (var i = 0; i < <%=list_item.list_cart.size()%>; i++) {--%>

        if (checkbox[<%=i%>].checked === false) {
            alert(<%=i%>);
            result = result - (<%=list_item.list_cart.get(i).getPro().getPrice()%> *
            <%=list_item.list_cart.get(i).getTotal()%>)
            document.getElementById('total').innerText = result;
        } else if (checkbox[<%=i%>].checked === true) {
            alert(<%=i%>);
            result = result + (<%=list_item.list_cart.get(i).getPro().getPrice()%> *
            <%=list_item.list_cart.get(i).getTotal()%>)
            document.getElementById('total').innerText = result;
        }
        // }
    }

</script>

</html>
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
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input type="checkbox" name="select_product">
                            <img width="100px" src="img/note8pro-t.jpg" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span>Xiaomi Mi 9</span> <br>
                            <span>Giá : 12.000.000đ</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <span class="input-group-text">Số lượng</span>
                            <input type="number" class="form-control" value="1">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <input class="btn btn-dark ml-3" type="button" name="delete_product" value="Xóa">
                    </div>
                </div>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input type="checkbox" name="select_product">
                            <img width="100px" src="img/note8pro-t.jpg" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span>Xiaomi Mi 9</span> <br>
                            <span>Giá : 12.000.000đ</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <span class="input-group-text">Số lượng</span>
                            <input type="number" class="form-control" value="1">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <input class="btn btn-dark ml-3" type="button" name="delete_product" value="Xóa">
                    </div>
                </div>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input type="checkbox" name="select_product">
                            <img width="100px" src="img/note8pro-t.jpg" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span>Xiaomi Mi 9</span> <br>
                            <span>Giá : 12.000.000đ</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <span class="input-group-text">Số lượng</span>
                            <input type="number" class="form-control" value="1">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <input class="btn btn-dark ml-3" type="button" name="delete_product" value="Xóa">
                    </div>
                </div>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input type="checkbox" name="select_product">
                            <img width="100px" src="img/note8pro-t.jpg" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span>Xiaomi Mi 9</span> <br>
                            <span>Giá : 12.000.000đ</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <span class="input-group-text">Số lượng</span>
                            <input type="number" class="form-control" value="1">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <input class="btn btn-dark ml-3" type="button" name="delete_product" value="Xóa">
                    </div>
                </div>
                <div class="product_cart row">
                    <div class="col-md-3 col-6">
                        <div>
                            <input type="checkbox" name="select_product">
                            <img width="100px" src="img/note8pro-t.jpg" alt="img">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 detail_cart">
                        <div class="float-left mt-4">
                            <span>Xiaomi Mi 9</span> <br>
                            <span>Giá : 12.000.000đ</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <div class="input-group">
                            <span class="input-group-text">Số lượng</span>
                            <input type="number" class="form-control" value="1">
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mt-4">
                        <input class="btn btn-dark ml-3" type="button" name="delete_product" value="Xóa">
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-12">
                <div class="product_total mt-5 mb-5">
                    <p>Tổng tiền</p>
                    <span>36.000.000đ</span>
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

<!--==============  MODAL LOGIN   ==============-->
<%@include file="login.jsp" %>

<!--==============  MODAL REGIS   ==============-->
<%@include file="register.jsp" %>

</body>
</html>
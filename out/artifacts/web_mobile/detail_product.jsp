<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="img/logo/logo.png" type="image">
    <title>Chi tiết sản phẩm | Saitama</title>

    <!--    JQUERY  -->
    <script src="lib/jquery/jquery-3.2.1.slim.min.js"></script>
    <!--    BOOTSTRAP   -->
    <link rel="stylesheet" href="lib/bootstrap/bootstrap.min.css">
    <script src="lib/bootstrap/bootstrap.min.js"></script>

    <!--    FONT AWESOME    -->
    <link rel="stylesheet" href="lib/fontawesome/css/all.css">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/chitietsanpham.css">
</head>
<body>

<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================   BODY    ===============--%>
<section id="product_detail" class="bg-light">
    <div class="container">
        <!-- CHI TIẾT SẢN PHẨM-->
        <div class="py-3">
            <h3>Chi tiết sản phẩm</h3>
        </div>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("resultSet");
            while (rs.next()) {
        %>
        <div class="row">
            <div class="col-md-7 col-12">
                <div class="img_product_detail" align="center">
                    <img class="img-fluid" width="500px" alt="img" src="<%=rs.getString(3)%>">
                    <h5 class="my-3"><%=Util.convertPrice(rs.getDouble(2))%>
                    </h5>
                </div>
                <div align="center">
                    <form action="pay.jsp" class="">
                        <button class="btn_buy col-md-5 buy_now mt-1" type="submit">Mua ngay</button>
                        <button class="btn_add col-md-5 add_shop_cart mt-1" type="button">Thêm vào giỏ</button>
                    </form>
                </div>
            </div>
            <div class="col-md-5 col-12">
                <div>
                    <h4 class="mt-5">Thông số kĩ thuật</h4>
                    <h5 class="my-3"><%=rs.getString(4) + " " + rs.getString(1)%>
                    </h5>
                    <%
                        ResultSet conf = (ResultSet) request.getAttribute("configuration");
                        while (conf.next()) {
                    %>
                    <p>Màn hình : <span><%=conf.getString(3)%></span></p>
                    <p>Camera trước :<span><%=conf.getString(4)%></span></p>
                    <p>Camera sau : <span><%=conf.getString(5)%></span></p>
                    <p>Ram : <span><%=conf.getString(6)%></span></p>
                    <p>Bộ nhớ trong : <span><%=conf.getString(7)%></span></p>
                    <p>CPU : <span><%=conf.getString(8)%></span></p>
                    <p>GPU : <span><%=conf.getString(9)%></span></p>
                    <p>Dung lượng pin : <span><%=conf.getString(10)%></span></p>
                    <p>Hệ điều hành : <span><%=conf.getString(11)%></span></p>
                    <p>Thẻ sim : <span><%=conf.getString(12)%></span></p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <!--ĐÁNH GIÁ SẢN PHẨM-->
        <div class="py-3">
            <h3>Nhận xét sản phẩm</h3>
        </div>
        <div class="product_evaluation">
            <form method="get">
                <div class="input-group mb-3">
                    <input type="text" class="form-control"
                           placeholder="Viết đánh giá ...">
                    <div class="input-group-append">
                        <button class="btn_evaluation btn btn-dark" type="submit">Bình luận</button>
                    </div>
                </div>
            </form>
            <div>
                <div class="user_evaluation">
                    <span class="float-right">12/12/2019</span>
                    <p>Bởi : Nguyễn Quốc Hoàng Huy</p>
                    <span>Giảm giá s10 + trả góp 0% được không ạ? Mấy ngày trước còn thấy giảm giá trả góp 0% mà sao giờ hết rồi ạ</span>
                </div>
            </div>
        </div>
        <!--SẢN PHẨM TƯƠNG TỰ-->
        <div class="py-3">
            <h3>Sản phẩm tương tự</h3>
        </div>
        <div class="product_similar">
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="product_item">
                        <div class="figure figure-img">
                            <a href="detail_product.jpp">
                                <img class="img-fluid" src="img/smart_phone/note8pro-t-300x300.jpg" alt="img">
                            </a>
                        </div>
                        <h5 class="product_name"><a href="detail_product.jpp">Xiaomi MI 9</a></h5>
                        <span class="product_price">12.000.000</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<!--==============  MODAL LOGIN   ==============-->
<%@include file="login.jsp" %>

<!--==============  MODAL REGIS   ==============-->
<%@include file="register.jsp" %>

</body>
</html>
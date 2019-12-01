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
    <link rel="stylesheet" href="css/slideshow.css">

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
            ResultSet detail = (ResultSet) request.getAttribute("detailProduct");

            while (detail.next()) {
        %>
        <div class="row">
            <div class="col-md-7 col-12">
                <div class="img_product_detail" align="center">

                    <div id="thumbnails-product" class="carousel slide carousel-fade carousel-thumbnails bg-white"
                         data-ride="carousel"
                         data-interval="2000">
                        <div style="padding-bottom: 100px">
                            <div class="carousel-inner" role="listbox">
                                <%
                                    String img = detail.getString(3);
                                    String[] arrImg = img.split("~");
                                    int j = 0;
                                    for (String image : arrImg) {
                                        if (j == 0) {
                                %>
                                <div class="carousel-item active">
                                    <img class="img-fluid d-block" src="<%=image%>" alt="slide">
                                </div>
                                <%
                                } else {
                                %>
                                <div class="carousel-item">
                                    <img class="img-fluid d-block" src="<%=image%>" alt="slide">
                                </div>
                                <%
                                        }
                                        j++;
                                    }
                                %>
                            </div>
                        </div>
                        <%--=============== CONTROL ===============--%>
                        <a class="carousel-control-prev" href="#thumbnails-product" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#thumbnails-product" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"
                                  style=""></span>
                            <span class="sr-only">Next</span>
                        </a>
                        <ol class="carousel-indicators">
                            <%
                                for (int i = 0; i < arrImg.length; i++) {
                                    if (i == 0) {
                            %>
                            <li data-target="#thumbnails-product" data-slide-to="<%=i%>" class="active">
                                <img class="d-block w-100" src="<%=arrImg[i]%>" class="img-fluid">
                            </li>
                            <%
                            } else {
                            %>
                            <li data-target="#thumbnails-product" data-slide-to="<%=i%>">
                                <img class="d-block w-100" src="<%=arrImg[i]%>" class="img-fluid">
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ol>
                    </div>
                    <%--=========================--%>
                    <h5 class="my-3"><%=Util.convertPrice(detail.getDouble(2))%>
                    </h5>
                </div>
                <div align="center">
                    <form action="pay.jsp" method="post">
                        <button class="btn_buy col-md-5 buy_now mt-1" type="submit">Mua ngay</button>
                    </form>
                    <form action="<%=Util.fullPath("add?id=" + detail.getString(6))%>" method="post">
                        <button class="btn_add col-md-5 add_shop_cart mt-1" type="submit">Thêm vào giỏ</button>
                        <input type="hidden" name="link_detail" value="<%=Util.urlRedirect(request)%>">
                    </form>
                </div>
            </div>
            <div class="col-md-5 col-12">
                <div>
                    <h4 class="mt-5">Thông số kĩ thuật</h4>
                    <h5 class="my-3"><%=detail.getString(4) + " " + detail.getString(1)%>
                    </h5>
                    <%
                        ResultSet conf = (ResultSet) request.getAttribute("configuration");
                        while
                        (conf.next()) {
                    %>
                    <p>Màn hình : <span><%=conf.getString(2)%></span></p>
                    <p>Camera trước :<span><%=conf.getString(3)%></span></p>
                    <p>Camera sau : <span><%=conf.getString(4)%></span></p>
                    <p>Ram : <span><%=conf.getString(5)%></span></p>
                    <p>Bộ nhớ trong : <span><%=conf.getString(6)%></span></p>
                    <p>CPU : <span><%=conf.getString(7)%></span></p>
                    <p>GPU : <span><%=conf.getString(8)%></span></p>
                    <p>Dung lượng pin : <span><%=conf.getString(9)%></span></p>
                    <p>Hệ điều hành : <span><%=conf.getString(10)%></span></p>
                    <p>Thẻ sim : <span><%=conf.getString(11)%></span></p>
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
                <%
                    ResultSet comment = (ResultSet) request.getAttribute("comment");
                    while (comment.next()) {
                %>
                <div class="user_evaluation">
                    <span class="float-right"><%=comment.getString(5)%></span>
                    <p>Bởi : <%=comment.getString(2)%>
                    </p>
                    <span><%=comment.getString(4)%></span>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <!--SẢN PHẨM TƯƠNG TỰ-->
        <div class="py-3">
            <h3>Sản phẩm tương tự</h3>
        </div>
        <div class="product_similar">
            <div class="row">
                <%
                    int i = 1;
                    ResultSet like = (ResultSet) request.getAttribute("like");
                    while
                    (like.next()) {
                        if (i <= 8) {
                %>
                <div class="col-md-3 col-6">
                    <div class="product_item">
                        <div class="figure figure-img">
                            <a href="<%=Util.fullPath("detail_product?detail="+like.getString(6))%>">
                                <%
                                    String img = like.getString(3);
                                    String[] arrImg = img.split("~");
                                %>
                                <img class="img-fluid" src="<%=arrImg[0]%>" alt="img">
                            </a>
                        </div>
                        <h5 class="product_name"><a
                                href="<%=Util.fullPath("detail_product?detail="+like.getString(6))%>">
                            <%=like.getString(1)%>
                        </a></h5>
                        <span class="product_price"><%=Util.convertPrice(like.getDouble(2))%></span>
                    </div>
                </div>
                <%
                            i++;
                        }
                    }
                %>
            </div>
        </div>
    </div>
</section>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<%--=================   SLIDE    =============--%>
<style type="text/css">
    .carousel-indicators .carousel-indicators img {
        max-width: 100px;
        height: 50px;
        overflow: hidden;
        display: block;
    }

    .carousel-thumbnails .carousel-indicators li {
        height: auto;
        max-width: 100px;
        width: 50px;
        border: none;
        box-shadow: 1px 3px 5px 0px rgba(0, 0, 0, 1);
    }

    .carousel-thumbnails .carousel-indicators li.active {
        border-bottom: 4px solid #ff6700;
    }

    .carousel-control-next,
    .carousel-control-prev {
        filter: invert(100%);
    }
</style>
<script type="text/javascript">
    document.documentElement.setAttribute("lang", "en");
    document.documentElement.removeAttribute("class");

    axe.run(function (err, results) {
        console.log(results.violations);
    });
</script>
<%-----------------------------------------------%>
</body>
</html>
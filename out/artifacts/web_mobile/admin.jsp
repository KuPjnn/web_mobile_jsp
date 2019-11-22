<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="img/logo/logo.png" type="image">
    <title>Admin Page</title>

    <!--    JQUERY  -->
    <script src="lib/jquery/jquery-3.2.1.slim.min.js"></script>
    <!--    BOOTSTRAP   -->
    <link rel="stylesheet" href="lib/bootstrap/bootstrap.min.css">
    <script src="lib/bootstrap/bootstrap.min.js"></script>

    <!--    FONT AWESOME    -->
    <link rel="stylesheet" href="lib/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header id="admin_header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <nav class="admin_header navbar">
                    <div class="col-md-2 col-3">
                        <a class="logo navbar-brand m-auto" href="#">
                            <img class="img-fluid" width="50" src="img/logo/logo.svg" alt="logo">
                        </a>
                    </div>
                    <div class="col-md-7 col-9">
                        <div class=" navbar-nav m-auto">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Tìm kiếm......">
                                <div class="input-group-append">
                                    <button class="btn btn-dark" type="submit"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col12">
                        <ul class="login mt-3 float-right">
                            <a class="mx-3 text-decoration-none" href="info_user.jsp"><i
                                    class="fa fa-user"></i>Admin</a>
                            <a class="text-decoration-none" href="index.jsp">Đăng xuất</a>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<div id="admin_body">
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-md-block bg-light mt-1">
                <div class="nav nav-pills flex-column ">
                    <a class="nav-item active" data-toggle="pill" href="#admin_khachhang">
                        <i class="fa fa-user"></i>
                        Người dùng
                    </a>
                    <a class="nav-item" data-toggle="pill" href="#admin_donhang">
                        <i class="fa fa-cart-arrow-down"></i>
                        Đơn hàng
                    </a>
                    <a class="nav-item" data-toggle="pill" href="#admin_hanghoa">
                        <i class="fas fa-dumpster"></i>
                        Hàng hóa
                    </a>
                    <a class="nav-item " data-toggle="pill" href="#admin_sanpham">
                        <i class="fab fa-product-hunt"> </i>
                        Sản phẩm
                    </a>
                    <a class="nav-item" data-toggle="pill" href="#admin_binhluan">
                        <i class="fa fa-comment"> </i>
                        Bình luận
                    </a>
                    <a class="nav-item" data-toggle="pill" href="#admin_slideshow">
                        <i class="fab fa-slideshare"></i>
                        Slideshow
                    </a>
                </div>
            </nav>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <!--NGƯỜI DÙNG-->
                <%@include file="admin_user.jsp" %>
                <!--ĐƠN HÀNG-->
                <%@include file="admin_bill.jsp" %>
                <!--HÀNG HÓA-->
                <%@include file="admin_items.jsp" %>
                <!--SẢN PHẨM-->
                <%@include file="admin_product.jsp" %>
                <!--BÌNH LUẬN-->
                <%@include file="admin_comment.jsp" %>
                <!--SLIDE SHOW-->
                <%@include file="admin_slide.jsp" %>
            </div>
        </div>
    </div>
</div>
</body>
</html>

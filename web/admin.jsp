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
                            <a class="mx-5 text-decoration-none" href="info_user.jsp"> <i class="fa fa-user"></i>Admin</a>
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
                <div id="admin_khachhang" class="card mt-1 tab-pane active">
                    <div class="card-header">Người dùng
                        <button class="btn btn-danger ml-xl-5">Phân quyền</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên khách hàng</th>
                                <th>Tên đăng nhập</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Quyền hạn</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#12346</th>
                                <th>Hoàng Văn Long</th>
                                <th>hoangvanlong</th>
                                <th>abc@gmail.com</th>
                                <th>0123456789</th>
                                <th>Admin</th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#12346</th>
                                <th>Hoàng Văn Long</th>
                                <th>hoangvanlong</th>
                                <th>abc@gmail.com</th>
                                <th>0123456789</th>
                                <th>Admin</th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#12346</th>
                                <th>Hoàng Văn Long</th>
                                <th>hoangvanlong</th>
                                <th>abc@gmail.com</th>
                                <th>0123456789</th>
                                <th>Khách hàng</th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#12346</th>
                                <th>Hoàng Văn Long</th>
                                <th>hoangvanlong</th>
                                <th>abc@gmail.com</th>
                                <th>0123456789</th>
                                <th>Khách hàng</th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#12346</th>
                                <th>Hoàng Văn Long</th>
                                <th>hoangvanlong</th>
                                <th>abc@gmail.com</th>
                                <th>0123456789</th>
                                <th>Khách hàng</th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#12346</th>
                                <th>Hoàng Văn Long</th>
                                <th>hoangvanlong</th>
                                <th>abc@gmail.com</th>
                                <th>0123456789</th>
                                <th>Khách hàng</th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--ĐƠN HÀNG-->
                <div id="admin_donhang" class="card mt-1 tab-pane fade">
                    <div class="card-header">Đơn hàng</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Mã khách hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày lập</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#98765</th>
                                <th>#55132</th>
                                <th>Văn Công Khôi</th>
                                <th>12/12/2019</th>
                                <th>TP. HCM</th>
                                <th>Đã thanh toán</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>#55132</th>
                                <th>Văn Công Khôi</th>
                                <th>12/12/2019</th>
                                <th>TP. HCM</th>
                                <th>Chưa thanh toán</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>#55132</th>
                                <th>Văn Công Khôi</th>
                                <th>12/12/2019</th>
                                <th>TP. HCM</th>
                                <th>Đã thanh toán</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--HÀNG HÓA-->
                <div id="admin_hanghoa" class="card mt-1 tab-pane fade">
                    <div class="card-header">Hàng hóa
                        <button class="btn btn-danger ml-xl-5">Thêm hàng hóa</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#98765</th>
                                <th>Điện thoại</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>Máy tính bảng</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>Laptop</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--SẢN PHẨM-->
                <div id="admin_sanpham" class="card mt-1 tab-pane fade">
                    <div class="card-header">Sản phẩm
                        <button class="btn btn-danger ml-xl-5">Thêm sản phẩm</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Tên hàng hóa</th>
                                <th>Nhà cung cấp</th>
                                <th>Giá</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th>Cấu hình</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#98765</th>
                                <th>Xiaomi Mi 9</th>
                                <th>Điện thoại</th>
                                <th>Xiaomi</th>
                                <th>12.000.000đ</th>
                                <th><img class="img-fluid img-thumbnail" src="img/note8pro-t.jpg" width="50px"></th>
                                <th>1200</th>
                                <th>
                                    <button class="btn btn-warning rounded">Cấu hình</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>Xiaomi Mi 9</th>
                                <th>Điện thoại</th>
                                <th>Xiaomi</th>
                                <th>12.000.000đ</th>
                                <th><img class="img-fluid img-thumbnail" src="img/note8pro-t.jpg" width="50px"></th>
                                <th>1200</th>
                                <th>
                                    <button class="btn btn-warning rounded">Cấu hình</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>Xiaomi Mi 9</th>
                                <th>Điện thoại</th>
                                <th>Xiaomi</th>
                                <th>12.000.000đ</th>
                                <th><img class="img-fluid img-thumbnail" src="img/note8pro-t.jpg" width="50px"></th>
                                <th>1200</th>
                                <th>
                                    <button class="btn btn-warning rounded">Cấu hình</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>Xiaomi Mi 9</th>
                                <th>Điện thoại</th>
                                <th>Xiaomi</th>
                                <th>12.000.000đ</th>
                                <th><img class="img-fluid img-thumbnail" src="img/note8pro-t.jpg" width="50px"></th>
                                <th>1200</th>
                                <th>
                                    <button class="btn btn-warning rounded">Cấu hình</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th>Xiaomi Mi 9</th>
                                <th>Điện thoại</th>
                                <th>Xiaomi</th>
                                <th>12.000.000đ</th>
                                <th><img class="img-fluid img-thumbnail" src="img/note8pro-t.jpg" width="50px"></th>
                                <th>1200</th>
                                <th>
                                    <button class="btn btn-warning rounded">Cấu hình</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Sửa</button>
                                </th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--BÌNH LUẬN-->
                <div id="admin_binhluan" class="card mt-1 tab-pane fade">
                    <div class="card-header">Bình luận</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên người dùng</th>
                                <th>Tên sản phẩm</th>
                                <th>Nội dung</th>
                                <th>Ngày bình luận</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật Bản
                                </th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật</th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật</th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật</th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật</th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật</th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr class="">
                                <th>#98765</th>
                                <th>Hoàng Huy</th>
                                <th>Iphone 6s plus</th>
                                <th class="w-50 h-25">Đỉnh cao công nghệ Nhật</th>
                                <th>12/10/2019</th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--SLIDE SHOW-->
                <div id="admin_slideshow" class="card mt-1 tab-pane fade">
                    <div class="card-header">Slideshow
                        <button class="btn btn-danger ml-xl-5">Thêm Sildeshow</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ảnh</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#98765</th>
                                <th><img class="img-fluid img-thumbnail" src="img/slide/xiaomi-air-2-1.jpg"
                                         width="300px"></th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th><img class="img-fluid img-thumbnail" src="img/slide/xiaomi-air-2-1.jpg"
                                         width="300px"></th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
                            <tr>
                                <th>#98765</th>
                                <th><img class="img-fluid img-thumbnail" src="img/slide/xiaomi-air-2-1.jpg"
                                         width="300px"></th>
                                <th>
                                    <button class="btn btn-dark rounded">Xóa</button>
                                </th>
                            </tr>
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

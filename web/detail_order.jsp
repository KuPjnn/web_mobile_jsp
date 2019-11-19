<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="img/logo/logo.png" type="image">
    <title>Chi tiết đơn hàng | Saitama</title>

    <!--    JQUERY  -->
    <script src="lib/jquery/jquery-3.2.1.slim.min.js"></script>

    <!--    BOOTSTRAP   -->
    <link rel="stylesheet" href="lib/bootstrap/bootstrap.min.css">
    <script src="lib/bootstrap/bootstrap.min.js"></script>
    <script src="lib/bootstrap/popper.min.js"></script>

    <!--    FONT AWESOME    -->
    <link rel="stylesheet" href="lib/fontawesome/css/all.css">

    <link rel="stylesheet" href="css/style.css">
    <style>
        thead th {
            font-size: 20px;
            color: #ff6700;
        }

        tbody td {
            font-size: 18px;
        }

        tbody th {
            font-weight: bold;
            font-size: 18px;
        }

        tfoot td {
            font-weight: bold;
            font-size: 20px;
        }
    </style>
</head>
<body>

<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================   BODY    ==============--%>
<section id="main_body">
    <div class="container ">
        <div class="py-3">
            <p class="title_detail">Chi tiết đơn hàng</p>
        </div>
        <div class="row">
            <div class="col-md-7 col-11 m-auto pb-5">
                <div class="table-responsive border rounded">
                    <table class="table">
                        <thead class="bg-dark">
                        <tr>
                            <th>Thông tin</th>
                            <th>Chi tiết</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>Mã đơn hàng:</th>
                            <td>123</td>
                        </tr>
                        <tr>
                            <th>Ngày đặt:</th>
                            <td>28/10/2019</td>
                        </tr>
                        <tr>
                            <th>Sản phẩm:</th>
                            <td>Xiaomi Mi Note 8</td>
                        </tr>
                        <tr>
                            <th>Phương thức thanh toán:</th>
                            <td>Trả trước</td>
                        </tr>

                        <tr>
                            <th>Trạng thái thanh toán</th>
                            <td>Đã thanh toán</td>
                        </tr>

                        </tbody>
                        <tfoot>
                        <tr>
                            <td>Tổng tiền:</td>
                            <td>12.000.000Đ</td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

        </div>
    </div>
</section>
<%----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

<!--==============  MODAL LOGIN   ==============-->
<%@include file="login.jsp" %>

<!--==============  MODAL REGIS   ==============-->
<%@include file="register.jsp" %>

</body>
</html>
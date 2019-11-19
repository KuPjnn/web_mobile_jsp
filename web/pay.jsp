<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="img/logo/logo.png" type="image">
    <title>Thanh toán | Saitama</title>

    <!--    JQUERY  -->
    <script src="<%=Util.fullPath("lib/jquery/jquery-3.2.1.slim.min.js")%>"></script>

    <!--    BOOTSTRAP   -->
    <link rel="stylesheet" href="<%=Util.fullPath("lib/bootstrap/bootstrap.min.css")%>">
    <script src="<%=Util.fullPath("lib/bootstrap/bootstrap.min.js")%>"></script>
    <script src="<%=Util.fullPath("lib/bootstrap/popper.min.js")%>"></script>

    <!--    FONT AWESOME    -->
    <link rel="stylesheet" href="<%=Util.fullPath("lib/fontawesome/css/all.css")%>">

    <link rel="stylesheet" href="<%=Util.fullPath("css/style.css")%>">
    <link rel="stylesheet" href="<%=Util.fullPath("css/online.css")%>">
</head>
<body>

<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================    BODY    ==============--%>
<section id="main_body">
    <div class="container ">
        <div class="pt-3">
            <p class="title_detail">Thanh toán online</p>
        </div>
        <div id="row">
            <div class="col-md-6 col-12 mx-auto pb-5">
                <form method="get" action="detail_order.jsp">
                    <div class="card m-auto">
                        <div class="card-header bg-dark">
                            <p class="title_big text-center">Thông tin giao dịch</p>
                        </div>
                        <div class="card-body">
                            <li><b>Số tiền :</b> 12.000.000đ</li>
                            <hr>
                            <li><b>Nội dung thanh toán : </b> mua hàng</li>
                            <hr>
                            <h4 class="font-weight-bold text-center mt-5">Tài khoản</h4>
                            <div class="form-label-group w-75 mx-auto my-5">
                                <input type="text" id="name" class="form-control"
                                       placeholder="Tên chủ tài khoản">
                            </div>
                            <div class="form-label-group w-75 mx-auto mb-5">
                                <input type="tel" id="inputSTK" class="form-control"
                                       placeholder="Số tài khoản">
                            </div>
                            <hr>
                            <div align="center">
                                <button class="btn btn_pay px-5" type="submit">Ok</button>
                                <button class="btn font-weight-bold btn-secondary px-5" type="reset">Hủy</button>
                            </div>
                        </div>
                    </div>
                </form>
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
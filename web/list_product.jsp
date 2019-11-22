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
    <title>Danh sách sản phẩm | Saitama</title>

    <!--    JQUERY  -->
    <script src="lib/jquery/jquery-3.2.1.slim.min.js"></script>

    <!--    BOOTSTRAP   -->
    <link rel="stylesheet" href="lib/bootstrap/bootstrap.min.css">
    <script src="lib/bootstrap/bootstrap.min.js"></script>
    <script src="lib/bootstrap/popper.min.js"></script>

    <!--    FONT AWESOME    -->
    <link rel="stylesheet" href="lib/fontawesome/css/all.css">

    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================   BODY      =============--%>
<section id="main_body">
    <div class="container">

        <!--==========  PRODUCT LIsT    ==========-->
        <div class="product">
            <!--=============   SMART PHONE ==================-->
            <div class="smart_phone">
                <div class="pt-3">
                    <p class="tilte">Danh sách sản phẩm</p>
                </div>
                <div class="row">
                    <%
                        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                        rs.beforeFirst();
                        while (rs.next()) {
                    %>
                    <div class="col-md-3 col-6">
                        <div class="product_item">
                            <div class="figure figure-img">
                                <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <img class="img-fluid" src="<%=rs.getString(3)%>" alt="img">
                                </a>
                            </div>
                            <h5 class="product_name"><a
                                    href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                <%=rs.getString(4) + " " + rs.getString(1)%>
                            </a></h5>
                            <span class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>
    </div>
</section>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

</body>
</html>
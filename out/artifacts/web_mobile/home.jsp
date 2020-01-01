<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Trang chủ | Saitama</title>
    <%@include file="headAllPage.jsp" %>
</head>
<body>
<%@include file="backToTop.jsp" %>
<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>
<%--=================    BODY    ==============--%>
<%--<section id="main_body">
    <div class="container">

        <!--=========   SLIDE SHOW  ==========-->
        <%@include file="slideshow.jsp" %>

        <!--==========  PRODUCT LIsT    ==========-->
        <div class="product">
            <!--=============   SMART PHONE ==================-->
            <div class="smart_phone">
                <div class="pt-3">
                    <p class="tilte">Điện thoại</p>
                </div>
                <div class="row">
                    <%
                        int i = 1;
                        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                        rs.beforeFirst();
                        while (rs.next()) {
                            if (i <= 8 && rs.getString(5).equalsIgnoreCase("DT")) {
                    %>
                    <div class="frame col-md-3 col-6">
                        <div class="product_item">
                            <div class="figure figure-img">
                                <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <img class="img-fluid align-content-center"
                                         src="<%=Util.splitImg(rs.getString(3))%>" alt="img">
                                </a>
                            </div>
                            <h5 class="product_name"><a
                                    href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                <%=rs.getString(1)%>
                            </a></h5>
                            <span class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></span>
                        </div>
                    </div>
                    <%
                                i++;
                            }
                        }
                    %>
                </div>
            </div>
            <!--============= TABLET   ===============-->
            <div class="tablet">
                <p class="tilte">Máy tính bảng</p>
                <div class="row">
                    <%
                        i = 1;
                        rs = (ResultSet) request.getAttribute("resultSet");
                        rs.beforeFirst();
                        while (rs.next()) {
                            if (i <= 8 && rs.getString(5).equalsIgnoreCase("MTB")) {
                    %>
                    <div class="frame col-md-3 col-6">
                        <div class="product_item">
                            <div class="figure figure-img">
                                <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <%
                                        String img = rs.getString(3);
                                        String[] arrImg = img.split("~");
                                    %>
                                    <img class="img-fluid" src="<%=arrImg[0]%>" alt="img">
                                </a>
                            </div>
                            <h5 class="product_name">
                                <a href="<%=Util.fullPath("detail_product?detail=" + rs.getString(6))%>">
                                    <%=rs.getString(1)%>
                                </a>
                            </h5>
                            <span class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></span>
                        </div>
                    </div>
                    <%
                                i++;
                            }
                        }
                    %>
                </div>
            </div>
            <!--=============   LAPTOP  =================-->
            <div class="laptop">
                <p class="tilte">Laptop</p>
                <div class="row">
                    <%
                        i = 1;
                        rs = (ResultSet) request.getAttribute("resultSet");
                        rs.beforeFirst();
                        while (rs.next()) {
                            if (i <= 8 && rs.getString(5).equalsIgnoreCase("LT")) {
                    %>
                    <div class="frame col-md-3 col-6">
                        <div class="product_item">
                            <div class="figure figure-img">
                                <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <%
                                        String img = rs.getString(3);
                                        String[] arrImg = img.split("~");
                                    %>
                                    <img class="img-fluid" src="<%=arrImg[0]%>" alt="img">
                                </a>
                            </div>
                            <h5 class="product_name"><a
                                    href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                <%=rs.getString(1)%>
                            </a></h5>
                            <span class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></span>
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
    </div>
</section>--%>
<section id="main_body">
    <div class="container">
        <!--=========   SLIDE SHOW  ==========-->
        <%@include file="slideshow.jsp" %>

        <div class="row" style="margin-top: 20px">
            <img src="<%=Util.fullPath("img/phone/bao-hanh-1.jpg")%>" class="advertise col-md-4 mr-0">
            <img src="<%=Util.fullPath("img/phone/giao-hang.jpg")%>" class="advertise col-md-4 mr-0">
            <img src="<%=Util.fullPath("img/phone/tra-gop.jpg")%>" class="advertise col-md-4 mr-0">
        </div>
        <!--==========  PRODUCT LIsT    ==========-->
        <div class="product">
            <!--=============   SMART PHONE ==================-->
            <div class="smart_phone">

                <div class="pt-3">
                    <p class="tilte">Điện thoại</p>
                </div>
                <div class="row">
                    <div class="advertise col-md-3 mb-3">
                        <img width="235px" class="img-fluid" src="<%=Util.fullPath("img/phone/banner614-k20.gif")%>">
                    </div>
                    <div class="row col-md-9">
                        <%
                            int i = 1;
                            ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                            rs.beforeFirst();
                            while (rs.next()) {
                                if (i <= 8 && rs.getString(5).equalsIgnoreCase("DT")) {
                        %>
                        <div class="frame col-md-3 col-6 d-flex">
                            <div class="product_item">
                                <div class="figure figure-img">
                                    <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                        <img class="img-fluid align-content-center"
                                             src="<%=Util.splitImg(rs.getString(3))%>" alt="img">
                                        <label class="discountt "
                                               style="visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>"><i
                                                class="fas fa-tags"> </i> GIẢM <%=Util.convertPrice(rs.getDouble(7))%>
                                        </label>
                                        <div class=" cotain_icon">
                                            <div class="btn_add icon">
                                                <a class="add"><i class="fas fa-cart-plus"></i></a>
                                                <input type="hidden" class="id_product" value="<%=rs.getString(6)%>">
                                            </div>
                                            <div class="icon">
                                                <a href="<%=Util.fullPath("add?id=" + rs.getString(6)+"&btn=buynow")%>">
                                                    <i class="fas fa-dollar-sign"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <h5 class="product_name"><a
                                        href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <%=rs.getString(1)%>
                                </a>
                                    <span class="product_price"><%=Util.convertPrice(rs.getDouble(2) - rs.getDouble(7))%></span>
                                    <div>  <span
                                            style="font-size: 12px;color: #4e555b;visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>">
                                 <del class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></del></span>
                                    </div>
                                </h5>
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
            <!--============= TABLET   ===============-->
            <div class="tablet">
                <p class="tilte">Máy tính bảng</p>
                <div class="row">
                    <div class="advertise col-md-3 mb-3">
                        <img class="img-fluid" width="235px" src="<%=Util.fullPath("img/phone/banner614-oto.jpg")%>">
                    </div>
                    <div class="row col-md-9">
                        <%
                            i = 1;
                            rs = (ResultSet) request.getAttribute("resultSet");
                            rs.beforeFirst();
                            while (rs.next()) {
                                if (i <= 8 && rs.getString(5).equalsIgnoreCase("MTB")) {
                        %>
                        <div class="frame col-md-3 col-6 ml-0 d-flex align-items-stretch">
                            <div class="product_item">
                                <div class="figure figure-img ">
                                    <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                        <%
                                            String img = rs.getString(3);
                                            String[] arrImg = img.split("~");
                                        %>
                                        <img class="img-fluid" src="<%=arrImg[0]%>" alt="img">
                                        <label class="discountt"
                                               style="visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>">
                                            <i class="fas fa-tags"> </i> GIẢM <%=Util.convertPrice(rs.getDouble(7))%>
                                        </label>
                                        <div class=" cotain_icon">
                                            <div class="btn_add icon">
                                                <a><i class="fas fa-cart-plus"> </i></a>
                                                <input type="hidden" class="id_product" value="<%=rs.getString(6)%>">
                                            </div>
                                            <div class="icon">
                                                <a href="<%=Util.fullPath("add?id=" + rs.getString(6)+"&btn=buynow")%>">
                                                    <i class="fas fa-dollar-sign"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </a>

                                </div>
                                <h5 class="product_name">
                                    <a href="<%=Util.fullPath("detail_product?detail=" + rs.getString(6))%>">
                                        <%=rs.getString(1)%>
                                    </a>
                                    <span class="product_price"><%=Util.convertPrice(rs.getDouble(2) - rs.getDouble(7))%></span>
                                    <div>  <span
                                            style="font-size: 12px;color: #4e555b;visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>">
                                 <del class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></del></span>
                                    </div>
                                </h5>
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
            <!--=============   LAPTOP  =================-->
            <div class="laptop">
                <p class="tilte">Laptop</p>
                <div class="row">
                    <div class="advertise col-md-3 mb-3">
                        <img class="img-fluid" width="235px" src="<%=Util.fullPath("img/phone/468-laptop.jpg")%>">
                    </div>
                    <div class="row col-md-9">
                        <%
                            i = 1;
                            rs = (ResultSet) request.getAttribute("resultSet");
                            rs.beforeFirst();
                            while (rs.next()) {
                                if (i <= 8 && rs.getString(5).equalsIgnoreCase("LT")) {
                        %>
                        <div class="frame col-md-3 col-6 d-flex align-items-stretch mx-0">
                            <div class="product_item">
                                <div class="figure figure-img">
                                    <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                        <%
                                            String img = rs.getString(3);
                                            String[] arrImg = img.split("~");
                                        %>
                                        <img class="img-fluid" src="<%=arrImg[0]%>" alt="img">
                                        <label class="discountt"
                                               style="visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>">
                                            <i class="fas fa-tags"> </i> GIẢM <%=Util.convertPrice(rs.getDouble(7))%>
                                        </label>
                                        <div class=" cotain_icon">
                                            <div class="btn_add icon">
                                                <a href=""><i class="fas fa-cart-plus"> </i></a>
                                                <input type="hidden" class="id_product" value="<%=rs.getString(6)%>">
                                            </div>
                                            <div class="icon">
                                                <a href="<%=Util.fullPath("add?id=" + rs.getString(6)+"&btn=buynow")%>">
                                                    <i class="fas fa-dollar-sign"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </a>

                                </div>
                                <h5 class="product_name"><a
                                        href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <%=rs.getString(1)%>
                                </a>
                                    <span class="product_price"><%=Util.convertPrice(rs.getDouble(2) - rs.getDouble(7))%></span>
                                    <div>
                                        <span style="font-size: 12px;color: #4e555b;visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>">
                                        <del class="product_price"><%=Util.convertPrice(rs.getDouble(2))%></del>
                                    </span>
                                    </div>
                                </h5>
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
        </div>
    </div>
</section>
<%-----------------------------------------------%>
<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>
</body>
</html>

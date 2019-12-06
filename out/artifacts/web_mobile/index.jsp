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
<section id="main_body">
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
</section>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

</body>
</html>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Danh sách sản phẩm | Saitama</title>
    <%@include file="headAllPage.jsp" %>
</head>
<body>
<%@include file="backToTop.jsp" %>
<%--=================   HEADER   ==============--%>
<%@include file="header.jsp" %>
<%-----------------------------------------------%>

<%--=================   BODY      =============--%>
<section id="main_body">
    <div class="container">

        <!--==========  PRODUCT LIsT    ==========-->
        <div class="product">
            <div class="smart_phone">
                <div class="pt-3">
                    <p class="tilte">Danh sách sản phẩm</p>
                </div>
                <div style="margin-bottom: 20px">
                    <span class="badge" style="font-size: 14px; background-color: #c5cccc">Chọn mức giá:</span>
                    <a class="m-3 text-decoration-none" href="<%= Util.fullPath("list_product?sort=<5000000")%>">
                        <span class="badge badge-danger" style="font-size: 14px">dưới 5 triệu</span>
                    </a>
                    <a class="m-3 text-decoration-none" href="<%= Util.fullPath("list_product?sort=<10000000")%>">
                        <span class="badge badge-danger" style="font-size: 14px">từ 5 - 10 triệu</span>
                    </a>
                    <a class="m-3 text-decoration-none" href="<%= Util.fullPath("list_product?sort=>10000000")%>">
                        <span class="badge badge-danger" style="font-size: 14px">trên 10 triệu</span>
                    </a>
                </div>
                <div class="row">
                    <%
                        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                        rs.last();
                        if (rs.getRow() == 0) {
                    %>
                    <div class="m-auto">Không có kết quả phù hợp</div>
                    <%
                        }
                        rs.beforeFirst();
                        while (rs.next()) {
                    %>
                    <div class="frame col-1-5 d-flex align-items-stretch">
                        <div class="product_item">
                            <div class="figure figure-img">
                                <a href="<%=Util.fullPath("detail_product?detail="+rs.getString(6))%>">
                                    <%
                                        String img = rs.getString(3);
                                        String[] arrImg = img.split("~");
                                    %>
                                    <img class="img-fluid" src="<%=arrImg[0]%>" alt="img">
                                    <label class="discountt1"
                                           style="visibility: <%=rs.getDouble(7)==0?"hidden":"visible"%>">
                                        <i class="fas fa-tags"> </i> GIẢM <%=Util.convertPrice(rs.getDouble(7))%>
                                    </label>
                                    <div class=" cotain_icon1">
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
                        }
                    %>
                </div>
            </div>

        </div>
        <ul class="pagination">
            <div class="d-inline m-auto">
                <%

                    if (request.getAttribute("total") != null) {
                        String[] ans = ((String) request.getAttribute("total")).split("_");
                        int total = ((Integer.parseInt(ans[1]) % 16 == 0) ? (Integer.parseInt(ans[1]) / 16) : (Integer.parseInt(ans[1]) / 16 + 1));
                        int page_number = 0;
                        if (request.getParameter("page") != null) {
                            page_number = Integer.parseInt(request.getParameter("page"));
                        } else {
                            page_number = 1;
                        }
                        if (ans[0].equals("false")) {
                %>
                <a href="<%=Util.fullPath("list_product?supplier="+request.getParameter("supplier")+"&page="+(page_number==1?total:(page_number-1)))%>"
                   class="btn btn-dark">&laquo;</a>
                <%
                    for (int i = 0; i < total; i++) {
                %>
                <a href="<%=Util.fullPath("list_product?supplier="+request.getParameter("supplier")+"&page="+(i+1))%>"
                   class="btn <%=page_number==(i + 1)?"btn-danger":"btn-dark"%>"><%=i + 1%>
                </a>
                <%
                    }
                %>
                <a href="<%=Util.fullPath("list_product?supplier="+request.getParameter("supplier")+"&page="+(page_number==total?1:(page_number+1)))%>"
                   class="btn btn-dark">&raquo;
                </a>
                <%
                } else if (ans[0].equals("true")) {
                %>
                <a href="<%=Util.fullPath("list_product?page="+(page_number==1?total:(page_number-1)))%>"
                   class="btn btn-dark">&laquo;
                </a>
                <%
                    for (int i = 0; i < total; i++) {
                %>
                <a href="<%=Util.fullPath("list_product?&page="+(i+1))%>"
                   class="btn <%=page_number==(i + 1)?"btn-danger":"btn-dark"%>"><%=i + 1%>
                </a>
                <%
                    }
                %>
                <a href="<%=Util.fullPath("list_product?page="+(page_number==total?1:(page_number+1)))%>"
                   class="btn btn-dark">&raquo;
                </a>
                <%
                } else if (ans[0].equals("sort")) {
                %>
                <a href="<%=Util.fullPath("list_product?sort="+request.getParameter("sort")+"&page="+(page_number==1?total:(page_number-1)))%>"
                   class="btn btn-dark">&laquo;</a>
                <%
                    for (int i = 0; i < total; i++) {
                %>
                <a href="<%=Util.fullPath("list_product?sort="+request.getParameter("sort")+"&page="+(i+1))%>"
                   class="btn <%=page_number==(i + 1)?"btn-danger":"btn-dark"%>"><%=i + 1%>
                </a>
                <%
                    }
                %>
                <a href="<%=Util.fullPath("list_product?sort="+request.getParameter("sort")+"&page="+(page_number==total?1:(page_number+1)))%>"
                   class="btn btn-dark">&raquo;
                </a>
                <%
                } else {
                %>
                <a href="<%=Util.fullPath("list_product?search="+ans[0]+"&page="+(page_number==1?total:(page_number-1)))%>"
                   class="btn btn-dark">&laquo;</a>
                <%
                    for (int i = 0; i < total; i++) {
                %>
                <a href="<%=Util.fullPath("list_product?search="+ans[0]+"&page="+(i+1))%>"
                   class="btn <%=page_number==(i + 1)?"btn-danger":"btn-dark"%>"><%=i + 1%>
                </a>
                <%
                    }
                %>
                <a href="<%=Util.fullPath("list_product?search="+ans[0]+"&page="+(page_number==total?1:(page_number+1)))%>"
                   class="btn btn-dark">&raquo;</a>
                <%
                        }
                    }
                %>
            </div>
        </ul>
    </div>
</section>
<%-----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

</body>
</html>

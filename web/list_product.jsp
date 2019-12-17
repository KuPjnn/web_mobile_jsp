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
                <div class="row">
                    <%
                        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                        rs.last();
                        if (rs.getRow() == 0) {
                    %>
                    <div class="display-4 m-auto" style="height: 55vh">Không có kết quả phù hợp</div>
                    <%
                        }
                        rs.beforeFirst();
                        while (rs.next()) {
                    %>
                    <div id="<%=rs.getString(6)%>" class="col-md-3 col-6">
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

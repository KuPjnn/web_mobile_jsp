<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.edu.nlu.fit.model.Cart" %>
<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Chi tiết đơn hàng | Saitama</title>
    <%@include file="headAllPage.jsp" %>
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
            <div class="col-md-8 col-11 m-auto pb-5">
                <div class="table-responsive border rounded">
                    <%
                        User user = (User) session.getAttribute("user");
                        ListCart listCart = (ListCart) session.getAttribute("list_cart");
                        ResultSet resultSet = (ResultSet) request.getAttribute("rs");
                        resultSet.beforeFirst();
                        while (resultSet.next()) {
                    %>
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
                            <td><%=resultSet.getInt(1)%>
                            </td>
                        </tr>
                        <tr>
                            <th>Tên khách hàng:</th>
                            <td><%=user.getFull_name()%>
                            </td>
                        </tr>
                        <tr>
                            <th>Số điện thoại:</th>
                            <td><%=resultSet.getString(4)%>
                            </td>
                        </tr>
                        <tr>
                            <th>Địa chỉ :</th>
                            <td><%=resultSet.getString(5)%>
                            </td>
                        </tr>
                        <tr>
                            <th>Ngày đặt:</th>
                            <td><%=resultSet.getDate(3)%>
                            </td>
                        </tr>
                        <tr>
                            <th>Sản phẩm:</th>

                            <td><%
                                for (Cart carts : listCart.list_cart) {
                            %>
                                <p><%=carts.getPro().getProduct_name() + " | " + Util.convertPrice(carts.getPro().getPrice()) + " | +" + carts.getTotal() %>
                                </p>
                                <%
                                    }
                                %>
                            </td>
                        </tr>

                        </tr>
                        <tr>
                            <th>Phương thức thanh toán:</th>
                            <%
                                if (resultSet.getString(7).equalsIgnoreCase("Chưa thanh toán")) {
                            %>
                            <td>Trả sau</td>
                            <%
                            } else {
                            %>
                            <td>Trả trước</td>
                            <%
                                }
                            %>
                        </tr>

                        <tr>
                            <th>Trạng thái thanh toán</th>
                            <td><%=resultSet.getString(7)%>
                            </td>
                        </tr>

                        </tbody>
                        <tfoot>
                        <tr>
                            <td>Tổng tiền:</td>
                            <td style="color: #ff6700"><%=Util.convertPrice(listCart.totalPrice())%>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</section>
<%----------------------------------------------%>

<%--=================   FOOTER    =============--%>
<%@include file="footer.jsp" %>
<%-----------------------------------------------%>

</body>
</html>
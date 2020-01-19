<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--BILL--%>
<%@ page import="vn.edu.nlu.fit.model.Bill" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Bill</title>
    <%@include file="../headAllPage.jsp" %>
    <link rel="stylesheet" href="<%=Util.fullPath("css/admin.css")%>">
</head>
<body>
<%@include file="include/admin_header.jsp" %>
<div id="admin_body">
    <div class="container-fluid">
        <div class="row">
            <%--=======     INCLUB NAV      =========--%>
            <%@include file="include/admin_nav.jsp" %>
            <%-------------------------------------%>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <div id="admin_donhang" class="card mt-1 tab-pane active">
                    <div class="card-header">Đơn hàng</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Mã khách hàng</th>
                                <th>Ngày lập</th>
                                <th>SĐT</th>
                                <th>Địa chỉ</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th>Xác nhận</th>
                                <th>Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Bill> list_bill = (List<Bill>) request.getAttribute("list");
                                if (list_bill != null) {
                                    for (Bill bill : list_bill) {
                            %>
                            <tr>
                                <th><%=bill.getId()%>
                                </th>
                                <th><%=bill.getUserName()%>
                                </th>
                                <th><%=bill.getDate()%>
                                </th>
                                <th><%=bill.getPhone()%>
                                </th>
                                <th><%=bill.getAddress()%>
                                </th>
                                <th><%=Util.convertPrice(bill.getTotal())%>
                                </th>
                                <th><%=bill.getStatus()%>
                                </th>
                                <th>
                                    <%
                                        if (bill.getStatus().equals("Chưa thanh toán")) {
                                    %>
                                    <a href="<%=Util.fullPath("admin/bill?action=active&id="+bill.getId())%>"
                                       class="border-0 rounded-circle ml-3">
                                        <i style="color: #000" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a onclick="" class="border-0 rounded-circle ml-3">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>

                                </th>
                                <th>
                                    <a class="details_btn" data-toggle="modal"
                                       data-target="#modal_see_bill">
                                        <i class="far fa-eye text-dark"></i>
                                        <input type="hidden" class="id_bill" value="<%=bill.getId()%>">
                                        <input type="hidden" class="user_name" value="<%=bill.getUserName()%>">
                                        <input type="hidden" class="address" value="<%=bill.getAddress()%>">
                                        <input type="hidden" class="phone" value="<%=bill.getPhone()%>">
                                        <input type="hidden" class="date_order" value="<%=bill.getDate()%>">
                                        <input type="hidden" class="status" value="<%=bill.getStatus()%>">
                                        <input type="hidden" class="total_price"
                                               value="<%=Util.convertPrice(bill.getTotal())%>">
                                    </a>
                                </th>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%--=================   FOOTER    =============--%>
<%@include file="include/modal_see_bill.jsp" %>
</html>

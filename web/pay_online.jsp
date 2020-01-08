<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Thanh toán | Saitama</title>
    <%@include file="headAllPage.jsp" %>
    <style>
        body {
            margin: auto;
        }

        .title_big {
            font-size: 18px;
            color: #fff;
        }

        .card-body li, b {
            font-size: 16px;
            text-align: center;
        }

        .card-header {
            background-color: #ff6700;
        }
    </style>
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
                <form method="get" action="<%=Util.fullPath("pay_online")%>">
                    <div class="card m-auto">
                        <div class="card-header">
                            <p class="title_big text-center">THÔNG TIN GIAO DỊCH</p>
                        </div>
                        <%
                            String info = (String) request.getAttribute("info");
                        %>
                        <input type="hidden" name="info" value="<%=info%>">

                        <div class="card-body">
                            <%
                                ListCart listCart = (ListCart) session.getAttribute("list_cart");
                            %>
                            <li><b>Số tiền :</b><%=Util.convertPrice(listCart.totalPrice())%>
                            </li>
                            <hr>
                            <li><b>Nội dung thanh toán : </b> mua hàng</li>
                            <hr>
                            <h5 class="font-weight-bold text-center mt-4">Tài khoản</h5>
                            <div class="form-label-group w-75 mx-auto my-4">
                                <input name="name_atm" type="text" id="name" class="form-control"
                                       placeholder="Tên chủ tài khoản" required
                                       oninvalid="this.setCustomValidity('Bạn chưa nhập tên tài khoản.')"
                                       oninput="setCustomValidity('')">
                            </div>
                            <div class="form-label-group w-75 mx-auto mb-4">
                                <input name="number_atm" type="number" id="inputSTK" class="form-control"
                                       placeholder="Số tài khoản" required
                                       oninvalid="this.setCustomValidity('Bạn chưa nhập số tài khoản.')"
                                       oninput="setCustomValidity('')">
                            </div>
                            <hr>
                            <div align="center">
                                <button class="btn btn_pay px-5" type="submit">OK</button>
                                <a class="btn btn-secondary px-5"
                                   href="<%=Util.fullPath("show_cart")%>">
                                    HỦY
                                </a>
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

</body>
<script>
    <%
    if(request.getAttribute("atm_error")!=null){
    %>
    swal.fire({
        title: '<%=request.getAttribute("atm_error")%>',
        confirmButtonColor: '#ff6700'
    });
    <%
    }
    %>
</script>
</html>
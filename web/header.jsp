<%@ page import="vn.edu.nlu.fit.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.ListCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="main_header">
    <div id="header_style">
        <div class="container">
            <div class="row">
                <!--=========   HEADER  =============-->
                <div class="col-md-12">
                    <nav class="main_header navbar">
                        <%--    BRAND   --%>
                        <div class="col-md-2 col-3">
                            <a class="logo navbar-brand" href="<%=Util.fullPath("home")%>">
                                <img class="img-fluid" width="50" src="img/logo/logo.svg" alt="logo">
                            </a>
                        </div>
                        <%--    SEARCH  --%>
                        <div class="col-md-6 col-9">
                            <form action="<%=Util.fullPath("list_product")%>" method="get">
                                <div class="search input-group mb-3">
                                    <input name="search" type="text" class="form-control"
                                           placeholder="Nhập tên sản phẩm cần tìm..." required=""
                                           oninvalid="this.setCustomValidity('Bạn chưa nhập tên sản phẩm')"
                                           oninput="setCustomValidity('')">
                                    <div class="input-group-append">
                                        <button class="btn btn-dark" type="submit"><i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%--    LOGIN   --%>
                        <div class="col-md-4 col-12 login">
                            <%--    CART    --%>
                            <div class="d-inline">
                                <a id="shopping_cart" class="fas fa-shopping-cart float-right mt-3 ml-5"
                                   href="<%=Util.fullPath("show_cart")%>">
                                    <span style="font-size: 0.85rem; position: absolute; right: 0; top: 5px"
                                          class="badge badge-dark">
                                        <% ListCart cart = (ListCart) session.getAttribute("list_cart");%>
                                    <%=cart != null ? cart.list_cart.size() : 0%>
                                    </span>
                                </a>
                            </div>
                            <%--    LOGIN_LOGOUT    --%>
                            <%
                                User ss = (User) session.getAttribute("user");
                                if (ss != null) {
                            %>
                            <ul class="login mt-3 float-right">
                                <a class="mx-2 text-decoration-none" href="<%=Util.fullPath("info")%>">
                                    <i class="fa fa-user" style="font-size: 25px; color: #fff"></i>
                                    <%=ss.getFull_name()%> <%--Tên người dùng--%>
                                </a>
                                <a onclick="return logout()" href="#" class="text-decoration-none">Đăng xuất</a>
                            </ul>
                            <%
                            } else {
                            %>
                            <a class="float-right mt-3"
                               href="" data-toggle="modal"
                               data-target="#regisModal">Đăng kí</a>
                            <a id="login" class="float-right mt-3"
                               href="" data-toggle="modal"
                               data-target="#loginModal">Đăng nhập</a>
                            <%
                                }
                            %>
                        </div>
                    </nav>
                </div>
                <!--==========   MENU    ============-->
                <jsp:include page="menu"/>
            </div>
        </div>
    </div>
</header>

<!--============== MODAL LOGIN ==============-->
<%@include file="login.jsp" %>

<!--============== MODAL REGIS ==============-->
<%@include file="register.jsp" %>
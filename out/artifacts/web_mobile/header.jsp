<%@ page import="vn.edu.nlu.fit.dao.MenuDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.User" %>
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
                                           placeholder="Nhập tên sản phẩm cần tìm...">
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
                                <span></span>
                                <a id="shopping_cart" class="fas fa-shopping-cart float-right mt-3 ml-5"
                                   href="<%=Util.fullPath("show_cart")%>"></a>
                            </div>
                            <%--    LOGIN_LOGOUT    --%>
                            <%
                                User ss = (User) session.getAttribute("user");
                                if (ss != null) {
                            %>
                            <ul class="login mt-3 float-right">
                                <a class="mx-2 text-decoration-none" href="info_user.jsp">
                                    <i class="fa fa-user" style="font-size: 25px; color: #fff"></i>
                                    <%=ss.getFull_name()%>
                                </a>
                                <a class="text-decoration-none" href="logout">Đăng xuất</a>
                            </ul>
                            <%
                            } else {
                            %>
                            <a class="float-right mt-3"
                               href="" data-toggle="modal"
                               data-target="#regisModal">Đăng kí</a>
                            <a class="float-right mt-3"
                               href="" data-toggle="modal"
                               data-target="#loginModal">Đăng nhập</a>
                            <%
                                }
                            %>
                        </div>
                    </nav>
                </div>
                <!--==========   MENU    ============-->
                <div class="col-md-12">
                    <nav class="main_menu navbar" role="navigation">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                <i class="fas fa-mobile-alt"></i>
                                <span class="nav-link-inner-text">Điện thoại</span>
                            </a>
                            <div class="dropdown-menu w-100">
                                <%
                                    MenuDAO menu = new MenuDAO();
                                    List<MenuDAO> list = menu.getSupplier();
                                    for (MenuDAO m : list) {
                                        if (m.getId_items().equalsIgnoreCase("DT")) {
                                %>
                                <a class="dropdown-item"
                                   href="<%=Util.fullPath("list_product?supplier=" + m.getId_items() +"_" + m.getSupplier_name())%>">
                                    <%=m.getSupplier_name()%>
                                </a>
                                <%
                                        }
                                    }
                                %>

                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                <i class="fas fa-tablet-alt"></i>
                                <span class="nav-link-inner-text">Máy tính bảng</span>
                            </a>
                            <div class="dropdown-menu w-100">
                                <%
                                    for (MenuDAO m : list) {
                                        if (m.getId_items().equalsIgnoreCase("MTB")) {
                                %>
                                <a class="dropdown-item"
                                   href="<%=Util.fullPath("list_product?supplier=" + m.getId_items() +"_" + m.getSupplier_name())%>">
                                    <%=m.getSupplier_name()%>
                                </a>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </li>
                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                <i class="fas fa-laptop-code"></i>
                                <span class="nav-link-inner-text">Laptop</span>
                            </a>
                            <div class="dropdown-menu w-100">
                                <%
                                    for (MenuDAO m : list) {
                                        if (m.getId_items().equalsIgnoreCase("LT")) {
                                %>
                                <a class="dropdown-item"
                                   href="<%=Util.fullPath("list_product?supplier=" + m.getId_items() +"_" + m.getSupplier_name())%>">
                                    <%=m.getSupplier_name()%>
                                </a>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </li>
                        <%--TOP 10--%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                <i class="fas fa-thumbs-up"></i>
                                <span class="nav-link-inner-text">Top 10</span>
                            </a>
                            <div class="dropdown-menu w-100">
                                <a class="dropdown-item" href="#">Điện thoại</a>
                                <a class="dropdown-item" href="#">Máy tính bảng</a>
                                <a class="dropdown-item" href="#">Laptop</a>
                            </div>
                        </li>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>

<!--============== MODAL LOGIN ==============-->
<%@include file="login.jsp" %>

<!--============== MODAL REGIS ==============-->
<%@include file="register.jsp" %>

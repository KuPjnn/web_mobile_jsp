<%@ page import="vn.edu.nlu.fit.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="main_header">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="<%=Util.fullPath("home")%>">
                <i style="font-size: 45px; color: #fff" class="fab fa-speaker-deck"></i>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContentLG" aria-controls="navbarSupportedContentLG"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContentLG">
                <ul class="navbar-nav mr-auto">
                    <!--==========   MENU    ============-->
                    <jsp:include page="menu"/>
                </ul>
                <form action="<%=Util.fullPath("list_product")%>" method="get" class="mr-5" autocomplete="off">
                    <div class="input-group">
                        <input name="search" type="text" class="form-control pt-2"
                               style="border-start-start-radius: 20px"
                               placeholder="Nhập tên sản phẩm..." required=""
                               oninvalid="this.setCustomValidity('Bạn chưa nhập tên sản phẩm')"
                               oninput="setCustomValidity('')">
                        <div class="input-group-append">
                            <button class="btn btn-light" type="submit">
                                <i style="color: #ff6700" class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <%--    LOGIN_LOGOUT    --%>
                <%
                    User ss = (User) session.getAttribute("user");
                    if (ss != null) {
                %>
                <a class="mr-3 text-decoration-none" href="<%=Util.fullPath("info")%>">
                    <%=ss.getFull_name().toUpperCase()%>
                </a>
                <a onclick="return logout()" href="#" class="text-decoration-none mr-3">ĐĂNG XUẤT</a>
                <%
                } else {
                %>
                <a id="login" class="mr-3 text-decoration-none" href="" data-toggle="modal"
                   data-target="#loginModal">ĐĂNG NHẬP</a>
                <a class="mr-3 text-decoration-none" href="" data-toggle="modal"
                   data-target="#regisModal">ĐĂNG KÍ</a>
                <%
                    }
                %>
                <%--    CART    --%>
                <a class="fas fa-shopping-cart mr-3 text-decoration-none" href="<%=Util.fullPath("show_cart")%>"
                   style="font-size: 20px; line-height: 45px"
                >
                </a>
            </div>
        </nav>
    </div>
</header>

<!--============== MODAL LOGIN ==============-->
<%@include file="login.jsp" %>

<!--============== MODAL REGIS ==============-->
<%@include file="register.jsp" %>
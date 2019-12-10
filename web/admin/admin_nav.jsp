<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="col-md-2 d-md-block bg-light mt-1">
    <div class="nav nav-pills flex-column ">
        <a class="nav-item" href="admin.jsp">
            <i class="far fa-smile-beam"></i>
            Welcome
        </a>
        <a class="nav-item" href="<%=Util.fullPath("view_admin/user")%>">
            <i class="fa fa-user"></i>
            Người dùng
        </a>
        <a class="nav-item" href="admin_bill.jsp">
            <i class="fa fa-cart-arrow-down"></i>
            Đơn hàng
        </a>
        <a class="nav-item" href="admin_items.jsp">
            <i class="fas fa-dumpster"></i>
            Hàng hóa
        </a>
        <a class="nav-item" href="<%=Util.fullPath("view_admin/product")%>">
            <i class="fab fa-product-hunt"> </i>
            Sản phẩm
        </a>
        <a class="nav-item" href="admin_comment.jsp">
            <i class="fa fa-comment"> </i>
            Bình luận
        </a>
        <a class="nav-item" href="<%=Util.fullPath("view_admin/slide")%>">
            <i class="fab fa-slideshare"></i>
            Slideshow
        </a>
    </div>
</nav>
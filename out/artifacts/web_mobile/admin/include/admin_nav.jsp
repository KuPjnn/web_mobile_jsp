<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="col-md-2 d-md-block bg-light mt-1">
    <div class="nav nav-pills flex-column ">
        <% String active = request.getRequestURL().toString();%>
        <a class="nav-item <%if(active.matches(".*user.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/user")%>">
            <i class="fa fa-user"></i>
            Người dùng
        </a>
        <a class="nav-item <%if(active.matches(".*bill.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/bill")%>">
            <i class="fa fa-cart-arrow-down"></i>
            Đơn hàng
        </a>
        <a class="nav-item <%if(active.matches(".*items.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/items")%>">
            <i class="fas fa-dumpster"></i>
            Hàng hóa
        </a>
        <a class="nav-item <%if(active.matches(".*supplier.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/supplier")%>">
            <i class="fas fa-copyright"></i>
            Thương hiệu
        </a>
        <a class="nav-item <%if(active.matches(".*product.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/product")%>">
            <i class="fab fa-product-hunt"> </i>
            Sản phẩm
        </a>
        <a class="nav-item <%if(active.matches(".*comment.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/comment")%>">
            <i class="fa fa-comment"> </i>
            Bình luận
        </a>
        <a class="nav-item %>active <%if(active.matches(".*slide.*")){%>active<%}%>"
           href="<%=Util.fullPath("admin/slide")%>">
            <i class="fab fa-slideshare"></i>
            Slideshow
        </a>
    </div>
</nav>
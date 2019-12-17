<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="admin_header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <nav class="admin_header navbar">
                    <div class="col-md-2 col-3">
                        <a class="logo navbar-brand m-auto" href="<%=Util.fullPath("admin/")%>">
                            <img class="img-fluid" width="50" src="<%=Util.fullPath("/img/logo/logo.svg")%>" alt="logo">
                        </a>
                    </div>
                    <div class="col-md-3 col12">
                        <ul class="login mt-3 float-right">
                            <a class="mx-5 text-decoration-none" href="<%=Util.fullPath("info")%>"><i
                                    class="fa fa-user"></i> admin</a>
                            <a class="text-decoration-none" href="<%=Util.fullPath("home")%>">Đăng xuất</a>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

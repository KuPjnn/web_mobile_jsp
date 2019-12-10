<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="admin_header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <nav class="admin_header navbar">
                    <div class="col-md-2 col-3">
                        <a class="logo navbar-brand m-auto" href="#">
                            <img class="img-fluid" width="50" src="<%=Util.fullPath("/img/logo/logo.svg")%>" alt="logo">
                        </a>
                    </div>
                    <div class="col-md-7 col-9">
                        <div class=" navbar-nav m-auto">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Tìm kiếm......">
                                <div class="input-group-append">
                                    <button class="btn btn-dark" type="submit"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col12">
                        <ul class="login mt-3 float-right">
                            <a class="mx-3 text-decoration-none" href="../info_user.jsp"><i
                                    class="fa fa-user"></i>Admin</a>
                            <a class="text-decoration-none" href="../index.jsp">Đăng xuất</a>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

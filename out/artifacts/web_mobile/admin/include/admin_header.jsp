<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="vn.edu.nlu.fit.model.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="admin_header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <nav class="admin_header navbar">
                    <div class="col-md-2 col-3">
                        <a class="logo navbar-brand m-auto" href="<%=Util.fullPath("admin/")%>">
                            <i style="font-size: 45px; color: #fff" class="fab fa-speaker-deck"></i>
                        </a>
                    </div>
                    <div class="col-md-3 col12">
                        <ul class="login mt-3 float-right">
                            <%
                                UserModel u = (UserModel) session.getAttribute("user");
                            %>
                            <a class="mx-5 text-decoration-none" href="<%=Util.fullPath("info")%>"><i
                                    class="fa fa-user"></i><%=u.getFull_name().toUpperCase()%>
                            </a>
                            <a class="text-decoration-none" href="<%=Util.fullPath("logout")%>">ĐĂNG XUẤT</a>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

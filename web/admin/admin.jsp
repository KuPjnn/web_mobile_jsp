<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Page</title>
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
                <%
                    String welcome = (String) request.getAttribute("welcome");
                    if (welcome != null) {
                %>
                <div align="center" class="pt-5 display-1">
                    <div class="row w-100">
                        <div class="col-md-3">
                            <div class="card border-success mx-sm-1 p-3">
                                <div class="card border-success shadow text-success p-3 my-card">
                                    <span class="fa fa-eye" aria-hidden="true"></span>
                                </div>
                                <div class="text-success text-center mt-3"><h4>Lượt truy cập/ngày</h4></div>
                                <div class="text-success text-center mt-2"><h1>9332</h1></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
<style>
    .my-card {
        position: absolute;
        left: 40%;
        top: -20px;
        border-radius: 50%;
    }
</style>
</html>

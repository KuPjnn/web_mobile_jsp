<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Admin Comment</title>
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
                <div id="admin_binhluan" class="card mt-1 tab-pane active">
                    <div class="card-header">Bình luận</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên người dùng</th>
                                <th>Tên sản phẩm</th>
                                <th>Nội dung</th>
                                <th>Ngày bình luận</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Comment> list = (List<Comment>) request.getAttribute("commentList");
                                for (Comment com : list) {
                            %>
                            <tr class="">
                                <th><%=com.getId_comment()%>
                                </th>
                                <th><%=com.getUsername()%>
                                </th>
                                <th><%=com.getId_product()%>
                                </th>
                                <th class="w-50 h-25"><%=com.getContent()%>
                                </th>
                                <th><%=com.getDate_comment()%>
                                </th>
                                <th class="d-flex justify-content-end">
                                    <%
                                        if (com.getActive() == 1) {
                                    %>
                                    <a href="<%=Util.fullPath("admin/comment?action=hide&id_comment="+com.getId_comment())%>"
                                       class="mx-3">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a href="<%=Util.fullPath("admin/comment?action=active&id_comment="+com.getId_comment())%>"
                                       class="mx-3">
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                    <a onclick="return confirm('Xóa bình luận của <%=com.getUsername()%>')"
                                       href="<%=Util.fullPath("admin/comment?action=del&id_comment="+com.getId_comment())%>"
                                       class="mx-3">
                                        <i style="color: #000" class="fa fa-trash"></i>
                                    </a>
                                </th>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


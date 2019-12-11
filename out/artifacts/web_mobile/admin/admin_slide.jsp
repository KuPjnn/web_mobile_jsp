<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Slide" %>
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
<%@include file="admin_header.jsp" %>
<div id="admin_body">
    <div class="container-fluid">
        <div class="row">
            <%--=======     INCLUB NAV      =========--%>
            <%@include file="admin_nav.jsp" %>
            <%-------------------------------------%>
            <div class="col-md-9 ml-sm-auto col-lg-10 tab-content">
                <div id="admin_slideshow" class="card mt-1 tab-pane active">
                    <div class="card-header">Slideshow
                        <button onclick="" class="btn btn-danger ml-xl-5" data-toggle="modal"
                                data-target="#addSlide">Thêm Sildeshow
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ảnh</th>
                                <th>Hiển thị</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Slide> list = (List<Slide>) request.getAttribute("list_slide");
                                if (list != null)
                                    for (Slide s : list) {
                            %>
                            <tr>
                                <th><%=s.getId()%>
                                </th>
                                <th>
                                    <img class="img-fluid img-thumbnail" src="<%=s.getImg()%>" width="300px">
                                </th>
                                <th>
                                    <%
                                        if (s.getActive() == 1) {

                                    %>
                                    <a href="slide?action=hide&id_slide=<%=s.getId()%>"
                                       class="__icon mt-5">
                                        <i style="color: #ff6700" class="far fa-check-circle"></i>
                                    </a>
                                    <%
                                    } else {
                                    %>
                                    <a href="slide?action=active&id_slide=<%=s.getId()%>">
                                        <i style="color: #000" class="fas fa-minus-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                </th>
                                <th>
                                    <a href="slide?action=del&id_slide=<%=s.getId()%>" class="__icon mt-5">
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

<%--MODAL ADD NEW SILDE SHOW--%>
<div class="modal fade" id="addSlide" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Thêm slide mới</h4>
                </div>
                <div class="card-body">
                    <form action="<%=Util.fullPath("admin/upload_file")%>" method="post" enctype="multipart/form-data">
                        <input class="form-control-file" type="file" name="file" size="50"/>
                        <br>
                        <input class="btn btn-dark" type="submit" value="Thêm"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Slide" %>
<%@ page import="vn.edu.nlu.fit.dao.SlideDAOImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--SLIDE SHOW--%>
<div id="admin_slideshow" class="card mt-1 tab-pane fade">
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
                <th>Xóa</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Slide> list = new SlideDAOImpl().getSlide();
                for (Slide s : list) {
            %>
            <tr>
                <th><%=s.getId()%>
                </th>
                <th><img class="img-fluid img-thumbnail" src="<%=s.getImg()%>"
                         width="300px"></th>
                <th>
                    <button onclick="" class="btn btn-dark rounded">Xóa</button>
                </th>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<%--MODAL ADD NEW SILDE SHOW--%>
<div class="modal fade" id="addSlide" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Thêm slide mới</h4>
                </div>
                <div class="card-body">
                    <form action="UploadFile" method="post" enctype="multipart/form-data">
                        <input class="form-control-file" type="file" name="file" size="50"/>
                        <br>
                        <input class="btn btn-dark" type="submit" value="Thêm"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
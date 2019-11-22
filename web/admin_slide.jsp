<%@ page import="vn.edu.nlu.fit.dao.SlideDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Slide" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--SLIDE SHOW--%>
<div id="admin_slideshow" class="card mt-1 tab-pane fade">
    <div class="card-header">Slideshow
        <button onclick="" class="btn btn-danger ml-xl-5">Thêm Sildeshow</button>
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
                SlideDAOImpl slide = new SlideDAOImpl();
                List<Slide> list = slide.getSlide();
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
<%@ page import="vn.edu.nlu.fit.model.Slide" %>
<%@ page import="vn.edu.nlu.fit.dao.SlideDAOImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
    .carousel-thumbnails .carousel-indicators img {
        max-width: 100px;
        height: 50px;
        overflow: hidden;
        display: block;
    }

    .carousel-thumbnails .carousel-indicators li {
        height: auto;
        max-width: 100px;
        width: 100px;
        border: none;
        box-shadow: 1px 3px 5px 0px rgba(0, 0, 0, 1);
    }

    .carousel-thumbnails .carousel-indicators li.active {
        border-bottom: 4px solid #ff6700;
    }
</style>

<div id="slide_show" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel" data-interval="2000">

    <div class="carousel-inner" role="listbox">
        <%
            int index = 0;
            List<Slide> listSlide = new SlideDAOImpl().getSlide();
            for (Slide sl : listSlide) {
                if (sl.getActive() == 1) {
                    if (index == 0) {
        %>
        <div class="carousel-item active">
            <img class="img-fluid d-block" src="<%=sl.getImg()%>" alt="slide">
        </div>
        <%
        } else {
        %>
        <div class="carousel-item">
            <img class="img-fluid d-block" src="<%=sl.getImg()%>" alt="slide">
        </div>
        <%
                    }
                    index++;
                }
            }
        %>
    </div>

    <%--=============== CONTROL ===============--%>
    <a class="carousel-control-prev" href="#slide_show" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#slide_show" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>

</div>

<script type="text/javascript">
    document.documentElement.setAttribute("lang", "en");
    document.documentElement.removeAttribute("class");

    axe.run(function (err, results) {
        console.log(results.violations);
    });
</script>

<%@ page import="vn.edu.nlu.fit.dao.SlideDAOImpl" %>
<%@ page import="vn.edu.nlu.fit.model.Slide" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="slide_show" class="carousel slide carousel-fade" data-ride="carousel" data-interval="2000">
    <ol class="carousel-indicators">
        <li data-target="#slide_show" data-slide-to="0" class="active"></li>
        <li data-target="#slide_show" data-slide-to="1"></li>
        <li data-target="#slide_show" data-slide-to="2"></li>
    </ol>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="img-fluid d-block w-100" src="img/slide/banner-web-lap-1.jpg" alt="slide">
        </div>
        <div class="carousel-item ">
            <img class="img-fluid d-block w-100" src="img/slide/xiaomi-air-2-1.jpg" alt="slide">
        </div>
        <div class="carousel-item ">
            <img class="img-fluid d-block w-100" src="img/slide/tuyendung.jpg" alt="slide">
        </div>
    </div>

    <a class="carousel-control-prev" href="#slide_show" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#slide_show" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Item" %>
<%@ page import="vn.edu.nlu.fit.model.Menu" %>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--========== MENU ============-->
<ul class="menu">
    <%
        List<Menu> listSupplier = (List<Menu>) request.getAttribute("listSupplier");
        List<Item> listItems = (List<Item>) request.getAttribute("listItems");
        int i = 0;
        if (listItems != null) {
            for (Item item : listItems) {
                if (item.getActive() == 1) {
    %>
    <li class="nav-item">
        <a class="nav-link pr-4"><%=item.getName()%>
        </a>
        <ul class="submenu w-100">
            <%
                if (listSupplier != null && item.getId().equals(listItems.get(i).getId())) {
                    for (Menu supplier : listSupplier) {
                        if (supplier.getId_items().equals(item.getId())) {
            %>
            <li>
                <a href="<%=Util.fullPath("list_product?supplier=" + supplier.getId_items() + "_" + supplier.getSupplier_name())%>"
                ><%=supplier.getSupplier_name()%>
                </a>
            </li>
            <%
                        }
                    }
                    i++;
                }
            %>
        </ul>
    </li>
    <%
                }

            }
        }
    %>

</ul>

<style>

    .menu, .menu ul {
        list-style: none;
    }

    .menu li {
        background: #ff6600;
    }

    .menu > li {
        display: block;
        float: left;
        position: relative;
    }

    .menu > li:first-child {
        border-radius: 5px 0 0;
    }

    .menu a {
        border-left: 3px solid rgba(0, 0, 0, 0);
        color: #fff;
        display: block;
        font-size: 14px;
        line-height: 45px;
        padding: 0 10px;
        text-decoration: none;
        text-transform: uppercase;
    }

    .menu li:hover > a {
        border-radius: 5px 0 0 0;
        border-left: 3px solid #f5fff5;
        color: #000;
    }

    /* submenu styles */
    .submenu {
        left: 0;
        max-height: 0;
        position: absolute;
        top: 100%;
        z-index: 0;
        -webkit-perspective: 400px;
        -moz-perspective: 400px;
        -ms-perspective: 400px;
        -o-perspective: 400px;
        perspective: 400px;
    }

    .submenu li {
        opacity: 0;
        -webkit-transform: rotateY(90deg);
        -moz-transform: rotateY(90deg);
        -ms-transform: rotateY(90deg);
        -o-transform: rotateY(90deg);
        transform: rotateY(90deg);
        -webkit-transition: opacity .4s, -webkit-transform .5s;
        -moz-transition: opacity .4s, -moz-transform .5s;
        -ms-transition: opacity .4s, -ms-transform .5s;
        -o-transition: opacity .4s, -o-transform .5s;
        transition: opacity .4s, transform .5s;
    }

    .menu .submenu li:hover a {
        border-left: 3px solid #f5fff5;
        border-radius: 0;
        color: #000;
        background-color: #c5cccc;
    }

    .menu > li:hover .submenu, .menu > li:focus .submenu {
        max-height: 2000px;
        z-index: 10000;
    }

    .menu > li:hover .submenu li, .menu > li:focus .submenu li {
        opacity: 1;
        -webkit-transform: none;
        -moz-transform: none;
        -ms-transform: none;
        -o-transform: none;
        transform: none;
    }

</style>
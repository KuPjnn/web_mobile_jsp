<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page import="vn.edu.nlu.fit.model.Item" %>
<%@ page import="vn.edu.nlu.fit.dao.MenuDAO" %>
<%@ page import="vn.edu.nlu.fit.model.Menu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--========== MENU ============-->
<div class="col-md-12">
    <nav class="main_menu navbar" role="navigation">
        <%
            List<Menu> listSupplier = (List<Menu>) request.getAttribute("listSupplier");
            List<Item> listItems = (List<Item>) request.getAttribute("listItems");
            if (listItems != null) {
                for (Item item : listItems) {
                    if (item.getActive() == 1) {
        %>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                <%
                    if (item.getId().equals("DT")) {
                %>
                <i class="fas fa-mobile-alt"></i>
                <%
                    }
                %>
                <%
                    if (item.getId().equals("LT")) {
                %>
                <i class="fas fa-laptop-code"></i>
                <%
                    }
                %>
                <%
                    if (item.getId().equals("MTB")) {
                %>
                <i class="fas fa-tablet-alt"></i>

                <%
                    }
                %>
                <span class="nav-link-inner-text"><%=item.getName()%></span>
            </a>
            <div class="dropdown-menu w-100">
                <%
                    if (listSupplier != null && item.getId().equals("DT")) {
                        for (Menu supplier : listSupplier) {
                            if (supplier.getId_items().equalsIgnoreCase("DT")) {
                %>
                <a class="dropdown-item"
                   href="<%=Util.fullPath("list_product?supplier=" + supplier.getId_items() + "_" + supplier.getSupplier_name())%>">
                    <%=supplier.getSupplier_name()%>
                </a>
                <%
                            }
                        }
                    }
                %>
                <%
                    if (listSupplier != null && item.getId().equals("MTB")) {
                        for (Menu supplier : listSupplier) {
                            if (supplier.getId_items().equalsIgnoreCase("MTB")) {
                %>
                <a class="dropdown-item"
                   href="<%=Util.fullPath("list_product?supplier=" + supplier.getId_items() + "_" + supplier.getSupplier_name())%>">
                    <%=supplier.getSupplier_name()%>
                </a>
                <%
                            }
                        }
                    }
                %>
                <%
                    if (listSupplier != null && item.getId().equals("LT")) {
                        for (Menu supplier : listSupplier) {
                            if (supplier.getId_items().equalsIgnoreCase("LT")) {
                %>
                <a class="dropdown-item"
                   href="<%=Util.fullPath("list_product?supplier=" + supplier.getId_items() + "_" + supplier.getSupplier_name())%>">
                    <%=supplier.getSupplier_name()%>
                </a>
                <%
                            }
                        }
                    }
                %>
            </div>
        </li>
        <%
                    }
                }
            }
        %>
        <%--==========      TOP 10      ============--%>
        <%
            if (listItems != null && listItems.size() != 0 && listSupplier.size() != 0) {
        %>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                <i class="fas fa-thumbs-up"></i>
                <span class="nav-link-inner-text">Top 10</span>
            </a>
            <div class="dropdown-menu w-100">
                <%
                    for (Item item : listItems) {
                        if (item.getActive() == 1) {
                %>
                <a class="dropdown-item" href="#"><%=item.getName()%>
                </a>
                <%
                        }
                    }
                %>
            </div>
        </li>
        <%
            }
        %>
    </nav>
</div>

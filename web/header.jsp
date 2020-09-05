<%@ page import="vn.edu.nlu.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.nlu.fit.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="main_header">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="<c:url value="/home"/>">
                <i style="font-size: 45px; color: #fff" class="fab fa-speaker-deck"></i>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContentLG" aria-controls="navbarSupportedContentLG"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContentLG">
                <ul class="navbar-nav mr-auto">
                    <!--==========   MENU    ============-->
                    <jsp:include page="/menu"/>
                </ul>
                <form action="<c:url value="/list_product"/>" method="get" class="mr-5" autocomplete="off">
                    <div class="input-group">
                        <input id="search" name="search" type="text" class="form-control pt-2"
                               style="border-start-start-radius: 20px"
                               placeholder="Nhập tên sản phẩm..." required=""
                               oninvalid="this.setCustomValidity('Bạn chưa nhập tên sản phẩm')"
                               oninput="setCustomValidity('')">
                        <div class="input-group-append">
                            <button class="btn btn-light" type="submit">
                                <i style="color: #ff6700" class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <%--    LOGIN_LOGOUT    --%>
                <c:if test="${not empty sessionScope.user}">
                    <a class="mr-3 text-decoration-none" href="<c:url value="/info"/>">
                            ${sessionScope.user.full_name}
                    </a>
                    <a onclick="return logout()" href="#" class="text-decoration-none mr-3">ĐĂNG XUẤT</a>
                </c:if>

                <c:if test="${empty sessionScope.user}">
                    <a id="login" class="mr-3 text-decoration-none" href="" data-toggle="modal"
                       data-target="#loginModal">ĐĂNG NHẬP</a>
                    <a class="mr-3 text-decoration-none" href="" data-toggle="modal"
                       onclick="return generateKeyRSA()" data-target="#regisModal">ĐĂNG KÍ</a>
                </c:if>

                <%--    CART    --%>
                <a class="fas fa-shopping-cart mr-3 text-decoration-none" href="<c:url value="/show_cart"/>"
                   style="font-size: 20px; line-height: 45px">
                </a>
            </div>
        </nav>
    </div>
</header>

<!--============== MODAL LOGIN ==============-->
<%@include file="login.jsp" %>

<!--============== MODAL REGIS ==============-->
<%@include file="register.jsp" %>

<script>
    function autocomplete(inp, arr) {
        var currentFocus;
        inp.addEventListener("input", function (e) {
            var a, b, i, val = this.value;
            closeAllLists();
            if (!val) {
                return false;
            }
            currentFocus = -1;
            a = document.createElement("DIV");
            a.setAttribute("id", this.id + "autocomplete-list");
            a.setAttribute("class", "autocomplete-items");
            this.parentNode.appendChild(a);
            for (i = 0; i < arr.length; i++) {
                if (arr[i].substr(0, val.length).toUpperCase() === val.toUpperCase()) {
                    b = document.createElement("DIV");
                    b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                    b.innerHTML += arr[i].substr(val.length);
                    b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                    b.addEventListener("click", function (e) {
                        inp.value = this.getElementsByTagName("input")[0].value;
                        closeAllLists();
                    });
                    a.appendChild(b);
                }
            }
        });

        inp.addEventListener("keydown", function (e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x) x = x.getElementsByTagName("div");
            if (e.keyCode === 40) {
                currentFocus++;
                addActive(x);
            } else if (e.keyCode === 38) { //up
                currentFocus--;
                addActive(x);
            } else if (e.keyCode === 13) {
                e.preventDefault();
                if (currentFocus > -1) {
                    if (x) x[currentFocus].click();
                }
            }
        });

        function addActive(x) {
            if (!x) return false;
            removeActive(x);
            if (currentFocus >= x.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (x.length - 1);
            x[currentFocus].classList.add("autocomplete-active");
        }

        function removeActive(x) {
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }

        function closeAllLists(elmnt) {
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }

        document.addEventListener("click", function (e) {
            closeAllLists(e.target);
        });
    }

    <%
        String text = "" ;
        ProductDAO auto = new ProductDAO();
        ArrayList <Product> arr = auto.listProduct( );
        for ( Product pro : arr ) {
        text += "\"" + pro.getProduct_name() + "\"" + ", ";
        }
    %>
    var product = [<%=text%>];
    autocomplete(document.getElementById("search" + ""), product);
</script>

<style>

    /*the container must be positioned relative:*/
    .autocomplete {
        position: relative;
        display: inline-block;
    }


    .autocomplete-items {
        position: absolute;
        border: 1px solid #d4d4d4;
        border-bottom: none;
        border-top: none;
        z-index: 99;
        overflow: scroll;
        height: 300px;
        /*position the autocomplete items to be the same width as the container:*/
        top: 100%;
        left: 0;
        right: 0;
    }

    .autocomplete-items div {
        padding: 10px;
        cursor: pointer;
        background-color: #fff;
        border-bottom: 1px solid #d4d4d4;
    }

    /*when hovering an item:*/
    .autocomplete-items div:hover {
        background-color: #e9e9e9;
    }

    /*when navigating through the items using the arrow keys:*/
    .autocomplete-active {
        background-color: DodgerBlue !important;
        color: #ffffff;
    }
</style>
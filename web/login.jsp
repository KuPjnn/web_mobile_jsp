<%@ page import="vn.edu.nlu.fit.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--================= LOGIN ==============-->
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content w-75 m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Đăng nhập</h4>
                </div>
                <div class="card-body">
                    <%
                        String err = request.getParameter("login");
                        if (err != null && err.equals("false")) {
                    %>
                    <div class="m-0 alert alert-danger alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Sai tên đăng nhập hoặc mật khẩu.
                    </div>
                    <%
                        }
                    %>
                    <form id="formLogin"
                    <%--action="<%=Util.fullPath("login")%>" method="post" --%>
                          class="form-signin">

                        <input type="hidden" name="link"
                               value="<%=Util.urlRedirect(request)%>">

                        <div class="form-label-group mb-5 mt-2">
                            <input name="username" type="text" id="username" class="form-control"
                                   placeholder="Nhập tên đăng nhập"
                                   autofocus>
                        </div>
                        <div class="form-label-group mb-5">
                            <input name="password" type="password" id="password" class="form-control"
                                   placeholder="Nhập mật khẩu">
                        </div>
                        <%--<div class="custom-control custom-checkbox mb-4">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">Nhớ mật khẩu</label>
                        </div>--%>

                        <button id="submitLogin" type="submit" class="btn_login btn btn-lg btn-block text-uppercase">
                            Đăng nhập
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script>
    <%
        if(err != null && err.equals("false")) {
    %>
    $(document).ready(function () {
        $('#login').trigger('click');
    });
    <%
        }
    %>
</script>--%>
<script type="text/javascript">

</script>


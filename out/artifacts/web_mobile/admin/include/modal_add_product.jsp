<%@ page import="vn.edu.nlu.fit.model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.nlu.fit.model.Supplier" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--==========      MODAL ADD NEW ITEMS     =================--%>
<div class="modal fade" id="addProduct" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="text-center font-weight-bold">Thêm sản phẩm mới</h4>
                </div>
                <div class="card-body">
                    <form method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add">
                        <%--ID mặt hàng--%>
                        <div class="input-group my-3">
                            <select name="id_items" class="custom-select w-50" id="id_items">
                                <option selected label="Chọn loại hàng hóa" hidden></option>
                                <%
                                    List<Item> itemList = (List<Item>) request.getAttribute("itemList");
                                    if (itemList != null) {
                                        for (Item i : itemList) {
                                %>
                                <option value="<%=i.getId()%>"><%=i.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <%--ID thương hiệu--%>
                        <div class="input-group my-3">
                            <select name="id_supplier" class="custom-select w-50" id="id_supplier">
                                <option selected label="Chọn nhà sản xuất" hidden></option>
                                <%
                                    List<Supplier> supplierList = (List<Supplier>) request.getAttribute("supplierList");
                                    if (supplierList != null) {
                                        for (Supplier s : supplierList) {
                                %>
                                <option value="<%=s.getId()%>"><%=s.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <%--Tên sản phẩm--%>
                        <div class="input-group my-3">
                            <input id="product_name" name="product_name" class="form-control" type="text"
                                   title="Tên sản phẩm"
                                   placeholder="Tên sản phẩm"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Tên sản phẩm">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <%--Giá sản phẩm--%>
                        <div class="input-group my-3">
                            <input id="price" name="price" class="form-control" type="number" title="Giá sản phẩm"
                                   placeholder="Giá sản phẩm" min="0"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Giá sản phẩm">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <%--Tổng số lượng sản phẩm--%>
                        <div class="input-group my-3">
                            <input id="total" name="total" class="form-control" type="number" title="Số lượng sản phẩm"
                                   placeholder="Tổng số lượng sản phẩm" min="0"/>
                            <div class="input-group-append">
                                <a class="input-group-text" data-toggle="tooltip" title="Tổng số lượng sản phẩm">
                                    <i class="fas fa-info-circle text-dark"></i>
                                </a>
                            </div>
                        </div>
                        <%--Ảnh sản phẩm--%>
                        <div class="custom-file my-3">
                            <input name="file" type="file" class="custom-file-input" id="file" size="50" multiple>
                            <label class="custom-file-label" for="file">Ảnh sản phẩm</label>
                        </div>

                        <%--Cấu hình sản phẩm--%>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active text-dark" data-toggle="collapse"
                                   href="#collapseConfigure"
                                   role="button"
                                   aria-expanded="false" aria-controls="collapseConfigure">
                                    Cấu hình sản phẩm
                                </a>
                            </li>

                            <div class="collapse" id="collapseConfigure">
                                <div class="card card-body">
                                    <div class="custom-control-inline">
                                        <div class="input-group m-2">
                                            <input id="os" class="form-control w-50" type="text" name="os"
                                                   placeholder="Hệ điều hành"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="Hệ điều hành">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="input-group m-2">
                                            <input id="display" class="form-control w-50" type="text" name="display"
                                                   placeholder="Màn hình"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="Màn hình">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-control-inline">
                                        <div class="input-group m-2">
                                            <input id="camera_font" class="form-control w-50" type="text"
                                                   name="camera_font"
                                                   placeholder="Camera trước"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="Camera trước">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="input-group m-2">
                                            <input id="camera_back" class="form-control w-50" type="text"
                                                   name="camera_back"
                                                   placeholder="Camera sau"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="Camera sau">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-control-inline">
                                        <div class="input-group m-2">
                                            <input id="ram" class="form-control w-50" type="text" name="ram"
                                                   placeholder="RAM"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="RAM">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="input-group m-2">
                                            <input id="rom" class="form-control w-50" type="text" name="rom"
                                                   placeholder="ROM"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="ROM">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-control-inline">
                                        <div class="input-group m-2">
                                            <input id="cpu" class="form-control w-50" type="text" name="cpu"
                                                   placeholder="CPU"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="CPU">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="input-group m-2">
                                            <input id="gpu" class="form-control w-50" type="text" name="gpu"
                                                   placeholder="GPU"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="GPU">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-control-inline">
                                        <div class="input-group m-2">
                                            <input id="pin" class="form-control w-50" type="text" name="pin"
                                                   placeholder="Pin"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="Pin">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="input-group m-2">
                                            <input id="sim" class="form-control w-50" type="text" name="sim"
                                                   placeholder="Sim"/>
                                            <div class="input-group-append">
                                                <a class="input-group-text" data-toggle="tooltip" title="Sim">
                                                    <i class="fas fa-info-circle text-dark"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                        <%--Hiển thị sản phẩm--%>
                        <hr>
                        <div class="form-check my-3">
                            <div class="custom-control custom-checkbox">
                                <input name="active" value="1" type="checkbox" class="custom-control-input"
                                       id="customCheck">
                                <label class="custom-control-label" for="customCheck">Hiển thị sản phẩm lên trang
                                    web.</label>
                            </div>
                        </div>
                        <br>
                        <input id="btn_add_product" class="btn btn-danger d-block w-100 mx-auto" type="submit"
                               value="Thêm"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    /*==============        Ajax request servlet add product     ==============*/
    $(document).ready(function () {
        $('#btn_add_product').click(function (e) {
            e.preventDefault();
            var id_items = $('#id_items').val();
            var id_supplier = $('#id_supplier').val();
            var product_name = $('#product_name').val();
            var price = $('#price').val();
            var total = $('#total').val();
            var active = $("input[name='active']:checked").val();

            var os = $("#os").val();
            var display = $("#display").val();
            var camera_font = $("#camera_font").val();
            var camera_back = $("#camera_back").val();
            var ram = $("#ram").val();
            var rom = $("#rom").val();
            var cpu = $("#cpu").val();
            var gpu = $("#gpu").val();
            var pin = $("#pin").val();
            var sim = $("#sim").val();

            if (id_items == '' || id_supplier == '' || product_name == '' || price == '' ||
                file == '' || total == '' || active == '') {
                Swal.fire({
                    title: 'Vui lòng nhập đầy đủ thông tin!',
                    confirmButtonColor: '#ff6700',
                });
            } else {
                var formData = new FormData(); /*New form data để gửi dữ liệu đi lên servlet*/
                var file = [];
                for (var i = 0; i < $("#file")[0].files.length; i++) {
                    file.push($("#file")[0].files[i]);
                }
                for (var k = 0; k < file.length; k++) {
                    formData.append("file", file[k]);
                }
                formData.append("id_items", id_items);
                formData.append("id_supplier", id_supplier);
                formData.append("product_name", product_name);
                formData.append("price", price);
                formData.append("total", total);
                formData.append("active", active);
                formData.append("os", os);
                formData.append("display", display);
                formData.append("camera_font", camera_font);
                formData.append("camera_back", camera_back);
                formData.append("ram", ram);
                formData.append("rom", rom);
                formData.append("cpu", cpu);
                formData.append("gpu", gpu);
                formData.append("pin", pin);
                formData.append("sim", sim);

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/web_mobile/admin/upload_product", true);
                xhr.send(formData);

                xhr.onload = function (e) {
                    if (this.status == 200) {
                        // alert(this.responseText);
                        window.location.reload();
                    }
                };
            }
        });
    });
    /*--------------------------------------------------------------------*/

    /*==============        Hiển thị tên file được chọn     ==============*/
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
    /*--------------------------------------------------------------------*/
    /*==============        Hiển thị tooltip bootstrap      ==============*/
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    /*--------------------------------------------------------------------*/
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--================= MODAL SEE BIL ==============-->
<!-- Modal -->
<div class="modal fade" id="modal_see_bill" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content m-auto">
            <div class="">
                <div class="card-header bg-light">
                    <h4 class="card-title text-center font-weight-bold">Chi tiết đơn hàng</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive border rounded">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Thông tin</th>
                                <th>Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>Mã đơn hàng:</th>
                                <td id="code_bill">
                                </td>
                            </tr>
                            <tr>
                                <th>Tên khách hàng:</th>
                                <td id="user_name">
                                </td>
                            </tr>
                            <tr>
                                <th>Số điện thoại:</th>
                                <td id="phone">
                                </td>
                            </tr>
                            <tr>
                                <th>Địa chỉ :</th>
                                <td id="address">
                                </td>
                            </tr>
                            <tr>
                                <th>Ngày đặt:</th>
                                <td id="date_oder">
                                </td>
                            </tr>
                            <tr>
                                <th>Sản phẩm:</th>

                                <td id="product">

                                </td>
                            </tr>

                            </tr>
                            <tr>
                                <th>Trạng thái thanh toán</th>
                                <td id="status">
                                </td>
                            </tr>

                            </tbody>
                            <tfoot>
                            <tr>
                                <td>Tổng tiền:</td>
                                <td id="total_price" style="color: #ff6700">
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.details_btn').click(function (e) {
        // $("#product").removeClass("pro");
        $('.pro').remove();
        var id_bill = $(this).find('.id_bill').val();

        var user_name = $(this).find('.user_name').val();
        var phone = $(this).find('.phone').val();
        var address = $(this).find('.address').val();
        var date_order = $(this).find('.date_order').val();
        var total = $(this).find('.total_price').val();
        var status = $(this).find('.status').val();
        $.ajax({
            url: '<%=Util.fullPath("/admin/bill")%>',
            type: 'POST',
            data: { /*Dữ liệu post lên server*/
                id_bill: id_bill
            },
            success: function (result) { /*Thành công thì thực hiện function(success)*/
                var pro = result.split('~');
                for (var i = 0; i < pro.length; i++) {
                    $("#product").append("<p class='pro'>" + pro[i] + "</p>");
                }
                $("#code_bill").text(id_bill);
                $("#user_name").text(user_name);
                $("#phone").text(phone);
                $("#date_oder").text(date_order);
                $("#address").text(address);
                $("#status").text(status);
                $("#total_price").text(total);
            },
            error: function (error) { /*Lỗi thì thực hiện function(error)*/
                console.log(error);
            }
        })
    });
</script>
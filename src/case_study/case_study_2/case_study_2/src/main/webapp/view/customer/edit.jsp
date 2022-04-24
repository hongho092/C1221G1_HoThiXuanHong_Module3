<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="giao_dien.css">
</head>
<body>
<div class="row border border-primary" id="abc">
    <div class="col-2 text-center mt-3 mb-3"><a href="#"><img
            src="https://www.svgrepo.com/show/415505/building-india-landmark.svg"></a></div>
    <div class="col-10 text-end mt-3 mb-3"><h3 class="text-danger">Ho Thi Xuan Hong</h3></div>
</div>
<div class="row sticky-top mt-2 bg bg-light">
    <div class="col-2"></div>
    <nav class="navbar navbar-light bg-light col-8">
      <span class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Home</a>
        <a class="navbar-brand" href="/employee">Employee</a>
        <a class="navbar-brand" href="/customer">Customer</a>
        <a class="navbar-brand" href="/service">Service</a>
        <div class="dropdown">
          <a class="navbar-brand dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Contract</a>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="/serviceAllController?action=showContract">Contract</a></li>
            <li><a class="dropdown-item" href="/serviceAllController?action=showContractDetail">Contract Detail</a></li>
          </ul>
        </div>
        <a class="navbar-brand" href="/customer_service">Customer_Service_Now</a>
      </span>
    </nav>
    <div class="col-2"></div>
</div>
<div class="row border border-1 mt-5">
    <div class="col-2"></div>
    <div class="col-8 bg-light text-center">
        <h4 class="text-center mt-5">Sửa thông tin KHÁCH HÀNG</h4><br>
        <form method="post">
            <table class="table table-striped text-center">
                <tr>
                    <th>Thông tin</th>
                    <th>Chi tiết</th>
                </tr>
                <tr>
                    <td><label for="form0" class="form-label">Mã khách hàng</label></td>
                    <td><input type="number" class="form-control" id="form0" value="${customer.maKhachHang}" name="maKhachHang"></td>
                </tr>
                <tr>
                    <td><label for="form1" class="form-label">Loại khách hàng</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maLoaiKhach">
                            <h:forEach items="${lkh.entrySet()}" var="lkh">
                                <h:if test="${customer.maLoaiKhach == lkh.getKey()}">
                                    <option selected id="form1" value="${lkh.getKey()}">${lkh.getValue()}</option>
                                </h:if>
                            </h:forEach>
                            <h:forEach items="${lkh.entrySet()}" var="lkh">
                                <h:if test="${customer.maLoaiKhach != lkh.getKey()}">
                                    <option value="${lkh.getKey()}">${lkh.getValue()}</option>
                                </h:if>
                            </h:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="form2" class="form-label">Họ tên</label></td>
                    <td><input type="text" class="form-control" id="form2" value="${customer.hoTen}" name="hoTen"></td>
                </tr>
                <tr>
                    <td><label for="form3" class="form-label">Ngày sinh</label></td>
                    <td><input type="date" class="form-control" id="form3" value="${customer.ngaySinh}" name="ngaySinh"></td>
                </tr>
                <tr>
                    <td><label for="form4" class="form-label">Giới tính</label></td>
                    <td>
                            <h:if test="${customer.gioiTinh == 1}">
                                <select class="form-select" aria-label="Default select example" id="form4" name="gioiTinh">
                                    <option selected value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </h:if>
                            <h:if test="${customer.gioiTinh == 0}">
                                <select class="form-select" aria-label="Default select example" id="form4" name="gioiTinh">
                                    <option selected value="0">Nam</option>
                                    <option value="1">Nữ</option>
                                </select>
                            </h:if>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="form5" class="form-label">Số CMND</label></td>
                    <td><input type="text" class="form-control col" id="form5" value="${customer.soCMND}" name="soCMND"></td>
                </tr>
                <tr>
                    <td><label for="form6" class="form-label">Số điện thoại</label></td>
                    <td><input type="text" class="form-control col" id="form6" value="${customer.soDienThoai}" name="soDienThoai"></td>
                </tr>
                <tr>
                    <td><label for="form7" class="form-label">Email</label></td>
                    <td><input type="text" class="form-control" id="form7" value="${customer.email}" name="email"></td>
                </tr>
                <tr>
                    <td><label for="form8" class="form-label">Địa chỉ</label></td>
                    <td><input type="text" class="form-control" id="form8" value="${customer.diaChi}" name="diaChi"></td>
                </tr>
            </table>
            <button type="submit" class="btn btn-primary">Sửa khách hàng</button>
        </form>
    </div>
    <div class="col-2"></div>
</div>
<div class="col-12 border border-1 text-center mt-3">
    <h5>---FOOTER---</h5>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>

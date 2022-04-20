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
<div class="col-12 sticky-top mt-2">
    <nav class="navbar navbar-light bg-light">
      <span class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Home</a>
        <a class="navbar-brand" href="/employee">Employee</a>
        <a class="navbar-brand" href="/customer">Customer</a>
        <a class="navbar-brand" href="/serviceAllController?action=showService">Service</a>
        <div class="dropdown">
          <a class="navbar-brand dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Contract</a>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="/serviceAllController?action=showContract">Contract</a></li>
            <li><a class="dropdown-item" href="/serviceAllController?action=showContractDetail">Contract Detail</a></li>
          </ul>
        </div>
        <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </span>
    </nav>
</div>
<div class="col-12 border border-1 bg-light mt-5">

    <h4 class="text-center mt-5">Edit Customer</h4><br>
    <form method="post">
        <div class="row">
            <div class="col-4">
                <label for="form0" class="form-label">Mã khách hàng</label>
                <input type="number" class="form-control" id="form0" value="${customer.maKhachHang}" name="maKhachHang">
            </div>
            <div class="col-4">
                <label for="form1" class="form-label">Loại khách hàng</label>
<%--                <input type="number" class="form-control" id="form1" value="${customer.maLoaiKhach}" name="maLoaiKhach">--%>
                <select class="form-select" aria-label="Default select example" name="maLoaiKhach">
                    <option selected id="form1" value="${customer.maLoaiKhach}">
                        <h:if test="${customer.maLoaiKhach == 1}">
                            Diamond
                        </h:if>
                        <h:if test="${customer.maLoaiKhach == 2}">
                            Platinium
                        </h:if>
                        <h:if test="${customer.maLoaiKhach == 3}">
                            Gold
                        </h:if>
                        <h:if test="${customer.maLoaiKhach == 4}">
                            Silver
                        </h:if>
                        <h:if test="${customer.maLoaiKhach == 5}">
                            Member
                        </h:if>
<%--                        ${customer.maLoaiKhach}--%>
                    </option>
                    <h:forEach items="${lkh.entrySet()}" var="lkh">
                        <option value="${lkh.getKey()}">${lkh.getValue()}</option>
                    </h:forEach>
                </select>
            </div>
            <div class="col-4">
                <label for="form2" class="form-label">Họ tên</label>
                <input type="text" class="form-control" id="form2" value="${customer.hoTen}" name="hoTen">
            </div>
            <div class="mb-3 col-4">
                <label for="form3" class="form-label">Ngày sinh</label>
                <input type="date" class="form-control" id="form3" value="${customer.ngaySinh}" name="ngaySinh">
            </div>
            <%--            <select class="form-select" aria-label="Default select example" name="gioiTinh">--%>
            <%--                <option selected>Open this select menu</option>--%>
            <%--                <option value="1">One</option>--%>
            <%--                <option value="2">Two</option>--%>
            <%--                <option value="3">Three</option>--%>
            <%--            </select>--%>
            <div class="mb-3 col-4">
                <label for="form4" class="form-label">Giới tính</label>
                <input type="text" class="form-control col" id="form4" value="${customer.gioiTinh}" name="gioiTinh">
            </div>
            <div class="mb-3 col-4">
                <label for="form5" class="form-label">Số CMND</label>
                <input type="text" class="form-control col" id="form5" value="${customer.soCMND}" name="soCMND">
            </div>
            <div class="mb-3 col-4">
                <label for="form6" class="form-label">Số điện thoại</label>
                <input type="text" class="form-control col" id="form6" value="${customer.soDienThoai}" name="soDienThoai">
            </div>
            <div class="mb-3 col-4">
                <label for="form7" class="form-label">Email</label>
                <input type="text" class="form-control" id="form7" value="${customer.email}" name="email">
            </div>
            <div class="mb-3 col-4">
                <label for="form8" class="form-label">Địa Chỉ</label>
                <input type="text" class="form-control" id="form8" value="${customer.diaChi}" name="diaChi">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Sửa thông tin khách</button>
    </form>
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

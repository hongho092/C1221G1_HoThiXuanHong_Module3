<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="option/bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="option/datatables/css/dataTables.bootstrap4.min.css" />
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
<div class="col-12 border border-1 bg-light text-center">
    <h4 class="mt-5">Danh sách KHÁCH HÀNG đang sử dụng DỊCH VỤ</h4><br>
<%--    <button class="btn btn-info mt-2"><a href="/serviceAllController?action=createContract" class="text-decoration-none">Tạo hợp đồng</a></button><br>--%>
    <h5 class="text-end me-5 text-success">${show}</h5><br>
    <table class="table table-striped text-center" id="tableStudent">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã hợp đồng</th>
            <th>Họ tên khách hàng</th>
            <th>Tên dịch vụ</th>
            <th></th>
            <th>Mô tả tiện nghi khác</th>
            <th>Chi phí thuê</th>
            <th>Tên dịch vụ đi kèm</th>
            <th>Số lượng</th>
        </tr>
        </thead>
        <tbody>
        <h:forEach items="${csn}" var="csn" varStatus="hong">
            <tr>
                <td>${hong.count}</td>
                <td>${csn.maHopDong}</td>
                <td>${csn.hoTen}</td>
                <td>${csn.tenDichVu}</td>
                <td>
                    <button class="btn btn-warning"><a class="text-decoration-none" href="customer?action=edit&id=${customer.maKhachHang}">Sửa</a></button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="deleteModal(${customer.maKhachHang}, '${customer.hoTen}')">Xóa</button>
                </td>
                <td>${csn.moTaTienNghiKhac}</td>
                <td>${csn.chiPhiThue}</td>
                <td>${csn.tenDichVuDiKem}</td>
                <td>${csn.soLuong}</td>
            </tr>
        </h:forEach>
        </tbody>
    </table><br>
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
<script src="option/jquery/jquery-3.5.1.min.js"></script>
<script src="option/datatables/js/jquery.dataTables.min.js"></script>
<script src="option/datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>

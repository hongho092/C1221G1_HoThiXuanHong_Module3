
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
<div class="row border border-1">
    <div class="col-2 border border-1 mt-2 text-center">

    </div>
    <div class="col-10 bg-light">
        <h4 class="text-center mt-5">Tạo hợp đồng</h4><br>
        <h5 class="text-end me-5 text-success">${show}</h5><br>
        <form method="post">
            <div class="row">
                <div class="mb-3 col-4">
                    <label for="form1" class="form-label">Ngày làm hợp đồng</label>
                    <input type="datetime-local" class="form-control" id="form1" name="ngayLamHopDong">
                </div>
                <div class="mb-3 col-4">
                    <label for="form2" class="form-label">Ngày kết thúc</label>
                    <input type="datetime-local" class="form-control" id="form2" name="ngayKetThuc">
                </div>
                <div class="mb-3 col-4">
                    <label for="form3" class="form-label">Tiền đặt cọc</label>
                    <input type="number" class="form-control" id="form3" name="tienDatCoc">
                </div>
                <div class="col-4">
                    <label for="form4" class="form-label">Chọn nhân viên đã tạo hợp đồng</label>
                    <select class="form-select" aria-label="Default select example" name="maNhanVien" id="form4">
                        <option selected>--Nhấn vào để chọn--</option>
                        <h:forEach items="${nvhd.entrySet()}" var="entry">
                            <option value="${entry.getKey()}">${entry.getValue()}</option>
                        </h:forEach>
                    </select>
                </div>
                <div class="col-4">
                    <label for="form5" class="form-label">Chọn khách hàng được tạo hợp đồng</label>
                    <select class="form-select" aria-label="Default select example" name="maKhachHang" id="form5">
                        <option selected>--Nhấn vào để chọn--</option>
                        <h:forEach items="${khhd.entrySet()}" var="entry">
                            <option value="${entry.getKey()}">${entry.getValue()}</option>
                        </h:forEach>
                    </select>
                </div>
                <div class="col-4">
                    <label for="form6" class="form-label">Chọn dịch vụ</label>
                    <select class="form-select" aria-label="Default select example" name="maDichVu" id="form6">
                        <option selected>--Nhấn vào để chọn--</option>
                        <h:forEach items="${dv.entrySet()}" var="entry">
                            <option value="${entry.getKey()}">${entry.getValue()}</option>
                        </h:forEach>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Tạo hợp đồng</button>
        </form>
    </div>
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




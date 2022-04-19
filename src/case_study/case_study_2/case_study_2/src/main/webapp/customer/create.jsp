<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/04/2022
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="home.css">
</head>
<body>
<div class="row border border-1">
    <div class="col-2 text-center "><a href="#"><img
            src="https://www.svgrepo.com/show/415505/building-india-landmark.svg"></a></div>
    <div class="col-10 text-end mt-5"><h3 class="text-danger">Ho Thi Xuan Hong</h3></div>
</div>
<div class="col-12 sticky-top">
    <nav class="navbar navbar-light bg-light">
      <span class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Home</a>
        <a class="navbar-brand" href="#">Employee</a>
        <a class="navbar-brand" href="#">Customer</a>
        <a class="navbar-brand" href="#">Service</a>
        <a class="navbar-brand" href="#">Contract</a>
        <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </span>
    </nav>
</div>
<div class="row border border-1">
    <div class="col-2 border border-1 mt-2 text-center">
        <button class="btn btn-warning mt-5"><a href="/customer?action=create" class="text-decoration-none">Create
            Customer</a></button>
        <br>
        <button class="btn btn-secondary mt-3"><a href="/service?action=create" class="text-decoration-none">Create
            Service</a></button>
        <br>
        <button class="btn btn-light mt-3"><a href="/employee?action=create" class="text-decoration-none">Create
            Employee</a></button>
        <br>
        <button class="btn btn-info mt-3"><a href="/contract?action=create" class="text-decoration-none">Create
            Contract</a></button>
        <br>
        <button class="btn btn-danger mt-3"><a href="/contract_detail?action=create" class="text-decoration-none">Create
            Contract Detail</a></button>
        <br>
    </div>
    <div class="col-10 bg-light">
        <h5 class="text-center mt-5">Create Customer</h5><br>
        <form method="post">
            <div class="row">
                <div class="col-4">
                    <label for="form1" class="form-label">maLoaiKhach</label>
                    <input type="number" class="form-control" id="form1" placeholder="" name="maLoaiKhach">
                </div>
                <div class="col-4">
                    <label for="form2" class="form-label">hoTen</label>
                    <input type="text" class="form-control" id="form2" name="hoTen">
                </div>
                <div class="mb-3 col-4">
                    <label for="form3" class="form-label">ngaySinh</label>
                    <input type="text" class="form-control" id="form3" name="ngaySinh">
                </div>
                <%--            <select class="form-select" aria-label="Default select example" name="gioiTinh">--%>
                <%--                <option selected>Open this select menu</option>--%>
                <%--                <option value="1">One</option>--%>
                <%--                <option value="2">Two</option>--%>
                <%--                <option value="3">Three</option>--%>
                <%--            </select>--%>
                <div class="mb-3 col-4">
                    <label for="form4" class="form-label">gioiTinh</label>
                    <input type="text" class="form-control col" id="form4" name="gioiTinh">
                </div>
                <div class="mb-3 col-4">
                    <label for="form5" class="form-label">soCMND</label>
                    <input type="text" class="form-control col" id="form5" name="soCMND">
                </div>
                <div class="mb-3 col-4">
                    <label for="form6" class="form-label">soDienThoai</label>
                    <input type="text" class="form-control col" id="form6" name="soDienThoai">
                </div>
                <div class="mb-3 col-4">
                    <label for="form7" class="form-label">email</label>
                    <input type="text" class="form-control" id="form7" name="email">
                </div>
                <div class="mb-3 col-4">
                    <label for="form8" class="form-label">diaChi</label>
                    <input type="text" class="form-control" id="form8" name="diaChi">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Create</button>
        </form>
    </div>
</div>
<h5>${show}</h5>
<div class="col-12 border border-1 text-center">
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

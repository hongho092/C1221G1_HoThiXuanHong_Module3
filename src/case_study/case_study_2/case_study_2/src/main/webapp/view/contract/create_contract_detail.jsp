<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 19/04/2022
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
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
<div class="row border border-1">
    <div class="col-2"></div>
    <div class="col-8 bg-light text-center">
        <h4 class="text-center mt-5">Nhập thông tin HỢP ĐỒNG CHI TIẾT</h4><br>
        <h5 class="text-end me-5 text-success">${show}</h5><br>
        <form method="post">
            <table class="table table-striped text-center">
                <tr>
                    <th>Thông tin</th>
                    <th>Chi tiết</th>
                    <th>Lưu ý</th>
                </tr>
                <tr>
                    <td><label for="form1" class="form-label">Mã hợp đồng</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maHopDong" id="form1">
                            <option selected value="0">--Nhấn vào để chọn--</option>
                            <h:forEach items="${mhd}" var="mhd">
                                <option value="${mhd}">${mhd}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maHopDong")}</p></td>
                </tr>
                <tr>
                    <td><label for="form2" class="form-label">Mã dịch vụ đi kèm</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maDichVuDiKem" id="form2">
                            <option selected value="0">--Nhấn vào để chọn--</option>
                            <h:forEach items="${hdct.entrySet()}" var="entry">
                                <option value="${entry.getKey()}">${entry.getValue()}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maDichVuDiKem")}</p></td>
                </tr>
                <tr>
                    <td><label for="form3" class="form-label">Số lượng</label></td>
                    <td><input type="int" class="form-control" id="form3" name="soLuong" value="0"></td>
                    <td><p class="text-danger">${error.get("soLuong")}</p></td>
                </tr>
            </table>
            <button type="submit" class="btn btn-primary">Tạo hợp đồng chi tiết</button>
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
</title>
</head>
<body>

</body>
</html>

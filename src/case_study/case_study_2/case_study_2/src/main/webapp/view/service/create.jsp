
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
      </span>
    </nav>
    <div class="col-2"></div>
</div>
<div class="row border border-1">
    <div class="col-2"></div>
    <div class="col-8 bg-light text-center">
        <h4 class="text-center mt-5">Nhập thông tin DỊCH VỤ</h4><br>
        <h5 class="text-end me-5 text-success">${show}</h5><br>
        <form method="post">
            <table class="table table-striped text-center">
                <tr>
                    <th>Thông tin</th>
                    <th>Chi tiết</th>
                    <th>Lưu ý</th>
                </tr>
                <tr>
                    <td><label for="form1" class="form-label">Tên dịch vụ</label></td>
                    <td><input type="text" class="form-control" id="form1" name="tenDichVu"></td>
                    <td><p class="text-danger">${error.get("tenDichVu")}</p></td>
                </tr>
                <tr>
                    <td><label for="form2" class="form-label">Diện tích</label></td>
                    <td><input type="number" class="form-control" id="form2" name="dienTich" value="0"></td>
                    <td><p class="text-danger">${error.get("dienTich")}</p></td>

                </tr>
                <tr>
                    <td><label for="form3" class="form-label">Chi phí thuê</label></td>
                    <td><input type="number" value="0" class="form-control" id="form3" name="chiPhiThue"></td>
                    <td><p class="text-danger">${error.get("chiPhiThue")}</p></td>

                </tr>
                <tr>
                    <td><label for="form7" class="form-label">Số người tối đa</label></td>
                    <td><input type="number" value="0" class="form-control" id="form7" name="soNguoiToiDa"></td>
                    <td><p class="text-danger">${error.get("soNguoiToiDa")}</p></td>

                </tr>
                <tr>
                    <td><label for="form4" class="form-label">Kiểu thuê</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maKieuThue" id="form4">
                            <option selected value="0">--Nhấn vào để chọn--</option>
                            <h:forEach items="${kt.entrySet()}" var="entry">
                                <option value="${entry.getKey()}">${entry.getValue()}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maKieuThue")}</p></td>
                </tr>
                <tr>
                    <td><label for="form5" class="form-label">Loại dịch vụ</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maLoaiDichVu" id="form5">
                            <option selected value="0">--Nhấn vào để chọn--</option>
                            <h:forEach items="${ldv.entrySet()}" var="entry">
                                <option value="${entry.getKey()}">${entry.getValue()}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maLoaiDichVu")}</p></td>
                </tr>
                <tr>
                    <td><label for="form6" class="form-label">Tiêu chuẩn phòng</label></td>
                    <td><input type="text" class="form-control" id="form6" name="tieuChuanPhong"></td>
                    <td><p class="text-danger">${error.get("tieuChuanPhong")}</p></td>

                </tr>
                <tr>
                    <td><label for="form8" class="form-label">Tiện ích khác</label></td>
                    <td><input type="text" class="form-control" id="form8" name="moTaTienNghiKhac"></td>
                    <td><p class="text-danger">${error.get("moTaTienNghiKhac")}</p></td>

                </tr>
                <tr>
                    <td><label for="form9" class="form-label">Diện tích hồ bơi</label></td>
                    <td><input type="number" class="form-control" id="form9" name="dienTichHoBoi" value="0"></td>
                    <td><p class="text-danger">${error.get("dienTichHoBoi")}</p></td>

                </tr>
                <tr>
                    <td><label for="form10" class="form-label">Số tầng</label></td>
                    <td><input type="number" class="form-control" id="form10" name="soTang" value="0"></td>
                    <td><p class="text-danger">${error.get("soTang")}</p></td>

                </tr>
            </table>
            <button type="submit" class="btn btn-primary">Tạo dịch vụ</button>
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




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
        <h4 class="text-center mt-5">Nhập thông tin NHÂN VIÊN</h4><br>
        <form method="post">
            <table class="table table-striped text-center">
                <tr>
                    <th>Thông tin</th>
                    <th>Chi tiết</th>
                    <th>Lưu ý</th>
                </tr>
                <tr>
                    <td><label for="form1" class="form-label">Họ tên</label></td>
                    <td><input type="text" class="form-control" id="form1" name="hoTen" value="${hoTen}"></td>
                    <td><p class="text-danger">${error.get("hoTen")}</p></td>
                </tr>
                <tr>
                    <td><label for="form3" class="form-label">Ngày sinh</label></td>
                    <td><input type="date" class="form-control" id="form3" name="ngaySinh" value="${ngaySinh}"></td>
                    <td><p class="text-danger">${error.get("ngaySinh")}</p></td>
                </tr>
                <tr>
                    <td><label for="form5" class="form-label">Số CMND</label></td>
                    <td><input type="text" class="form-control col" id="form5" name="soCMND" value="${soCMND}"></td>
                    <td><p class="text-danger">${error.get("soCMND")}</p></td>
                </tr>
                <tr>
                    <td><label for="form4" class="form-label">Lương</label></td>
                    <td><input type="number" class="form-control col" id="form4" name="luong" value="${luong}"></td>
                    <td><p class="text-danger">${error.get("luong")}</p></td>
                </tr>
                <tr>
                    <td><label for="form6" class="form-label">Số điện thoại</label></td>
                    <td><input type="text" class="form-control col" id="form6" name="soDienThoai" value="${soDienThoai}"></td>
                    <td><p class="text-danger">${error.get("soDienThoai")}</p></td>
                </tr>
                <tr>
                    <td><label for="form7" class="form-label">Email</label></td>
                    <td><input type="text" class="form-control col" id="form7" name="email" value="${email}"></td>
                    <td><p class="text-danger">${error.get("email")}</p></td>
                </tr>
                <tr>
                    <td><label for="form8" class="form-label">Địa chỉ</label></td>
                    <td><input type="text" class="form-control col" id="form8" name="diaChi" value="${diaChi}"></td>
                    <td><p class="text-danger">${error.get("diaChi")}</p></td>
                </tr>
                <tr>
                    <td><label for="form2" class="form-label">Vị trí</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maViTri">
                            <option selected id="form2" value="0">--Nhấn vào để chọn--</option>
                            <h:forEach items="${vt.entrySet()}" var="vt">
                                <option value="${vt.getKey()}">${vt.getValue()}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maViTri")}</p></td>
                </tr>
                <tr>
                    <td><label for="form2" class="form-label">Trình độ</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maTrinhDo">
                            <option selected id="form2" value="0" >--Nhấn vào để chọn--</option>
                            <h:forEach items="${td.entrySet()}" var="td">
                                <option value="${td.getKey()}">${td.getValue()}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maTrinhDo")}</p></td>
                </tr>
                <tr>
                    <td><label for="form2" class="form-label">Bộ phận</label></td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="maBoPhan">
                            <option selected id="form2" value="0">--Nhấn vào để chọn--</option>
                            <h:forEach items="${bp.entrySet()}" var="bp">
                                <option value="${bp.getKey()}">${bp.getValue()}</option>
                            </h:forEach>
                        </select>
                    </td>
                    <td><p class="text-danger">${error.get("maBoPhan")}</p></td>
                </tr>
            </table>
            <button type="submit" class="btn btn-primary">Tạo nhân viên</button>
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

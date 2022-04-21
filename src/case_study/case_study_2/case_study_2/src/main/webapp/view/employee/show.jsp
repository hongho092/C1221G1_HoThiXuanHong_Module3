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
      </span>
    </nav>
    <div class="col-2"></div>
</div>
<div class="col-12 border border-1 bg-light text-center">
    <div class="row mt-5 ">
        <div class="col-4"></div>
        <h4 class="col-4">Danh sách NHÂN VIÊN</h4><br>
        <form class="col-4 text-end" action="/employee">
            <div class="btn-group dropstart">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    Tìm kiếm NHÂN VIÊN
                </button>
                <input type="hidden" name="action" value="search">
                <ul class="dropdown-menu">
                    <div class="input-group mb-2">
                        <span class="input-group-text">Tên</span>
                        <input type="text" class="form-control" name="ten">
                    </div>
                    <div class="input-group mb-2">
                        <span class="input-group-text">Địa chỉ</span>
                        <input type="text" class="form-control" name="dia-chi">
                    </div>
                    <div class="text-end">
                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                    </div>
                </ul>
            </div>
<%--            <input type="hidden" name="action" value="search">--%>
<%--            <input class="form-control me-2" type="text" placeholder="Tên nhân viên muốn tìm" name="name">--%>
<%--            <button class="btn btn-outline-success" type="submit">Tìm</button>--%>
        </form>
    </div>
    <button class="btn btn-warning mt-2 text-start mt-3"><a href="/employee?action=create" class="text-decoration-none">Tạo NHÂN VIÊN</a></button><br>
    <h5 class="text-end me-5 text-success">${show}</h5><br>
    <table class="table table-striped text-center" id="tableStudent">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã nhân viên</th>
            <th>Họ tên</th>
            <th>Ngày sinh</th>
            <th>Số CMND</th>
            <th>Lương</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Mã vị trí</th>
            <th>Mã trình độ</th>
            <th>Mã bộ phận</th>
        </tr>
        </thead>
        <tbody>
        <h:forEach items="${employees}" var="employee" varStatus="hong">
            <tr>
                <td>${hong.count}</td>
                <td>${employee.maNhanVien}</td>
                <td>${employee.hoTen}</td>
                <td>${employee.ngaySinh}</td>
                <td>${employee.soCMND}</td>
                <td>${employee.luong}</td>
                <td>${employee.soDienThoai}</td>
                <td>${employee.email}</td>
                <td>${employee.diaChi}</td>
                <td>
                    <h:forEach items="${vt.entrySet()}" var="vt">
                        <h:if test="${employee.maViTri == vt.getKey()}">
                            ${vt.getValue()}
                        </h:if>
                    </h:forEach>
                </td>
                <td>
                    <h:forEach items="${td.entrySet()}" var="td">
                        <h:if test="${employee.maTrinhDo == td.getKey()}">
                            ${td.getValue()}
                        </h:if>
                    </h:forEach>
                </td>
                <td>
                    <h:forEach items="${bp.entrySet()}" var="bp">
                        <h:if test="${employee.maBoPhan == bp.getKey()}">
                            ${bp.getValue()}
                        </h:if>
                    </h:forEach>
                </td>
                <td>
                    <button class="btn btn-warning"><a class="text-decoration-none" href="employee?action=edit&id=${employee.maNhanVien}">Sửa</a></button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="deleteModal(${employee.maNhanVien}, '${employee.hoTen}')">Xóa</button>
                </td>
            </tr>
        </h:forEach>
        </tbody>
    </table><br>
</div>
<div class="col-12 border border-1 text-center mt-3">
    <h5>---FOOTER---</h5>
</div>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Xóa khách hàng.</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee">
                <input type="hidden" name="action" value="delete">
                <div class="modal-body">
                    <input type="hidden" id="idCustomerDelete" name="id">
                    <p>Bạn có chắc muốn xóa nhân viên có mã là <span id="idDelete"></span> và tên là "<span id="nameDelete"></span>" không?</p>
                    <p class="text-danger">Sẽ không thể hoàn tác nếu bạn đã xóa!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
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
<script>
    function deleteModal(id, name) {
        document.getElementById("idDelete").innerText = id;
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idCustomerDelete").value = id;
    }
</script>
</body>
</html>

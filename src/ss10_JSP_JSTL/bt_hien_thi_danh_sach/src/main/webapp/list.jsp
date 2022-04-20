<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/04/2022
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách</title>
    <%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <style>
        img {
            width: 200px;
            height: 200px;
        }
    </style>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h1 class="text-center">Danh sách khách hàng</h1>
<table class="table table-striped" id="abc">
    <thead>
        <tr class="row">
            <th class="col-2">STT</th>
            <th class="col-2">Tên</th>
            <th class="col-3">Ngày Sinh</th>
            <th class="col-2">Địa Chỉ</th>
            <th class="col-3">Ảnh</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${customers}" varStatus="hong">
            <tr class="row">
                <td class="col-2">${hong.count}</td>
                <td class="col-2">${customer.ten}</td>
                <td class="col-3">${customer.ngaySinh}</td>
                <td class="col-2">${customer.diaChi}</td>
                <td class="col-3"><img src="${customer.anh}"></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('#abc').dataTable({--%>
<%--            "dom": 'lrtip',--%>
<%--            "lengthChange": false,--%>
<%--            "pageLength": 3--%>
<%--        })--%>
<%--    });--%>
<%--</script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>--%>
</body>
</html>

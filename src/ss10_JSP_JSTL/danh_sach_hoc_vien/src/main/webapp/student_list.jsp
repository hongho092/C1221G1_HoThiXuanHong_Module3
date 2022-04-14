<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/04/2022
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách học viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<h2 class="text-center">Danh sách học sinh</h2>
<table border="1" class="table table-striped text-center">
    <tr>
        <th>STT</th>
        <th>Tên học viên</th>
        <th>Mã học viên</th>
        <th>Ngày Sinh</th>
        <th>Giới Tính</th>
        <th>Điểm</th>
    </tr>
    <c:forEach var="student" items="${students}" varStatus="hong">
        <tr>
            <td>${hong.count}</td>
            <td>${student.ma}</td>
            <td>${student.ten}</td>
            <td>${student.ngaySinh}</td>
<%--            <td>${student.gioiTinh}</td>--%>
            <td>
                <c:if test="${student.gioiTinh == 0}">
                    Nữ
                </c:if>
                <c:if test="${student.gioiTinh == 1}">
                    Nam
                </c:if>
            </td>
<%--            <td>${student.diem}</td>--%>
            <td>
                <c:choose>
                    <c:when test="${student.diem > 9}">Giỏi</c:when>
                    <c:when test="${student.diem > 7}">Khá</c:when>
                    <c:when test="${student.diem > 5}">Trung bình</c:when>
                    <c:when test="${student.diem <= 5}">Yếu</c:when>
                    <c:otherwise>Ngoại lệ</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>

</table>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/04/2022
  Time: 08:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hiển thị thông tin sản phẩm</title>
</head>
<body>
<table>
    <tr>
        <td>ID: </td>
        <td>${product.id}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${product.name}</td>
    </tr>
    <tr>
        <td>Color: </td>
        <td>${product.color}</td>
    </tr>
</table>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/04/2022
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhập thông tin sản phẩm</title>
</head>
<body>
<fieldset>
    <legend>Update Product</legend>
    <form method="post">
        <lable>Input Id_Product</lable>
        <input type="number" name="id"><br>
        <lable>Input Name_Product</lable>
        <input type="text" name="name"><br>
        <lable>Input Color_Product</lable>
        <input type="text" name="color"><br>
        <button type="submit">Update Product</button>
    </form>
</fieldset>
<h3>${show1}</h3>
</body>
</html>

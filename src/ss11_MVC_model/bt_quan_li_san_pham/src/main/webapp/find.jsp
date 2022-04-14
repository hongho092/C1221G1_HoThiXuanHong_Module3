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
    <title>Tìm sản phẩm</title>
</head>
<body>
<fieldset>
    <legend>Find Product</legend>
    <form method="post">
        <lable>Input Id_Product</lable>
        <input type="number" name="id"><br>
        <button type="submit">Find Product</button>
    </form>
</fieldset>
<h3>${show3}</h3>
<h4>Name --> ${name}</h4>
<h4>Color --> ${color}</h4>
</body>
</html>

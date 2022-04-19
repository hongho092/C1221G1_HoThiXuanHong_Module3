<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/04/2022
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Of Product</title>
</head>
<body style="width: 500px">
<fieldset>
    <legend><button><a href="/product">Back Menu</a></button></legend>
    <div style="border: 1px solid yellow; padding-left: 80px">
        <h3>Id --> ${product.id}</h3>
        <h3>Name --> ${product.name}</h3>
        <h3>Detail --> ${product.detail}</h3>
        <h3>Quantity --> ${product.quantity}</h3>
        <h3>Made --> ${product.made}</h3>
    </div>
</fieldset>
</body>
</html>

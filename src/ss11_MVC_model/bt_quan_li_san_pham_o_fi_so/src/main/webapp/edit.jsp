<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/04/2022
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Of Product</title>
</head>
<body style="width: 600px">
<form method="post">
    <fieldset>
        <legend><button><a href="/product">Back Menu</a></button></legend>
        <div style="border: 1px solid yellow; padding-left: 80px">
            <h2>Edit for product has: ${product.id}</h2>
            <h3>Id --> <input type="number" name="id" value="${product.id}"></h3>
            <h3>Name --> <input type="text" name="name"> <-- ${product.name}</h3>
            <h3>Detail --> <input type="text" name="detail"> <-- ${product.detail}</h3>
            <h3>Quantity --> <input type="number" name="quantity"> <-- ${product.quantity}</h3>
            <h3>Made --> <input type="text" name="made"> <-- ${product.made}</h3>
            <button type="submit">Edit</button>
        </div>
        <h3>${mess}</h3>
    </fieldset>
</form>
</body>
</html>

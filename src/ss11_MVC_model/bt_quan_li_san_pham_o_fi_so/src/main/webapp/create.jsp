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
    <title>Create Of Product</title>
</head>
<body style="width: 600px">
<form method="post">
    <fieldset>
        <legend><button><a href="/product">Back Menu</a></button></legend>
        <div style="border: 1px solid yellow; padding-left: 80px">
            <h3>Id --> <input type="number" name="id"></h3>
            <h3>Name --> <input type="text" name="name"></h3>
            <h3>Detail --> <input type="text" name="detail"></h3>
            <h3>Quantity --> <input type="number" name="quantity"></h3>
            <h3>Made --> <input type="text" name="made"></h3>
            <button type="submit">Create</button>
        </div>
        <h3>${mess}</h3>
    </fieldset>
</form>
</body>
</html>

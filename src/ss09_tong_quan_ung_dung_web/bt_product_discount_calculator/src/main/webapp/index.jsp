<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/04/2022
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>

<h2>Product Discount Calculator</h2>
<form action="/calculator" method="post">
    <label>List Price: </label><br/>
    <input type="number" name="price" placeholder="please, input"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="number" name="discount" placeholder="please, input"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>

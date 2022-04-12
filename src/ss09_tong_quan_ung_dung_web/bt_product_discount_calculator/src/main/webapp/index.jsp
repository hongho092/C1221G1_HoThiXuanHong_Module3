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
<%--<from action="/translate" method="post">--%>
<%--    <h1>Product Discount Calculator</h1>--%>
<%--    <label for="abc"><h3>Product Description</h3></label>--%>
<%--    <input type="text" placeholder="Product Description" id="abc">--%>
<%--    <label for="bcd"><h3>List Price</h3></label>--%>
<%--    <input type="number" name="price" placeholder="List Price" id="bcd">--%>
<%--    <label for="cde"><h3>Discount Percent</h3></label>--%>
<%--    <input type="number" name="discount" placeholder="Discount Percent" id="cde">--%>
<%--    <input type="submit" id="submit" value="Calculator">--%>
<%--</from>--%>

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

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/04/2022
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/calculator" method="get">
    <fieldset>
        <legend>Ứng dụng Calculator</legend>
        <lable>First operand:</lable>
        <input type="number" name="fir_ope"><br>
        <lable>Operator:</lable>
        <select name="operator">
            <option value="Addition">Addition</option>
            <option value="Subtraction">Subtraction</option>
            <option value="Multiplication">Multiplication</option>
            <option value="Division">Division</option>
        </select><br>
        <lable>Second operand: <input type="number" name="sec_ope"></lable>
        <input type="submit" value="Result">
    </fieldset>
</form>
</body>
</html>

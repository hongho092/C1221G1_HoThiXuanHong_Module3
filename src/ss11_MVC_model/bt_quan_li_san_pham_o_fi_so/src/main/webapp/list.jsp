<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/04/2022
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>

<h1 class="text-center">List Of Product</h1><br><br>
<table class="text-center table table-striped">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Detail_color</th>
        <th>Quantity</th>
        <th>Made</th>
        <th>Option</th>
    </tr>
    <h:forEach items="${products}" var="product">
        <tr>
            <td><a href="/product?action=show&id=${product.id}">${product.id} </a></td>
            <td>${product.name}</td>
            <td>${product.detail}</td>
            <td>${product.quantity}</td>
            <td>${product.made}</td>
            <td>
                <button class="btn btn-warning"><a href="/product?action=edit&id=${product.id}">Edit</a></button>
                <button class=" btn btn-danger"><a href="/product?action=delete&id=${product.id}">Delete</a></button>
            </td>
        </tr>
    </h:forEach>
</table><br><br>
<div class="text-center"><button class="btn btn-primary"><a href="/product?action=create" class="text-danger">Create Product</a></button></div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
</body>
</html>

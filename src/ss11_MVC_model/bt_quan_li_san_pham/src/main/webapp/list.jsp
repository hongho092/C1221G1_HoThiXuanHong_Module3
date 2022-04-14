<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/04/2022
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<h1 class="text-center">List of Produce</h1>
<table class="table table-striped text-center">
    <tr>
        <th>STT</th>
        <th>Id_Product</th>
        <th>Name_Product</th>
        <th>Color_Product</th>
    </tr>
    <h:forEach varStatus="hong" var="product" items="${products}">
        <tr>
            <td>${hong.count}</td>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.color}</td>
        </tr>
    </h:forEach>
</table>
<br><br>
<button class="btn btn-danger"><a href="/product?action=create">Add Product</a></button>
<button class="btn btn-danger"><a href="/product?action=update">Update Product</a></button>
<button class="btn btn-danger"><a href="/product?action=delete">Delete Product</a></button>
<button class="btn btn-danger"><a href="/product?action=find">Find Product</a></button>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

</body>
</html>

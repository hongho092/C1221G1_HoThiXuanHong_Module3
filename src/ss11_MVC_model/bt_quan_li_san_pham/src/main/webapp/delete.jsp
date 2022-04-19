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
    <title>Xóa sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<button class="btn btn-primary text-danger"><a href="/product" style="color: black">Back Home</a></button>
<fieldset>
    <legend>Delete Product</legend>

        <lable>Input Id_Product</lable>
        <input type="number" id="idInput" name="id"><br>
        <button type="button" onclick="showInfo()" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Delete
        </button>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/product" method="post">
                        <div class="modal-body">
                            Bạn có chắn muốn xóa không?
                            <input id="idDelete" type="text" name="id">
                            <input name="action"  value="delete" type="hidden">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

</fieldset>
<h3>${show2}</h3>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script>
    function showInfo(){
        document.getElementById("idDelete").value = document.getElementById("idInput").value;
    }
</script>
</body>
</html>

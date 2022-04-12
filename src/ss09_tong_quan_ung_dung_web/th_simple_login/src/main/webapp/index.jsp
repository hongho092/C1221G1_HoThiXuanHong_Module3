<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/04/2022
  Time: 09:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .login {
            height: 200px; width:400px;
            margin: 0;
            padding: 10px;
            border: 2px red solid;
        }
        .login input {
            padding:5px; margin:5px
        }
    </style>
</head>

<body>
<form method="post" action="/login">
    <div class="login">
        <h2>Login</h2>
        <input type="text" name="username" size="30"  placeholder="username" />
        <input type="password" name="password" size="30" placeholder="password" /><br>
        <input type="submit" value="Sign in"/>
    </div>
</form>
</body>
</html>

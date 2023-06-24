<%@ page import="br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.User" %><%--
  Created by IntelliJ IDEA.
  User: jackson
  Date: 18/06/2023
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) request.getAttribute("user");
%>
<html>
<head>
    <title>Editar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        form {
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        ::placeholder {
            color: #999;
        }
    </style>
</head>
<body>
<form method="post" action="UserEditarController">

    <input type="text" name="id" value="<%= user.getId() %>"/>
    <input type="text" name="name" value="<%= user.getName() %>"/>
    <input type="text" name="email" value="<%= user.getEmail() %>"/>
    <select  name="type">
        <option value="ADMINISTRADOR" <%= user.getType().equals("ADMINISTRADOR") ? "selected" : "" %>>ADMINISTRADOR</option>
        <option value="USUARIO" <%= user.getType().equals("USUARIO") ? "selected" : "" %>>USUARIO</option>
    </select>
    <button> Salvar </button>
</form>

</body>
</html>

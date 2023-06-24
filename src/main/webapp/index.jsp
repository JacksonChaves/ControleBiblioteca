<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    String msg = request.getParameter("msg");
    if(msg == null){
        msg = "";
    }


%>

<!DOCTYPE html>
<html>
<head>
    <title>Index </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="submit"] {
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            margin: 10px 0;
        }

        button a {
            text-decoration: none;
            color: #fff;
            padding: 5px 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
        }

        button a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<form action="login" method="post">

    <div>
        <input type="text" name="field_user" placeholder="Informe seu usuario">
    </div>

    <div>
        <input type="password" name="field_password" placeholder="Informe sua senha" >
    </div>

    <input type="submit">
    <p> <%= msg  %> </p>

</form>

<%--<p>usuário default (inserido em dados iniciais)</p>--%>
<%--<p>usuário: admin</p>--%>
<%--<p>senha: admin</p>--%>

</body>
</html>
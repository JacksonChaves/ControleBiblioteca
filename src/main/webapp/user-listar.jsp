<%@ page import="br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifpr.biblioteca.controledebiblioteca.domain.enums.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<User> users = (List<User>) request.getAttribute("attr_users");
    User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>Usuários</title>
    <style>
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

        input[type="text"] {
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
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<form method="GET" action="UserListarController">
    <label for="filtro-nome"></label>
    <input type="text" id="filtro-nome" name="filtro-nome" placeholder="Digite um nome">
    <input type="submit" value="Filtrar">
</form>


<button>
    <a href="UserCadastroController" >Novo</a>
</button>

<button>
    <a href="BookListarController" >Início</a>
</button>

<table>
    <tr>
        <td>#Id</td>
        <td>Nome</td>
        <td>Email</td>
        <td>Tipo</td>
        <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
        <td>Opções</td>
        <%}%>

    </tr>
    <% for(User u: users){ %>

    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getType() %></td>

        <td>
            <button>
                <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
                <a href="UserEditarController?id=<%= u.getId()%>" >Editar</a>
            </button>
            <%}%>
        </td>

        <td>
            <button>
                <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
                <a href="UserExcluirController?id=<%= u.getId()%>" >Excluir</a>
            </button>
            <%}%>
        </td>
    </tr>

    <% } %>

</table>

</body>
</html>

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
            <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
                <a href="UserEditarController?id=<%= u.getId()%>" >Editar</a>
            <%}%>
        </td>

        <td>
            <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
                <a href="UserExcluirController?id=<%= u.getId()%>" >Excluir</a>
            <%}%>
        </td>
    </tr>

    <% } %>

</table>

</body>

</html>
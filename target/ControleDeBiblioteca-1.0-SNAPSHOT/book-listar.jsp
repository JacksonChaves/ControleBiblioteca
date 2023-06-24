<%@ page import="br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.User" %>
<%@ page import="static br.edu.ifpr.biblioteca.controledebiblioteca.domain.enums.UserType.ADMINISTRADOR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Book> books = (List<Book>) request.getAttribute("attr_books");
    User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>Controle de Biblioteca</title>
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
<form class="filter-form" method="GET" action="BookListarController">
    <label for="filtro-livro">Filtrar livro:</label>
    <input type="text" id="filtro-livro" name="filtro-livro" placeholder="Digite o nome de um livro">
    <input type="submit" value="Filtrar">
</form>

<button class="options-button">
    <a href="/ControleDeBiblioteca/BookCadastroController">Novo Livro</a>
</button>

<button class="options-button">
    <a href="/ControleDeBiblioteca/UserListarController">Usuários</a>
</button>

<button class="options-button">
    <a href="BookListarController">Início</a>
</button>

<table>
    <tr>
        <th>#Id</th>
        <th>Nome</th>
        <th>Autor</th>
        <th>Data</th>
        <th>Status</th>
        <%if (user.getType().equals(ADMINISTRADOR)){%>
        <th>Opções</th>
        <%}%>
    </tr>
    <% for(Book b: books){ %>
    <tr>
        <td><%= b.getId() %></td>
        <td><%= b.getNome() %></td>
        <td><%= b.getAutor() %></td>
        <td><%= b.getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></td>
        <td><%= b.getStatus() %></td>
        <td>
            <button>
                <%if (user.getType().equals(ADMINISTRADOR)){%>
                <a href="BookEditarController?id=<%= b.getId() %>" method="get">Editar</a>
            </button>
            <%}%>
        </td>
        <td>
            <button>
                <%if (user.getType().equals(ADMINISTRADOR)){%>
                <a href="BookExcluirController?id=<%= b.getId()%>">Excluir</a>
            </button>
            <%}%>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>


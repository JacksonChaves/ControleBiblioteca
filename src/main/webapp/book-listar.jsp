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
    <title></title>
</head>
<body>
<form method="GET" action="BookListarController">
    <label for="filtro-livro"></label>
        <input type="text" id="filtro-livro" name="filtro-livro" placeholder="Digite o nome de um livro">
    <input type="submit" value="Filtrar">
</form>

<button>
    <a href="/ControleDeBiblioteca/BookCadastroController" >Novo Livro</a>
</button>

<button>
    <a href="/ControleDeBiblioteca/UserListarController" >Usuários</a>
</button>

<button>
    <a href="BookListarController" >Início</a>
</button>


<table>
    <tr>
        <td>#Id</td>
        <td>Nome</td>
        <td>Autor</td>
        <td>Data</td>
        <td>Status</td>
        <%if (user.getType().equals(ADMINISTRADOR)){%>
            <td>Opções</td>
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
                <%if (user.getType().equals(ADMINISTRADOR)){%>
                    <a href="BookEditarController?id=<%= b.getId() %>" method="get" >Editar</a>
                <%}%>
            </td>

            <td>
                <%if (user.getType().equals(ADMINISTRADOR)){%>
                    <a href="BookExcluirController?id=<%= b.getId()%>" >Excluir</a>
                <%}%>
            </td>
        </tr>

    <% } %>

</table>

</body>
</html>

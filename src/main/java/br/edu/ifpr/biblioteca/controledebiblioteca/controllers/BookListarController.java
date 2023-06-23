package br.edu.ifpr.biblioteca.controledebiblioteca.controllers;


import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.Book;
import br.edu.ifpr.biblioteca.controledebiblioteca.services.BookService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "BookListarController", value = {"/BookListarController"})
public class BookListarController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        BookService bookService = new BookService();
        List<Book> books = bookService.findAll();

        String filtroLivro = request.getParameter("filtro-livro");

        if (filtroLivro != null && !filtroLivro.isEmpty()) {
            books = books.stream()
                    .filter(b -> b.getNome().contains(filtroLivro))
                    .collect(Collectors.toList());
        }

        request.setAttribute("attr_books", books);

        RequestDispatcher dispatcher = request.getRequestDispatcher("book-listar.jsp");

        dispatcher.forward(request, response);

    }

}
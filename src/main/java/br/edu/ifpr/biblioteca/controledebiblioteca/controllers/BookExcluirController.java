package br.edu.ifpr.biblioteca.controledebiblioteca.controllers;

import br.edu.ifpr.biblioteca.controledebiblioteca.domain.enums.BookStatus;
import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.Book;
import br.edu.ifpr.biblioteca.controledebiblioteca.repositories.BookRepository;
import br.edu.ifpr.biblioteca.controledebiblioteca.services.BookService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BookExcluirController", value = {"/BookExcluirController"})
public class BookExcluirController extends HttpServlet {

    BookService bookService;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        BookRepository bookRepository = new BookRepository();

        String id = request.getParameter("id");

        Book book = bookRepository.findById(Integer.parseInt(id));

        if(book.getStatus().equals(BookStatus.INDISPONIVEL)) {

            bookRepository.removeById(Integer.parseInt(id));

            response.sendRedirect("http://localhost:8080//ControleDeBiblioteca/BookListarController");
        } else {
            response.sendRedirect("http://localhost:8080//ControleDeBiblioteca/BookListarController");

        }

    }
}

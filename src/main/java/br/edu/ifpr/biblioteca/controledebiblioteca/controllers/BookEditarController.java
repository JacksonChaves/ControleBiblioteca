package br.edu.ifpr.biblioteca.controledebiblioteca.controllers;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import br.edu.ifpr.biblioteca.controledebiblioteca.domain.enums.BookStatus;
import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.Book;
import br.edu.ifpr.biblioteca.controledebiblioteca.services.BookService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "BookEditarController", value = {"/BookEditarController"})
public class BookEditarController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        BookService b = new BookService();
        Book book = b.findById(Integer.parseInt(id));
        request.setAttribute("book", book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book-editar.jsp");
        dispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException,IOException {
        BookService bookService = new BookService();

        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String autor = request.getParameter("autor");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        Book book = bookService.findById(Integer.parseInt(id));
        book.setNome(nome);
        book.setAutor(autor);
        book.setDate(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd/MM/yyyy")));
        book.setStatus(BookStatus.valueOf(status));
        bookService.update(book);
        response.sendRedirect("http://localhost:8080/ControleDeBiblioteca/BookListarController");

    }
}

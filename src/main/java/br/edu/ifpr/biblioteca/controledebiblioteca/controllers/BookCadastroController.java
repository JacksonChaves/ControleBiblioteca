package br.edu.ifpr.biblioteca.controledebiblioteca.controllers;

import java.io.*;

import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.Book;
import br.edu.ifpr.biblioteca.controledebiblioteca.services.BookService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "BookCadastroController", value = {"/BookCadastroController"})
public class BookCadastroController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        RequestDispatcher dispatcher = request.getRequestDispatcher("book-cadastro.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        BookService bookService = new BookService();


        String nome = request.getParameter("nome");
        String autor = request.getParameter("autor");
        String date = request.getParameter("date");

        Book book = bookService.create(nome, autor, date);



        response.sendRedirect("http://localhost:8080/ControleDeBiblioteca/BookListarController");
    }


}
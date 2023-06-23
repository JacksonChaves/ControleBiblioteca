package br.edu.ifpr.biblioteca.controledebiblioteca.controllers;

import br.edu.ifpr.biblioteca.controledebiblioteca.domain.enums.UserType;
import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.User;
import br.edu.ifpr.biblioteca.controledebiblioteca.services.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserEditarController", value = {"/UserEditarController"})
public class UserEditarController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        System.out.println("Testando editar ID " + id );
        UserService u = new UserService();
        User user = u.findById(Integer.parseInt(id));
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-editar.jsp");
        dispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException,IOException {
        UserService userService = new UserService();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String type = request.getParameter("type");

        User user = userService.findById(Integer.parseInt(id));
        user.setName(name);
        user.setEmail(email);
        user.setType(UserType.valueOf(type));
        userService.update(user);
        response.sendRedirect("http://localhost:8080/ControleDeBiblioteca/BookListarController");

    }
}


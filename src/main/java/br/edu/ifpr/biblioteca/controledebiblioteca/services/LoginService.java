package br.edu.ifpr.biblioteca.controledebiblioteca.services;

import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.User;
import br.edu.ifpr.biblioteca.controledebiblioteca.repositories.UserRepository;
import jakarta.persistence.NoResultException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class LoginService {

    UserRepository userRepository = new UserRepository();

    public void validateLogin(String user, String password, HttpServletRequest request) throws Exception {

        if(user == null || user.isEmpty() || password == null || password.isEmpty()) {
            throw new Exception("Você precisa preencher os campos!");
        }

        try {

            User u = userRepository.findByUser(user);

            if (user.equals(u.getName()) && password.equals(u.getPassword())){
                System.out.println("Dados do usario passaram no teste de login e senha e a sessao foi criada");
                HttpSession session = request.getSession();
                session.setAttribute("is_logged_in", true);
                session.setAttribute("user", u);
            } else {
                throw new Exception("Usuario ou senha incorreto");
            }

        } catch (NoResultException e){
            throw new NoResultException("Usuario nao cadastrado no sistema!");
        }
    }
}

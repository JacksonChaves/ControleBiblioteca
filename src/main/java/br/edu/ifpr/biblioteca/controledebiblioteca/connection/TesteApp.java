package br.edu.ifpr.biblioteca.controledebiblioteca.connection;

import br.edu.ifpr.biblioteca.controledebiblioteca.domain.models.User;
import br.edu.ifpr.biblioteca.controledebiblioteca.repositories.UserRepository;

import java.util.List;

public class TesteApp {


    public static void main(String[] args) {
        UserRepository repository = new UserRepository();

        List<User> all = repository.findAll();

        System.out.println(all);
    }




}

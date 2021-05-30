/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author juanc
 */
public class User {
    private int id; 
    private String username;
    private String password;
    private String email;
    private int contador;
    private List <Book> cartBooks;
    private String rol;
    
    public User(int id, String username, String password, String email){
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.contador = 0;
        this.cartBooks = null; 
        this.rol = "member";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getContador() {
        return contador;
    }

    public void setContador(int contador) {
        this.contador = contador;
    }

    public List<Book> getCartBooks() {
        return cartBooks;
    }

    public void setCartBooks(List<Book> cartBooks) {
        this.cartBooks = cartBooks;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
}

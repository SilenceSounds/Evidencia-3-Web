/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 * 
 * @author jesgu
 */
public class Book {
    private String id;
    private String title;
    private String cover;
    private String desc;
    private String sinopsis;
    private String price;
    private String author;
    private int cantidad;

    //Constructor
    public Book(String id, String title, String cover, String desc, String sinopsis, String price, String author) {
        this.id = id;
        this.title = title;
        this.cover = cover;
        this.desc = desc;
        this.sinopsis = sinopsis;
        this.price = price;
        this.author = author;
        this.cantidad = 1;
    }

    //Constructor vacío
    public Book() {
    }
    
    //Getters y Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}

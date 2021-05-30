/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;
import model.Library;

/**
 *
 * @author jesgu
 */
public class bookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Acción que determina qué hará el servlet y a dónde redirigirá
            String accion = request.getParameter("accion");
            //Instanciar la librería
            Library library = new Library();
            //Crear la lista de libros
            List <Book> books = library.getBooks();
            //Crear el la lista de items que irán al carrito
            List<Book> cartBooks = new ArrayList();
            
            
            if(request.getSession().getAttribute("username") == null){
                request.getSession().setAttribute("username", "Invitado");
                request.getSession().setAttribute("rol", "invitado");
            }
            
            /*Se determina si ya existe la lista en la sesión, para
              que se siga usando dicha lista y no se cree desde cero
             */
            if(request.getSession().getAttribute("listBooks")!=null){
                cartBooks = (List<Book>) request.getSession().getAttribute("listBooks");
            } 
            //Si hay acción, realizará el switch, de lo contrario irá al catálogo
            if(accion!=null){
                //Switch que maneja la acción a realizar
                switch(accion){
                    //Ir a la página del detalle del libro
                    case "detalle":
                        //Conseguir el id del libro
                        int id = Integer.parseInt(request.getParameter("id"));
                        //Se instancia un libro, buscándolo por su id
                        Book detailBook = library.getBookById(id);
                        //Se manda el libro como atrubuto
                        request.setAttribute("book", detailBook);
                        //Se redirige a la página de detalle
                        request.getRequestDispatcher("/detalle.jsp").forward(request, response);
                        break;
                    //Ir a la página del carrito
                    case "carrito":
                        //Si la lista no es nula, envía la lista de items
                        if(request.getSession().getAttribute("listBooks")!=null){
                            request.getSession().setAttribute("listBooks", cartBooks);
                        }
                        //Se redirige a la página del carrito
                        request.getRequestDispatcher("/carrito.jsp").forward(request, response);
                        break;
                    //Agregar un libro al carrito
                    case "agregarCarrito":
                        //Conseguir el id del libro
                        int bookId = Integer.parseInt(request.getParameter("id"));
                        //Bandera para identificar repetidos
                        boolean repetido = false;
                        //Se instancia un libro, buscándolo por su id
                        Book book =(Book) library.getBookById(bookId);
                        /*Ciclo para encontrar si el libro seleccionado ya está 
                          dentro de la lista. En caso de ser así, solo modifica
                          el atributo de cantidad del libro seleccionado*/
                        for(Book bookAux:cartBooks){
                            if(book.getId().equals(bookAux.getId())){
                                bookAux.setCantidad(bookAux.getCantidad()+1);
                                repetido = true;
                            }
                        }
                        //Si el libro no está repetido, lo agrega a la lista
                        if(!repetido){
                            cartBooks.add(book);
                        }
                        //Manda el contador, para cuestión gráfica en el menú
                        request.getSession().setAttribute("contador", cartBooks.size());
                        //Manda la lista de libros que será usada en el carrito
                        request.getSession().setAttribute("listBooks", cartBooks);
                        request.getRequestDispatcher("bookServlet?accion=catalogo").forward(request, response);
                        break;
                    //Eliminar un libro del carrito    
                    case "eliminarCarrito":
                        //Obtiene el id que tiene el item dentro del carrito
                        int idElemento= Integer.parseInt(request.getParameter("idElemento"));
                        //Obtiene el id del libro que corresponde al item
                        int idLibro = Integer.parseInt(request.getParameter("id"));
                        //Bandera para determinar si el item tiene un libro
                        boolean tieneUnElemento = true;
                        //Se intancia un libro, buscándolo por el id del libro
                        Book bookToElim = (Book) library.getBookById(idLibro);
                        /*Ciclo para determinar si la cantidad de libros por 
                          elemento es mayor a uno */ 
                        for(Book bookAux:cartBooks){
                            if(bookToElim.getId().equals(bookAux.getId())){
                                //Si el libro está en la lista, comprueba la cantidad
                                if(bookAux.getCantidad()>1){
                                    //Resta la cantidad para simular que lo elimina
                                    bookAux.setCantidad(bookAux.getCantidad()-1);
                                    tieneUnElemento = false;
                                } else {
                                    tieneUnElemento = true;
                                }
                            }
                        }
                        //Si solo hay un libro en el item, lo borra de la lista
                        if(tieneUnElemento){
                            cartBooks.remove(idElemento);
                        }
                        //Manda la lista de libros y el contador
                        request.getSession().setAttribute("listBooks", cartBooks);
                        request.getSession().setAttribute("contador", cartBooks.size());
                        request.getRequestDispatcher("bookServlet?accion=carrito").forward(request, response);
                        break;
                    //Ir a la página del catálogo
                    default: 
                        //Mandar la lista de libros de la librería como parámetro
                        request.setAttribute("books", books);
                        request.getRequestDispatcher("/catalogo.jsp").forward(request, response);
                        break;
                }
            } else {
                    //Mandar la lista de libros como parámetro
                    request.setAttribute("books", books);
                    request.getRequestDispatcher("/catalogo.jsp").forward(request, response);
            }
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

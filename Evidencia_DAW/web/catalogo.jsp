<%-- 
    Document   : catalogo.jsp
    Created on : 23 mar. 2021, 22:34:59
    Author     : jesgu
--%>

<%@page import="java.util.List"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styles.css">
        <title>Catálogo - Evidencia</title>
    </head>
    <body>
        <%
            //Carga los parámetros del request y la sesión
            List <Book> books = (List<Book>) request.getAttribute("books");
            List <Book> listBooks = (List<Book>) request.getSession().getAttribute("listBooks");
        %>
        <!--BEGIN: Navbar-->
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <a class="navbar-brand">La Jesguiteca</a>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item active">
                <a class="nav-link" href="bookServlet?accion=catalogo">Catálogo <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="bookServlet?accion=carrito">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                    </svg>
                    <label class="mb-0">
                        (<%
                            //Condición para determinar el número de items en el carrito
                            if(request.getSession().getAttribute("contador")==null){
                                out.print("0");
                            } else{
                                out.print(request.getSession().getAttribute("contador"));
                            }
                        %>)
                    </label>
                    Carrito
                </a>
              </li>
              <%
                  String rolesito = (String) request.getSession().getAttribute("rol");
                    if( rolesito.equals("admin")){ %>
                    <li class="nav-item"><a class="nav-link" href="./usuarios.jsp">Usuarios</a></li>
                <%
                    }
                %>
            </ul>
          <div>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <%
                    if((String) request.getSession().getAttribute("rol") == "invitado"){ %>
                    <li class="nav-item"><a class="nav-link" href="./logIn.jsp">LogIn</a></li>
                <%
                    }else{       
                %>
                     <li class="nav-item"><a class="nav-link" href="./index.jsp">Cerrar Sesión</a></li>
                <%
                    }
                %>
                <li class="nav-item"><a class="nav-link" href="./registro.jsp">Registrarse</a></li>
            </ul> 
          </div> 
          </div>
                           
        </nav>
        <!--END: Navbar-->
        <!--BEGIN: Catálogo-->
        <div class="container cont">
            <h3 class="pt-8"><% out.print("Bienvenido " + request.getSession().getAttribute("username") + ","); %></h3>
            <h2 class="text-center pt-8 title">Catálogo</h2>
            <div class="row mt-4">  
                <%
                    //Ciclo para poner cada libro en una card
                    for(Book book:books){
                %>
                    <div class="col-sm-4">
                    <!--BEGIN: Card-->
                    <div class="card cat-card mt-3">
                        <div class="card-body cat-card-body text-center">
                            <img src="<%=book.getCover()%>" width="235" height="352">
                            <p class="book-cat-title mt-2">
                                <a class="book-redirect" href="bookServlet?accion=detalle&id=<%=book.getId()%>">
                                    <%=book.getTitle()%>
                                </a>
                            </p>
                            <p class="mt-2 mb-0">$<%=book.getPrice()%></p>
                        </div>
                        <div class="card-footer cat-card-footer text-center mt-3">
                            <a href="bookServlet?accion=agregarCarrito&id=<%=book.getId()%>" class="btn btn-outline-secondary">Agregar al carrito</a>
                            <a href="bookServlet?accion=detalle&id=<%=book.getId()%>" class="btn btn-outline-info">Ver más</a>
                        </div>
                    </div>
                    <!--END: Card-->
                    </div>
                <%}%>
            </div>
        </div>
        <!--END: Catálogo-->
        <!--BEGIN: Footer-->
        <footer class="mt-5">
           <p class="text-center pt-4">Creado por Juan Carlos Mora, Yerik Morales y Jesús Jiménez</p>
        </footer>
        <!--END: Navbar-->
        <!--Scripts de Bootstrap-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>

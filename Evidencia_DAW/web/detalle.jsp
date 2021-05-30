<%-- 
    Document   : detalle.jsp
    Created on : 24 mar. 2021, 0:19:08
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
        <title>Detalle</title>
    </head>
    <body>
        <%
            //Se obtiene el atributo del request
            Book book = (Book) request.getAttribute("book");
        %>
        <!--BEGIN: Navbar-->
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <a class="navbar-brand">La Jesguiteca</a>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="bookServlet?accion=catalogo">Catálogo</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="bookServlet?accion=carrito">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                    </svg>
                    <label class="mb-0">
                        (<%
                            //Ciclo para mostrar la cantidad de items en el carrito
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
            </ul>
          </div>
        </nav>
        <!--END Navbar-->
        <!--BEGIN: Detalle-->
        <div class="container cont detalle">
            <div class="row pt-8">
                <div class="col-sm-4">
                    <img src="<%=book.getCover()%>" width="350" height="525">
                </div>
                <div class="col-sm-8">
                    <div class="cat-card card">
                        <div class="card-header card-header-detalle">
                            <h2><%=book.getTitle()%></h2>
                        </div>
                        <div class="card-body card-body-detalle">
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="author">de <%=book.getAuthor()%></p>
                                    <p class="genero"><%=book.getDesc()%></p>                                    
                                </div>
                                <div class="col-md-6">
                                    <h2 class="float-right">$<%=book.getPrice()%></h2>
                                </div>
                                
                            </div>
                            <p class="text-justify"><%=book.getSinopsis()%></p>
                        </div>
                        <div class="card-footer cat-card-footer mt-2">
                            <a href="bookServlet?accion=agregarCarrito&id=<%=book.getId()%>" class="btn btn-outline-info float-right">Agregar al carrito</a>
                            <a href="bookServlet?accion=detalle&id=<%=book.getId()%>" class="mr-2 disabled btn btn-danger float-right">Pagar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--END Detalle-->
        <!--BEGIN: Footer-->
        <footer>
            <p class="text-center pt-4">Creado por Juan Carlos Mora, Yerik Morales y Jesús Jiménez</p>
        </footer> 
        <!--END: Footer-->
        <!--Scripts de Bootstrap-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>                
    </body>
</html>

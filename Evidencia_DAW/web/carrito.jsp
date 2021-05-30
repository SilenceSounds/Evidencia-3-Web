<%-- 
    Document   : carrito.jsp
    Created on : 24 mar. 2021, 0:19:21
    Author     : jesgu
--%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/styles.css">
        <title>Carrito - Evidencia</title>
    </head>
    <body>
        <%
            //Lista de elementos del carrito
            List <Book> cartBooks =(List<Book>) request.getSession().getAttribute("listBooks");
            //Atributos del elemento
            Double calcSubtotal= 0.0;
            String subtotal="0.00";
            int idElemento=0;
        %>
        <!--BEGIN: Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <a class="navbar-brand">La Jesguiteca</a>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="bookServlet?accion=catalogo">Catálogo</a>
              </li>
              <%
                    if(request.getSession().getAttribute("rol") == "admin"){ %>
                    <li class="nav-item"><a class="nav-link" href="./usuarios.jsp">Usuarios</a></li>
                <%
                    }
                %>
            </ul>
          </div>
          <div>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <%
                    if(request.getSession().getAttribute("rol") == "invitado"){ %>
                    <li class="nav-item"><a class="nav-link" href="./logIn.jsp">LogIn</a></li>
                <%
                    }else{
                        request.getSession().setAttribute("username", "Invitado");
                        request.getSession().setAttribute("rol", "Invitado");
                %>
                     <li class="nav-item"><a class="nav-link" href="./index.jsp">Cerrar Sesión</a></li>
                <%
                    }
                %>
                <li class="nav-item"><a class="nav-link" href="./registro.jsp">Registrarse</a></li>
            </ul> 
          </div> 
        </nav>
        <!--END: Navbar-->
        <!--BEGIN: Carrito-->
        <div class="container cont pt-8">
            <%
                //Si la lista de elementos no es nulo, agregará los elementos a la tabla
                if (cartBooks!=null){
             %>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th colspan="2">Producto</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>    
                            <tbody>
                            <%
                                //Ciclo para agregar los elementos a la lista
                                for(Book book: cartBooks){
                            %>
                            <!--BEGIN: Elemento-->
                            <tr>
                                <td>
                                    <img src="<%=book.getCover()%>" width="100" height="150">
                                </td>
                                <td class="align-middle">
                                    <div class="container text-center">
                                        <a class="book-redirect" href="bookServlet?accion=detalle&id=<%=book.getId()%>">
                                            <%=book.getTitle()%>
                                        </a>
                                    </div>
                                </td>
                                <td class="align-middle text-center">$<%=book.getPrice()%></td>
                                <td class="align-middle text-center"><%=book.getCantidad()%></td>
                                <td class="align-middle text-center">$<%=Double.parseDouble(book.getPrice()) * book.getCantidad()%></td>
                                <td class="align-middle text-center">
                                    <a class="eliminar align-middle" href="bookServlet?accion=eliminarCarrito&idElemento=<%=idElemento%>&id=<%=book.getId()%>">
                                        <svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                            <!--END Elemento-->
                            <%
                                //Acumulación del subtotal        
                                calcSubtotal+=(Double.parseDouble(book.getPrice())*book.getCantidad());
                                //Asignación del id del item
                                idElemento++;
                                    }
                                    //Formato para redondear el subtotal general del carrito
                                    subtotal = String.format("%.2f", calcSubtotal);
                             %>
                        </tbody>
                    </table>
                </div>
           
                <!--BEGIN: Card Compra-->            
                <div class="col-sm-4">
                    <div class="card">
                        <div class ="card-header">
                            <h3>Generar compra</h3>
                        </div>
                        <div class ="card-body">
                            <label>Subtotal:</label>
                            <input type="text" readonly="" placeholder="$<%=subtotal%>" class="form-control">
                            <label>Total a pagar:</label>
                            <input type="text" readonly="" placeholder="$<%=subtotal%>" class="form-control">
                        </div>
                        <div class ="card-footer">
                            <a class="btn btn-info btn-block">Pagar</a>
                        </div>
                    </div>
                </div>
                <!--END: Card Compra-->
             </div>
        </div>
         <!--END: Carrito-->
         <!--BEGIN: Footer-->
        <footer class="<%if(cartBooks!=null && cartBooks.size()>4){%>mt-4<%}%>">
            <p class="text-center pt-4">Creado por Juan Carlos Mora, Yerik Morales y Jesús Jiménez</p>
        </footer>
        <!--END: Carrito-->
                <% 
                    //En caso de que la lista se nula, deberá mostrar que el carrito está vacío
                    } else {
                %>
                <div class="contenedor">
                    <div class="unav-cart text-center">
                        <i class="bi bi-cart-x-fill"></i>
                        <h1 class="">El carrito está vacío</h1>
                    </div>
                </div>               
                <%}%>
        <!--Scripts de Bootstrap-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>                
    </body>
</html>

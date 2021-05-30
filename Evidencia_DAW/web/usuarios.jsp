<%-- 
    Document   : usuarios
    Created on : 3/05/2021, 10:23:18 PM
    Author     : juanc
--%>

<%@page import="connector.Connector"%>
<%@page import="java.util.List"%>
<%@page import="model.Book"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            Connector con = new Connector();
            String rolesito = (String) request.getSession().getAttribute("rol");
            System.out.println(rolesito);           
            
            if (!"admin".equals(rolesito)) {
        %>
        <meta http-equiv='refresh' content='0; URL=http://localhost:8080/Evidencia_DAW/bookServlet'>
        <%
            }
        %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styles.css">
        <title>Catálogo - Evidencia</title>
    </head>
    <body>
        <%
            //Carga los parámetros del request y la sesión
            List<Book> books = (List<Book>) request.getAttribute("books");
            List<Book> listBooks = (List<Book>) request.getSession().getAttribute("listBooks");
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
                                    if (request.getSession().getAttribute("contador") == null) {
                                        out.print("0");
                                    } else {
                                        out.print(request.getSession().getAttribute("contador"));
                                    }
                                %>)
                            </label>
                            Carrito
                        </a>
                    </li>
                    <%
                        if (request.getSession().getAttribute("rol") == "admin") { %>
                    <li class="nav-item"><a class="nav-link" href="./usuarios.jsp">Usuarios</a></li>
                        <%
                            }
                        %>
                </ul>
                <div>
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <%
                            if (request.getSession().getAttribute("rol") == "invitado") { %>
                        <li class="nav-item"><a class="nav-link" href="./logIn.jsp">LogIn</a></li>
                            <%
                            } else {
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
            </div>

        </nav>
        <!--END: Navbar-->
        <%
            if (request.getParameter("success") != "invalid") {
                out.print("<div class='alert alert-danger' role='alert'>No se pudo modificar</div>");
            }else{
                out.print("<div class='alert alert-success' role='alert'>Se modifico el usuario correctamente.</div>");
            }
        %>
        <div class="container cont">
            <h2 class="text-center pt-8 title">Usuarios</h2>
            <div class="accordion" id="accordionExample">
                <%
                    ResultSet rs = con.usuarios();

                    while (rs.next()) {
                        String username = (String) rs.getString("username");
                        String email = (String) rs.getString("email");
                        String password = (String) rs.getString("pass");
                        String rol = (String) rs.getString("rol");
                        String id = (String) rs.getString("id");
                %>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#<% out.print(username); %>" aria-expanded="true" aria-controls="<% out.print(username); %>">
                      </button>
                    </h2>
                    <div id="<% out.print(username); %>" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <form class="formulario navbar-dark " action="LogIn" method="post">
                            <h1><strong>Modificar Usuario</strong></h1>
                            <div class="row">
                              <div class="col-12">
                                  <label for="user">Usuario</label>
                                  <input class="form-control" type="text" name="user" value="<% out.print(username); %>" required>
                              </div>
                               <div class="col-12">
                                  <label for="email">Correo</label>
                                  <input class="form-control" type="text" name="email" value="<% out.print(email); %>" required>
                              </div>
                                <div class="col-12">
                                  <input class="form-control" type="hidden" name="accion" value="modificar">
                              </div>
                              <div class="col-12">
                                  <input class="form-control" type="hidden" name="id" value="<% out.print(id); %>">
                              </div>
                              <div class="col-12">
                                  <label for="password">Contraseña</label>
                                  <input class="form-control" type="text" name="password" value="<% out.print(password); %>" required>
                              </div>
                              <div class="col-12">
                                  <label for="rol">Contraseña</label>
                                  <input class="form-control" type="text" name="rol" value="<% out.print(rol); %>" required>
                              </div>
                            </div>
                            <input class="btn m-2" type="submit" name="enviar" value="Modificar">
                          </form>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

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

<%-- 
    Document   : registro
    Created on : 2/05/2021, 10:51:43 PM
    Author     : juanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/logIn.css">
    <title>Log In</title>
  </head>
  <body>
                  <% 
                    if(request.getParameter("success") != null){
                        out.print("<div class='alert alert-danger' role='alert'>Ese usuario ya esta ocupado, intenta nuevamente.</div>");
                    }
                  %>
    <center>
      <div class="padre">
        <form class="formulario navbar-dark bg-dark" action="LogIn" method="post">
          <h1><strong>Registrar Usuario</strong></h1>
          <div class="row">
            <div class="col-12">
                <label for="user">Usuario</label>
                <input class="form-control" type="text" name="user" required>
            </div>
             <div class="col-12">
                <label for="email">Correo</label>
                <input class="form-control" type="text" name="email" required>
            </div>
              <div class="col-12">
                <input class="form-control" type="hidden" name="accion" value="registro">
            </div>
            <div class="col-12">
                <label for="password">Contraseña</label>
                <input class="form-control" type="text" name="password" required>
            </div>
          </div>
          <input class="btn m-2" type="submit" name="enviar" value="Registrarse">
        </form>
      </div>
    </center>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>


  </body>
</html>


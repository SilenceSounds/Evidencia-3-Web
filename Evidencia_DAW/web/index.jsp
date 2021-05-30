<%-- 
    Document   : index
    Created on : 22 mar. 2021, 23:51:17
    Author     : jesgu
--%>

<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    request.getSession().setAttribute("username", "Invitado");
    request.getSession().setAttribute("rol", "invitado");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Etiqueta que redirige al servlet-->
        <meta http-equiv='refresh' content='0; URL=http://localhost:8080/Evidencia_DAW/bookServlet'>
        <title>Evidencia</title>
    </head>
    <body>
        <!--Este JSP está vacío porque su propósito es cargar la solicitud del servlet-->
    </body>
</html>

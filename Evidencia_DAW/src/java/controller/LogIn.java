/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connector.Connector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author juanc
 */
public class LogIn extends HttpServlet {

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
            //Acción para decidir el proceso a seguir
            String accion = request.getParameter("accion");
                        
            Connector conn = new Connector();
            
            Connection con = conn.getConnection();
            System.out.println(accion);
            out.print("se conectó");
            //Opción de registro
            if("registro".equals(accion)){
                //Agarrar parametro de usuario
                String username = request.getParameter("user");
                //Agarrar parametro de correo
                String email = request.getParameter("email");
                //Agarrar parametro de contraseña
                String password = request.getParameter("password");
                
                boolean success = conn.registrarUsuario(username, password, email);
                if(success == true){
                    request.getRequestDispatcher("/logIn.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("/registro.jsp?success=false").forward(request, response);
                }
            //Opción de log in
            }else if("modificar".equals(accion)){
                //Agarrar parametro de usuario
                String username = request.getParameter("user");
                //Agarrar parametro de correo
                String email = request.getParameter("email");
                //Agarrar parametro de contraseña
                String password = request.getParameter("password");
                //Agarrar parametro de rol
                String rol = request.getParameter("rol");
                //Agarrar parametro de id
                String id = request.getParameter("id");
                
                int success = conn.modificarUsuario(id, username, password, email, rol);
                
                if(success == 1){
                    request.getRequestDispatcher("/usuarios.jsp?success=valid").forward(request, response);
                }else{
                    request.getRequestDispatcher("/usuarios.jsp?success=invalid").forward(request, response);
                }
                
            }else{
                //Agarrar parametro de usuario
                String username = request.getParameter("user");
                //Agarrar parametro de contraseña
                String password = request.getParameter("password");
                out.print("antes del query");
                
                String query = "SELECT * FROM usuarios WHERE username = '" + username + "'";
                
                boolean success = false;
                
                try {
                    out.print("antes del statement");

                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(query);

                    if(rs.next()){
                        if(rs.getString("pass").equals(password)){
                            success = true;
                        }
                    }
                    
                    out.print("paso el query");
                    if(success == true){
                            request.getSession().setAttribute("username", rs.getString("username"));
                            request.getSession().setAttribute("rol", rs.getString("rol"));
                        //Redirección a catalogo
                        out.print("entraste");
                        request.getRequestDispatcher("bookServlet?accion=catalogo").forward(request, response);
                    //Si la contraseña no es correcta 
                    }else{
                        //Enviar a página de logIn
                        out.print("invalido");
                        request.getRequestDispatcher("/logIn.jsp?password=invalid").forward(request, response);
                    }    
                } catch (SQLException ex) {
                    Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
                    System.out.println("Falló el logIn");
                }
                
                
                //Si la contraseña es correcta
  
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

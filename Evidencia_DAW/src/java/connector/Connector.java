/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

//import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author juanc
 */
public class Connector {
    
    private static Connection conn;
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String user = "juanmora";
    private static final String password = "qwer";
    private static final String url = "jdbc:mysql://localhost:3306/bookstore";

    public Connector() {
        conn = null;
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            if(conn != null){
            }
        }catch (ClassNotFoundException | SQLException e){
            System.out.println("No se hizó la conexión");
        }
    }
    
    //Método para regresar una conexión
    public Connection getConnection(){
        return conn;
    }
    
    //Desconectarse de la base de datos
    public void desconectar(){
        conn = null;
        if(conn == null){
            System.out.println("Conexión terminada");
        }
    }
    
    public boolean registrarUsuario(String username, String password, String email){
        
        String query = "SELECT * FROM usuarios WHERE username = '" + username + "'";
        String queryRegistrar = "INSERT INTO usuarios(username,email,pass,rol) values (?,?,?,?)";
        
        boolean success = true;
                
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            System.out.println(query);
            if(!rs.next()){
                System.out.println("Lee la linea");
                PreparedStatement preparedStmt = conn.prepareStatement(queryRegistrar);
                preparedStmt.setString (1, username);
                preparedStmt.setString (2, email);
                preparedStmt.setString (3, password);
                preparedStmt.setString (4, "member");
                preparedStmt.execute();
            }else{
                success = false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }
    
    public ResultSet logIn(String username, String password){
        ResultSet rs = null;
        String query = "SELECT * FROM usuarios WHERE username = '" + username + "'";
        
        boolean success = false;
        
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery(query);
            
            if(!(rs.getString("pass").equals(password))){
                rs = null;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Falló el logIn");
        }
            
        return rs;
    }
    
    public ResultSet usuarios(){
        ResultSet rs = null;
        String query = "SELECT * FROM usuarios";
        
        Statement st;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }
    
    public int modificarUsuario(String id, String username, String password, String email, String rol){
        int success = 0;
            
        String query = "UPDATE usuarios SET username=?, pass=?, email=?, rol=? WHERE id=?";
        PreparedStatement stmt;
        try {
            stmt = conn.prepareStatement(query);
            stmt.setString(1,username);
            stmt.setString(2,password);
            stmt.setString(3,email);
            stmt.setString(4,rol);
            stmt.setString(5,id);           
            success = stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        return success;
    }
    
}

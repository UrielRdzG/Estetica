/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelado;

import java.sql.*;



/**
 *
 * @author uriel
 */
public class Operaciones {
    
    String driver;
    String url;
    String uss;
    String contra;
    
    public Operaciones(){
        driver="com.mysql.jdbc.Driver";
        url="jdbc:mysql://localhost:3306/estetica";
        uss="root";
        contra="n0m3l0";
    }
    
    public int loguear(String usuario,String contra){
        //System.out.println("usuario="+usuario+", Contra="+contra);
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int nivel=0;
        String sql="select rol_usu from usuarios where usu_usu='"+usuario+"' and pas_usu='"+contra+"'";
        try {
            Class.forName(this.driver);
            conn=DriverManager.getConnection(
                    this.url,
                    this.uss,
                    this.contra
            );
            pst=conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                nivel=rs.getInt(1);
                System.out.println(nivel);
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error "+e);
            System.out.println("No conecto");
        }
        return nivel;
    }
    
}

package testeconexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class Conexao {
    public static void main (String [] args) throws Exception{
    
        String url = "jdbc:mysql://localhost:3306/university"; //referencia o driver, local do banco, e base de dados
        String usuario = "root";
        String senha = "12345678Ab";
        
        Connection con = DriverManager.getConnection(url, usuario, senha);
        
        //cria Statement (menção)
            Statement stmt = (Statement) con.createStatement();

            // executa query e guarda em ResultSet
            ResultSet rs = stmt.executeQuery("select * from student");
            
            while(rs.next()){ //retorna boolean (true ou false)
                
                System.out.print(rs.getString("ID"));
                System.out.print("\t");
                System.out.print(rs.getString("name"));
                System.out.print("\t");
                System.out.println(rs.getString("dept_name"));

            }
            
            
            //fechando tudo
            rs.close();
            stmt.close();
            con.close();
    }
}

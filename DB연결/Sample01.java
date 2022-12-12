package DB연결;

import java.sql.Connection;
import java.sql.DriverManager;

public class Sample01 {

   public static void main(String[] args) {
      
      Connection conn = null; //연결해주는 커넥션 객체 생성
      
      try {
         /**아래 고정 코드(계속 사용 예정) */
         Class.forName("org.mariadb.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javadb", "root", "java1234");
         
   
         
      } catch (Exception e) {
         
      } finally {
         if(conn != null) {
            try {
               conn.close();
            } catch(Exception e) {

            }
         }
         
      }
      
      if(conn != null)
         System.out.println("데이터베이스 접속");

   }

}
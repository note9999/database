package 채팅;

import java.net.Socket;

public class SocketClient {

   public static void main(String[] args) {

      Socket socket = null;
      
      try {
         socket = new Socket("localhost", 5523);
         System.out.println("[연결 성공]");
      } catch(Exception e) {
         System.out.println("[연결 실패]");
      }
      
      if(socket != null) {
         RThread rt = new RThread(socket);
         SThread st = new SThread(socket);
         
         rt.start();
         st.start();
      }

   }

}
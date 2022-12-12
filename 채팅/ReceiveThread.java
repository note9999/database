package 채팅;

import java.io.DataInputStream;
import java.net.Socket;

public class ReceiveThread extends Thread {

   private final Socket socket;

   public ReceiveThread(Socket socket) {
      this.socket = socket;
   }
   
   public void run() {
      try {
         DataInputStream tmpbuf = new DataInputStream(socket.getInputStream());
         String message;
         
         while(true) {
            message = tmpbuf.readUTF();
            System.out.println("상대방 : " + message);
         }
      } catch(Exception e) {
         System.out.println("[연결 종료]");
      }
      
   }
   
   
}
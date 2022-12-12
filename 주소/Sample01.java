package 주소;

import java.net.InetAddress;

public class Sample01 {

	public static void main(String[] args) {

		// ip 주소 뽑아내기
		try {
			InetAddress local = InetAddress.getLocalHost();
			System.out.println("내컴퓨터 ip 주소: " + local.getHostAddress());

			InetAddress[] iaArr = InetAddress.getAllByName("www.naver.com");
			for (InetAddress r : iaArr) {
				System.out.println("네이버 ip 주소" + r.getHostAddress());
			}
		} catch (Exception e) {
		
		}
	}
}

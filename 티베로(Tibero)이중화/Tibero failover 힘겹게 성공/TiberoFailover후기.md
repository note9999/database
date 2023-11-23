회사에서 사용하고 있는 애플리케이션을 이중화 해보았다.

 
개발서버 ip 포트와 db를 백업한뒤 로컬 ip port를 이용해서 failover를 성공했다 .

 
https://technet.tmaxsoft.com/upload/download/online/tibero/pver-20160406-000002/tibero_jdbc/ch09.html 

위의 공식문서(tmax)를 참조하긴했지만 현재 프로퍼티가 Base 방식으로 조금 달라서 시행착오를 겪었다. 

Base 방식의 이중화는 다음과 같이 하면된다. 

Base.Driver=com.tmax.tibero.jdbc.TbDriver
Base.Url=jdbc:tibero:thin:@(description=(failover=on)(load_balance=on)(address_list=(address=(host=127.0.0.1)(port=8629))(address=(host=개발서버ip입력)(port=개발서버port입력)))(DATABASE_NAME=데이터베이스이름은 일치시켜줌)(아이디입력,비밀번호입력))
Base.Url=jdbc:tibero:thin:@(description=(load_balance=on)(address_list=(address=(host=개발서버ip입력)(port=8629))(address=(host=59.15.185.6)(port=7111)))(DATABASE_NAME=데이터베이스이름은 일치시켜줌))
Base.UserName=아이디입력
Base.Password=비밀번호입력

주의할 점은 로컬에서 DB를구성할때 데이터베이스이름과 아이디,비밀번호를 모두 개발서버 정보와 똑같이 맞추었다는 점이다. 다르게 하는 방법이 있을 수 있겠지만 여러 시행착오를 겪어본 결과 일치시는것이 가장 쉽게 Failover가 가능하다.  
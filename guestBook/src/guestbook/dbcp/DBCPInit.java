package guestbook.dbcp;

import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet	{
	@Override
	public void init() {
		getJDBCDriver();
		getConnectionPool();
		
	}
	
	public void getJDBCDriver() {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("JDBCDriver클래스가 없습니다"+e.getMessage(), e);
		}
	}
	
	public void getConnectionPool() {
		/* 커넥션 풀 생성 메소드(자카르타 dbcp이용)
		 * 1. jdbc커넥션 정보입력
		 * 2. jdbc커넥션 정보를 커넥션풀팩토리에 입력
		 * 3. 커넥션풀팩토리에서 유휴커넥션 어떻게 관리할건지, 최소/최대 커넥션 몇개로 유지할건지 설정
		 * 4. 커넥션풀팩토리 세팅정보를 토대로 커넥션풀 생성
		 * 5. 드라이버연결
		 */
		try {
		String jdbcDriverUrl = "jdbc:mysql://localhost:3306/study?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
		String dbid = "jspstudy";
		String dbpw = "jsppw";
		
		ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcDriverUrl, dbid, dbpw);
		
		PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
		poolableConnFactory.setValidationQuery("select 1");
		
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setMinEvictableIdleTimeMillis(1000L * 60L * 5L);
		poolConfig.setMinIdle(4);
		poolConfig.setMaxTotal(10);
		poolConfig.setTestWhileIdle(true);
		
		GenericObjectPool<PoolableConnection> objectPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
		poolableConnFactory.setPool(objectPool);
		
		Class.forName("org.apache.commons.dbcp2.PoolingDriver");
		PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
				driver.registerPool("study", objectPool);
		}catch(Exception e) {
			throw new RuntimeException("커넥션풀 드라이버 연결중 에러 발생"+e.getMessage(), e);
		}
		
		
	}

}

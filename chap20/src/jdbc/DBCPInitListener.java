package jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;


public class DBCPInitListener implements ServletContextListener{
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String poolConfig = 
				sce.getServletContext().getInitParameter("poolConfig");
		
		Properties prop = new Properties();
		try {
			prop.load(new StringReader(poolConfig));
		}catch(IOException e) {
			throw new RuntimeException(e);
		}
		loadJDBCDriver(prop);
		initConnectionPool(prop);
		
	}
	
	private void loadJDBCDriver(Properties prop) {
		String driverClass = prop.getProperty("jdbcDriver");
		try {
			Class.forName(driverClass);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("fail to load JDBC Driver" + e.getMessage(), e);
		}
	}
	
	private void initConnectionPool(Properties prop) {
		String jdbcUrl = prop.getProperty("jdbcUrl");
		String dbUser = prop.getProperty("dbUser");
		String dbpw = prop.getProperty("dbpw");
		String poolName = prop.getProperty("poolName");
		
		try {
		ConnectionFactory conn = new DriverManagerConnectionFactory(jdbcUrl, dbUser, dbpw);
		PoolableConnectionFactory poolConnFactory = new PoolableConnectionFactory(conn, null);
		poolConnFactory.setValidationQuery("select 1");
		
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5);
		poolConfig.setMinIdle(4);
		poolConfig.setMaxTotal(10);
		poolConfig.setTestWhileIdle(true);
		
		GenericObjectPool<PoolableConnection> ConnectionPool = new GenericObjectPool<>(poolConnFactory, poolConfig);
		poolConnFactory.setPool(ConnectionPool);
		
		Class.forName("org.apache.commons.dbcp2.PoolingDriver");
		PoolingDriver driver = (PoolingDriver) DriverManager.getConnection("jdbc:apache:commons:dbcp:");
		driver.registerPool(poolName, ConnectionPool);
		}catch(Exception e) {
			throw new RuntimeException("Connection Pool 생성 중 에러 발생"+e.getMessage(),e);
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {}

}

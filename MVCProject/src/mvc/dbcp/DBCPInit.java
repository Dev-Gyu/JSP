package mvc.dbcp;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

@WebListener
public class DBCPInit implements ServletContextListener{
	
	@Override
	public void contextInitialized(ServletContextEvent sce){
		String initParam = sce.getServletContext().getInitParameter("initParameter");
		Properties prop = new Properties();
		System.out.println(initParam);
		try {
			prop.load(new StringReader(initParam));
		}catch(IOException e) {
			System.out.println("prop.load중 예외발생" + e.getMessage());
		}
		
		getDriver(prop);
		createConnectionPool(prop);
	}
	
	private void getDriver(Properties prop){
		String jdbcDriver= prop.getProperty("jdbcDriver");
		try {
			Class.forName(jdbcDriver);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("jdbcDriver ClassNotFounded"+e.getMessage(), e);
		}
	}
	
	private void createConnectionPool(Properties prop) {
		String url = prop.getProperty("jdbcUrl");
		String dbUser = prop.getProperty("dbUser");
		String dbpw = prop.getProperty("dbpw");
		String dbName = prop.getProperty("dbName");
		String dbcpUrl = prop.getProperty("dbcpUrl");
		String dbcpDriver = prop.getProperty("dbcpDriver");
		System.out.println(dbcpDriver);
		try {
		ConnectionFactory conn = new DriverManagerConnectionFactory(url, dbUser, dbpw);
		PoolableConnectionFactory poolConnFactory = new PoolableConnectionFactory(conn, null);
		poolConnFactory.setValidationQuery("select 1");
		
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setMinEvictableIdleTimeMillis(1000L * 60L * 5L);
		poolConfig.setMaxTotal(10);
		poolConfig.setMinIdle(4);
		poolConfig.setTestWhileIdle(true);
		
		GenericObjectPool<PoolableConnection> objectPool = new GenericObjectPool<>(poolConnFactory, poolConfig);
		poolConnFactory.setPool(objectPool);
		
		Class.forName(dbcpDriver);
		PoolingDriver driver = (PoolingDriver)DriverManager.getDriver(dbcpUrl);
		driver.registerPool(dbName, objectPool);
		
		}catch(Exception e) {
			throw new RuntimeException("dbcp PoolingDriver ClassNotFounded" + e.getMessage(), e);
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}

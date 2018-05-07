import java.util.Properties;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

class CreateProperty
{
	public static void main(String[] agr) throws IOException
	{
		Properties pro=new Properties();
		pro.setProperty("dbName","com.mysql.jdbc.Driver");
		pro.setProperty("url","jdbc:mysql:///healthcare");
		pro.setProperty("user","root");
		pro.setProperty("pswd","super");
		FileOutputStream out=new FileOutputStream("Database.properties");
		pro.store(out,"By Sourabh");
		
	}
}
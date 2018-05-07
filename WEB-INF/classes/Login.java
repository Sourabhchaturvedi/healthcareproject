package pack;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.script.*;
import java.io.*;
import java.util.*;
public class Login extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		String Email=req.getParameter("email");
		out.print(Email +"<br>");
		out.print("<html><body><h2>Welcome to your homepage</h2></body></html>");
		ScriptEngine engine= new ScriptEngineManager().getEngineByName("nashorn");
		long enteringTime=System.currentTimeMillis();
		long outTime= enteringTime +5000;
		long sessionTime;
		do 
		{
			sessionTime=System.currentTimeMillis();
			
		}
		while(sessionTime!=outTime);
		out.print("<html><font-color=red>Your Sessiontime is about to die if you want to continue please press ok</font></html>");
		try
		{
			out.print("hi");
			engine.eval(new FileReader("C:\\Tomcat 7.0\\webapps\\jjss\\index.html"));
			Invocable invocable= (Invocable)engine;
			Object result =invocable.invokeFunction("time");
			out.println("hhh");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
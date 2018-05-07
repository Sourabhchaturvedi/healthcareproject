f<%@page import="java.sql.*,java.util.ArrayList,java.util.Collections,java.util.HashSet,java.util.Set,java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	
	public static Object getKeyFromValue(Map selector, Object value)
		{
			for (Object o : selector.keySet())
			{
				if (selector.get(o).equals(value))
				{
					return o;
				}
			}	
			return null;
		}
%>

<%
	String symptom1=request.getParameter("sym1");
	String symptom2=request.getParameter("sym2");
	String symptom3=request.getParameter("sym3");
	String symptom4=request.getParameter("sym4");
	if(symptom1.isEmpty()||symptom2.isEmpty()||symptom3.isEmpty()||symptom4.isEmpty())
	{
		out.print("Please fill All the Symptoms given below");
%>
		<jsp:include page="Help.jsp"/>
<%
	}
	else
	{
	ArrayList<String> s1=new ArrayList<String>();
	HashMap<String,Integer> last=new HashMap<String,Integer>();
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select name from diseases where symptoms like '%"+symptom1+"%'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			s1.add(rs.getString(1));
		}
		ps=con.prepareStatement("select name from diseases where symptoms like '%"+symptom2+"%'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			s1.add(rs.getString(1));
		}
		ps=con.prepareStatement("select name from diseases where symptoms like '%"+symptom3+"%'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			s1.add(rs.getString(1));
		}
		ps=con.prepareStatement("select name from diseases where symptoms like '%"+symptom4+"%'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			s1.add(rs.getString(1));
		}
		
		Set<String> uniqueSet = new HashSet<String>(s1);
		for (String temp : uniqueSet) 
		{
			//System.out.println(temp + ": " + Collections.frequency(list, temp));
			last.put(temp,Collections.frequency(s1, temp)); // To know elements with their repitition order in arraylist
		}
		int highest=Collections.max(last.values());
		Object en= getKeyFromValue(last,highest);
		out.println(en);
		
		
	}
	catch(NullPointerException e)
	{
		out.print(e);
	}
	catch(SQLException e)
	{
		out.print(e);
	}
	catch(Exception e)
	{
		out.print(e);
	}
	finally
	{
		con.close();
	}
	}
%>
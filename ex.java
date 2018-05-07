import java.util.Map;
import java.util.HashMap;
import java.util.Collections;
class ex
{
	public static void main(String agr[])
	{
		HashMap<String,Integer> s1=new HashMap<String,Integer>();
		String sa="jk";
		String sb="ja";
		s1.put(sa,12);
		s1.put(sb,14);
		s1.put("jd",44);
		s1.put("jl",143);
		s1.put("wiu",142);
		s1.put("wrt",24);
		System.out.print(s1);
		int np=(Collections.max(s1.values()));//to get maximum value stored on hashmap
		System.out.println(np);
		System.out.println(getKeyFromValue(s1,np));// to get index associated with max value
	}
	 public static Object getKeyFromValue(Map hm, Object value) {
    for (Object o : hm.keySet()) {
      if (hm.get(o).equals(value)) {
        return o;
      }
    }
    return null;
  }
}
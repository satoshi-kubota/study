import javassist.ClassPool;
import javassist.CtClass;
import javassist.CtMethod;

public class JavaasistSample {

	public static void main(String[] args) {
		
		try {
			
			ClassPool cp = ClassPool.getDefault();
			CtClass cc = cp.get("AopTarget");
			CtMethod cm = cc.getDeclaredMethod("exec");
			
			String startLog = 
					"{" +
					"	System.out.println(\"start:\" + new java.util.Date().toString());" +
					"	for(int i = 0 ; i < $args.length ; i++){" +
					"		System.out.println($args[i].toString());" +
					"	}" +
					"}";
					
			cm.insertBefore(startLog);
			
			String endLog = 
					"{" +
					"	System.out.println(\"end:\" + new java.util.Date().toString());" +
					"	System.out.println($_.toString());" +
					"}";
			
			cm.insertAfter(endLog,true);
			
			Class< ? > cls = cc.toClass(JavaasistSample.class.getClassLoader(),null);
			AopTarget target = (AopTarget) cls.newInstance();
			target.exec("hello world");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

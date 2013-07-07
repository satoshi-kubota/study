import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Database {

	public static void main(String[] args) {

		try{

			execPostgres();
			execMysql();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static void execPostgres() throws Exception{
		
		Class.forName("org.postgresql.Driver");
		
		try(Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/satoshi","postgres",null);
			PreparedStatement ps = con.prepareStatement("select * from testtb");
			ResultSet rs = ps.executeQuery();){
			
			while(rs.next()){
				System.out.println(String.format("[%s][%s][%s]", rs.getString(1),rs.getString(2),rs.getString(3)));
			}
		}
	}
		
	public static void execMysql() throws Exception{
		
		Class.forName("org.gjt.mm.mysql.Driver");
		
		try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/satoshi_db","postgres",null);
			PreparedStatement ps = con.prepareStatement("select * from testtb");
			ResultSet rs = ps.executeQuery();){
			
			while(rs.next()){
				System.out.println(String.format("[%s][%s][%s]", rs.getString(1),rs.getString(2),rs.getString(3)));
			}
		}
	}
}

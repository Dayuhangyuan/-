import java.sql.*;
public class jdbc {

	public static void main(String[] args) {
		
		try {
		      Class.forName("com.mysql.cj.jdbc.Driver");     //����MYSQL JDBC��������   
		      //Class.forName("org.gjt.mm.mysql.Driver");
		     System.out.println("Success loading Mysql Driver!");
		    }
		    catch (Exception e) {
		      System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		    }
		    try {
		      Connection connect = DriverManager.getConnection(
		          "jdbc:mysql://127.0.0.1:3306/sct?useSSL=true&userUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai","root","123456");//java�������д�������Լ��������
		           
		      System.out.println("Success connect Mysql server!");
		      Statement stmt = connect.createStatement();
		      ResultSet rs = stmt.executeQuery("select * from course");
		                  //user Ϊ�������ƣ�������MySQL��������show tables����ʾ
		while (rs.next()) {
		        System.out.println(rs.getString("name"));
		      }
		    }
		    catch (Exception e) {
		      System.out.print("get data error!");
		      e.printStackTrace();
		    }

	}

}

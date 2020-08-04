package finalProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Login {
	Connection conn;
	Statement st;
	PreparedStatement ps;
	ResultSet rs;
	
	public Login(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/201Final?user=root&password=mySQLgang&serverTimezone=UTC");
			st = conn.createStatement();			
		} catch(SQLException sqle){
			System.out.println ("SQLException: " + sqle.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ResetPassword(String username, String newPassword) throws SQLException{
		if(!VerifyUser(username)){
			System.out.println("User doesn't exist.");
			return;
		} else {
			st.executeUpdate("UPDATE UserInfo SET password='" + newPassword + "' WHERE username='" + username + "'");
		}
	}
	
	public void CreateUser(String email, String password) throws SQLException{
		if(VerifyUser(email)){
			System.out.println("User already exists.");
			return;
		}
		st.executeUpdate("INSERT INTO Users VALUES ('" + email +"','" +password + "')");
	}
	
	public boolean CheckPassword(String email,String password) throws SQLException{
		if(VerifyUser(email)){
			ps = conn.prepareStatement("SELECT * FROM Users WHERE email='" + email + "';");
			rs = ps.executeQuery();
			rs.next();
			if(rs.getString("password").equals(password)){
				return true;
			}
		}
		return false;
	}
	
	public boolean VerifyUser(String email) throws SQLException{				
		ps = conn.prepareStatement("SELECT EXISTS(SELECT * FROM Users WHERE email='" + email +"')");
		rs = ps.executeQuery();

		rs.next();
		if(rs.getBoolean(1)){
			return true;
		}
		return false;
	}
}

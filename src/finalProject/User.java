package finalProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class User {
	Connection conn;
	Statement st;
	PreparedStatement ps;
	ResultSet rs;

	public User() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/201Final?user=root&password=mySQLgang&serverTimezone=UTC");
			st = conn.createStatement();
		} catch (SQLException sqle) {
			System.out.println("SQLException: " + sqle.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<documentInfo> getProjects(String email) {
		ArrayList<documentInfo> arr = new ArrayList<documentInfo>();
		try {
			ps = conn.prepareStatement(
					"SELECT DocumentName, docs.documentID FROM Documents docs, UserToDocument ud WHERE ud.email='"
							+ email + "' AND ud.documentID = docs.documentID");
			rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString("docs.documentID");
				String name = rs.getString("documentName");
				documentInfo di = new documentInfo(id, name);
				arr.add(di);
			}
			return arr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}

	public void addNewProject(String email, String documentID, String documentName) {
		try {
			ps = conn.prepareStatement("INSERT INTO `201Final`.`Documents` (`documentID`, `DocumentName`) VALUES ('"
					+ documentID + "', '" + documentName + "')");
			ps.executeUpdate();

			ps = conn.prepareStatement("INSERT INTO `201Final`.`UserToDocument` (`email`, `DocumentID`) VALUES ('"
					+ email + "', '" + documentID + "')");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> getCollaborators(String email, String documentID) {
		ArrayList<String> arr = new ArrayList<String>();
		try {
			ps = conn.prepareStatement("SELECT email FROM UserToDocument WHERE DocumentID='" + documentID
					+ "' AND email!='" + email + "'");
			rs = ps.executeQuery();
			while (rs.next()) {
				String rsm = rs.getString("email");
				if (rsm != email) {
					arr.add(rsm);
				}
			}
			return arr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void removeUser(String email, String documentID) {
		try {
			ps = conn.prepareStatement("DELETE FROM `201Final`.`UserToDocument` WHERE (`email` = '" + email
					+ "') and (`DocumentID` = '" + documentID + "')");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addUser(String email, String documentID) {
		try {
			ps = conn.prepareStatement("INSERT INTO `201Final`.`UserToDocument` (`email`, `DocumentID`) VALUES ('"
					+ email + "', '" + documentID + "')");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

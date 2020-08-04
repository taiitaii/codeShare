package finalProject;

public class documentInfo {
	String documentID;
	String documentName;
	
	public documentInfo(String documentID, String documentName) {
		this.documentID = documentID;
		this.documentName = documentName;
	}
	
	public String getDocumentID() {
		return documentID;
	}
	
	public String getDocumentName() {
		return documentName;
	}
}
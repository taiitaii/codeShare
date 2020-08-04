package finalProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewProjectServlet
 */
@WebServlet("/NewProjectServlet")
public class NewProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	User userService = new User();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		System.out.println("Servlet Email: " + email);
		String documentName = request.getParameter("DocumentName");
		String documentID = request.getParameter("DocumentID");
		
		System.out.println("Servlet DN: " + documentName);
		System.out.println("Servlet DI: " + documentID);
		userService.addNewProject(email, documentID, documentName);
		
		String next = "/homePage.jsp";
		request.setAttribute("email", email);
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

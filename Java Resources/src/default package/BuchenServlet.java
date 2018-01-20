
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class BuchenServlet
 */
@WebServlet("/BuchenServlet")
public class BuchenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/MyTHIPool")
	DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuchenServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		Enumeration<String> sessionNames = session.getAttributeNames();
		
		while (sessionNames.hasMoreElements()) {
		    String param = sessionNames.nextElement();
		    if(param.equals("account")) {
		    	Account account = (Account) session.getAttribute("account");
		    	bucheAuto(id, account.getId());
				RequestDispatcher dispatcher = request.getRequestDispatcher("html/Konto.jsp");
				dispatcher.forward(request, response);
		    }
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Login.jsp");
		dispatcher.forward(request, response);
	}

	private void bucheAuto(String autoid, int mieterid) throws ServletException {

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("UPDATE autos SET mieterid = ? WHERE id = ? ")) {

			pstmt.setInt(1, mieterid);
			pstmt.setInt(2, Integer.parseInt(autoid));
			pstmt.executeUpdate();

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

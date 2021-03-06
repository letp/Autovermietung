import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class AutoSuchenServlet
 */
@WebServlet("/AutoSuchenServlet")
public class AutoSuchenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/MyTHIPool")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AutoSuchenServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Auto> autos = sucheAktuelleAutos();
		
		request.setAttribute("autos", autos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/AutoListeJson.jsp");
		dispatcher.forward(request, response);
	}

	private List<Auto> sucheAktuelleAutos() throws ServletException {
		List<Auto> autos = new ArrayList<Auto>();

		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM autos ORDER BY id DESC LIMIT 3")) {

			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {
					Auto auto = new Auto();

					auto.setId(rs.getInt("id"));
					auto.setMarke(rs.getString("marke"));
					auto.setModell(rs.getString("modell"));

					autos.add(auto);
				} // while rs.next()
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return autos;
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

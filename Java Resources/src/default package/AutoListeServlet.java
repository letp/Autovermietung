
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
 * Servlet implementation class AutoListeServlet
 */
@WebServlet("/AutoListeServlet")
public class AutoListeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/MyTHIPool")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AutoListeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Datenbank durchsuchen und Auto-Liste zurückgeben
		request.setCharacterEncoding("UTF-8");

		String marke = request.getParameter("marke");
		String modell = request.getParameter("modell");
		String tueren = request.getParameter("tueren");
		String karosserie = request.getParameter("karosserie");
		String schaltung = request.getParameter("schaltung");
		String leistung = request.getParameter("leistung");
		String kraftstoff = request.getParameter("kraftstoff");
		String sitzplaetze = request.getParameter("sitzplaetze");
		String erstzulassung = request.getParameter("sitzplaetze");
		String preis = request.getParameter("preis");
		String standort = request.getParameter("standort");

		List<Auto> autos = sucheAutos(marke, modell, tueren, karosserie, schaltung, leistung, kraftstoff, sitzplaetze,
				erstzulassung, preis, standort);
		// System.out.println("Auto-Liste-Size:" + autos.size());
		// System.out.println("Übergeben Marke: " + marke);
		// System.out.println("Autoliste an Stelle 0 Marke: " +
		// autos.get(0).getMarke());
		// System.out.println("Autoliste Modell: " + autos.get(0).getModell());
		System.out.println("AutoListeServlet: Kraftstoff: " + kraftstoff);

		request.setAttribute("autos", autos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/AutoListeJson.jsp");
		dispatcher.forward(request, response);
	}

	private List<Auto> sucheAutos(String marke, String modell, String tueren, String karosserie, String schaltung,
			String leistung, String kraftstoff, String sitzplaetze, String erstzulassung, String preis, String standort)
			throws ServletException {
		marke = (marke == null || marke == "") ? "%" : "%" + marke + "%";
		modell = (modell == null || modell == "") ? "%" : "%" + modell + "%";
		tueren = (tueren == null || tueren == "") ? "%" : "%" + tueren + "%";
		karosserie = (karosserie == null || karosserie == "") ? "%" : "%" + karosserie + "%";
		schaltung = (schaltung == null || schaltung == "") ? "%" : "%" + schaltung + "%";
		leistung = (leistung == null || leistung == "") ? "%" : "%" + leistung + "%";
		kraftstoff = (kraftstoff == null || kraftstoff == "") ? "%" : "%" + kraftstoff + "%";
		sitzplaetze = (sitzplaetze == null || sitzplaetze == "") ? "%" : "%" + sitzplaetze + "%";
		erstzulassung = (erstzulassung == null || erstzulassung == "") ? "%" : "%" + erstzulassung + "%";
		preis = (preis == null || preis == "") ? "%" : "%" + preis + "%";
		standort = (standort == null || standort == "") ? "%" : "%" + standort + "%";

		List<Auto> autos = new ArrayList<Auto>();

		System.out.println("Marke DB-Suche: " + marke);
		System.out.println("Modell DB-Suche: " + modell);

		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT * FROM autos WHERE marke LIKE ? AND modell LIKE ? AND karosserie LIKE ? AND getriebe LIKE ? AND ps LIKE ? AND kraftstoff LIKE ? AND sitzplaetze LIKE ? AND erstzulassung LIKE ? AND preis LIKE ? AND standort LIKE ? AND tueren LIKE ?")) {

			pstmt.setString(1, marke);
			pstmt.setString(2, modell);
			pstmt.setString(3, karosserie);
			pstmt.setString(4, schaltung);
			pstmt.setString(5, leistung);
			pstmt.setString(6, kraftstoff);
			pstmt.setString(7, sitzplaetze);
			pstmt.setString(8, erstzulassung);
			pstmt.setString(9, preis);
			pstmt.setString(10, standort);
			pstmt.setString(11, tueren);
			
			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {
					Auto auto = new Auto();

					auto.setId(rs.getInt("id"));
					auto.setMarke(rs.getString("marke"));
					auto.setModell(rs.getString("modell"));
					auto.setKraftstoff(rs.getString("kraftstoff"));
					auto.setGetriebe(rs.getString("getriebe"));
					auto.setKarosserie(rs.getString("karosserie"));
					auto.setPs(rs.getString("ps"));
					auto.setPreis(rs.getString("preis"));
					auto.setStandort(rs.getString("standort"));

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

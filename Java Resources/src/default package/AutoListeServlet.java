

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
       
	@Resource(lookup="jdbc/MyTHIPool")
	private DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutoListeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Datenbank durchsuchen und Auto-Liste zurückgeben
		request.setCharacterEncoding("UTF-8");
		
		String marke = request.getParameter("marke");
		String modell = request.getParameter("modell");
		String tueren = request.getParameter("tueren");
		String karosserie = request.getParameter("karosserie");
		String schaltung = request.getParameter("schaltung");
		String leistung = request.getParameter("leistung");
		
		List<Auto> autos = sucheAutos(marke, modell, tueren, karosserie, schaltung, leistung);
		//System.out.println("Auto-Liste-Size:" + autos.size());
		//System.out.println("Übergeben Marke: " + marke);
		//System.out.println("Autoliste an Stelle 0 Marke: " + autos.get(0).getMarke());
		//System.out.println("Autoliste Modell: " + autos.get(0).getModell());
		
		request.setAttribute("autos", autos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/AutoListeJson.jsp");
		dispatcher.forward(request, response);
	}
	
	private List<Auto> sucheAutos(String marke, String modell, String tueren, String karosserie, String schaltung, String leistung) throws ServletException {
		marke = (marke == null || marke == "") ? "%" : "%" + marke + "%";
		modell = (modell == null || modell == "") ? "%" : "%" + modell + "%";
		tueren = (tueren == null || tueren == "") ? "%" : "%" + tueren + "%";
		karosserie = (karosserie == null || karosserie == "") ? "%" : "%" + karosserie + "%";
		schaltung = (schaltung == null || schaltung == "") ? "%" : "%" + schaltung + "%";
		leistung = (leistung == null || leistung == "") ? "%" : "%" + leistung + "%";
		
		List<Auto> autos = new ArrayList<Auto>();
		
		System.out.println("Marke DB-Suche: " + marke);
		System.out.println("Modell DB-Suche: " + modell);
		
		// DB-Zugriff
		try (Connection con = ds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM thidb.auto WHERE Marke LIKE ? AND Modell LIKE ? AND Karroserie LIKE ? AND Getriebe LIKE ? AND PS > ?")) {

			pstmt.setString(1, marke);
			pstmt.setString(2, modell);
			pstmt.setString(3, karosserie);
			pstmt.setString(4, schaltung);
			pstmt.setString(5, leistung);
			try (ResultSet rs = pstmt.executeQuery()) {
			
				while (rs.next()) {
					Auto auto = new Auto();
					
					int id = rs.getInt("Fahrzeug_ID");
					auto.setId(id);
					
					String markeDB = rs.getString("Marke");
					auto.setMarke(markeDB);
					
					String modellDB = rs.getString("Modell");
					auto.setModell(modellDB);
					
					String kraftstoff = rs.getString("Kraftstoff");
					auto.setKraftstoff(kraftstoff);
					
					autos.add(auto);
				} // while rs.next()
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		return autos;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class CarViewServlet
 */
@WebServlet("/CarViewServlet")
public class CarViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(lookup="jdbc/MyTHIPool")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Auto-ID: " + request.getParameter("id"));
		String id = request.getParameter("id");
		Auto auto = findeAuto(id);
		
		System.out.println("CarViewServlet-Marke: " + auto.getMarke());
		
		request.setAttribute("auto", auto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/CarView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private Auto findeAuto(String id) throws ServletException {
		Auto auto = new Auto();
		// DB-Zugriff
		try (Connection con = ds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM autos WHERE id LIKE ? ")) {

			pstmt.setString(1, id);
		
			try (ResultSet rs = pstmt.executeQuery()) {
			
				while (rs.next()) {
			
					int idDB = rs.getInt("id");
					auto.setId(idDB);
					
					String markeDB = rs.getString("marke");
					auto.setMarke(markeDB);
					
					String modellDB = rs.getString("modell");
					auto.setModell(modellDB);
					
					String kraftstoff = rs.getString("kraftstoff");
					auto.setKraftstoff(kraftstoff);
					
					String getriebe = rs.getString("getriebe");
					auto.setGetriebe(getriebe);
					
					String karosserie = rs.getString("karosserie");
					auto.setKarosserie(karosserie);
					
					String erstzulassung = rs.getString("erstzulassung");
					auto.setErstzulassung(erstzulassung);
					
					String ps = rs.getString("ps");
					auto.setPs(ps);
					
					String tueren = rs.getString("tueren");
					auto.setTueren(tueren);
					
					String sitzplaetze = rs.getString("sitzplaetze");
					auto.setSitzplaetze(sitzplaetze);
					
					String preis = rs.getString("preis");
					auto.setPreis(preis);
					
					String standort = rs.getString("standort");
					auto.setStandort(standort);
				} // while rs.next()
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return auto;
	}
}

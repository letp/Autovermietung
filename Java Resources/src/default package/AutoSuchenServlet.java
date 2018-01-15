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
       
	@Resource(lookup="jdbc/MyTHIPool")
	private DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutoSuchenServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Auto> autos = new ArrayList<Auto>();
		String sqlRequest = "";
		
		String marke = request.getParameter("marke");
		
		sqlRequest = "Select * from thidb.auto where Marke = '" + marke + "'";
		
		try {
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sqlRequest);
			
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					Auto auto = new Auto();
					
					int id = rs.getInt("Fahrzeug_ID");
					auto.setId(id);
					
					auto.setMarke(marke);
					
					String modell = rs.getString("Modell");
					auto.setModell(modell);
					
					autos.add(auto);
				}
			}
		}catch(Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		request.setAttribute("autos", autos);
		RequestDispatcher disp = request.getRequestDispatcher("html/AutoListe.jsp");
		disp.forward(request, response);

	}
	
	//private List<Auto> sucheAutos(){}
}

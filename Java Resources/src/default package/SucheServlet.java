/** Peter */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
 * Servlet implementation class SucheServlet
 */
@WebServlet("/SucheServlet")
public class SucheServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   @Resource(lookup="jdbc/MyTHIPool")
	    DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SucheServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
        
        int suchanzahl = 0;
        ArrayList<Auto> autos = new ArrayList<Auto>();
        
           ResultSet rs = null;
           try(Connection con = ds.getConnection();
                   /**
                   *"SELECT * FROM bucher WHERE isbn LIKE %" +isbn + "% OR titel LIKE %" + titel +"%"
                   */
                   PreparedStatement p = con.prepareStatement("SELECT * FROM autos WHERE modell LIKE ?")){
                   p.setString(1, "%"+request.getParameter("suche1")+"%");
                   rs = p.executeQuery();
                   while(rs.next()){
                           Auto auto = new Auto();
                           auto.setModell(rs.getString("modell"));
                           auto.setMarke(rs.getString("marke"));
                           auto.setId(rs.getInt("id"));
                           
                           autos.add(auto);
                           suchanzahl = suchanzahl+1;
                   }
                   session.setAttribute("autos", autos);
                   
                   session.setAttribute("suchanzahl", suchanzahl);
                   final RequestDispatcher dispatcher = request.getRequestDispatcher("html/Suchergebnisse.jsp");
                   dispatcher.forward(request, response);
            } catch (Exception ex) {
                 // TODO Auto-generated catch block
                 throw new ServletException(ex.getMessage());
            }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
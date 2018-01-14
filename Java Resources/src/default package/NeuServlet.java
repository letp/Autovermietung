
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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class NeuServlet
 */
@WebServlet("/NeuServlet")
public class NeuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   @Resource(lookup="jdbc/MyTHIPool")
	    DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NeuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Auto neu = new Auto();
		HttpSession session = request.getSession();
		
		ResultSet rs = null;
        try(Connection con = ds.getConnection();
                
                PreparedStatement p = con.prepareStatement("SELECT * FROM autos")){
                               
                rs = p.executeQuery();
                if(rs.next()){
                    neu.setMarke("marke");
                    neu.setBezeichnung(rs.getString("bezeichnung"));
                    request.setAttribute("neu", neu);
                    session.setAttribute("neu", neu);
                    final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Startseite.jsp");
                    dispatcher.forward(request, response);
                }
                
                
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

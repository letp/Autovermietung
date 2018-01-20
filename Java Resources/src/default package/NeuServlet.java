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
		ArrayList<Auto> autos = new ArrayList<Auto>();
		
		ResultSet rs = null;
        try(Connection con = ds.getConnection();
                
                PreparedStatement p = con.prepareStatement("SELECT * FROM autos ORDER BY id DESC LIMIT 3")){
                               
                rs = p.executeQuery();
                while(rs.next()){
                    neu.setId(rs.getInt("id"));
                    neu.setMarke(rs.getString("marke"));
                    neu.setModell(rs.getString("modell"));
                    autos.add(neu);
                    
                }
                
                request.setAttribute("neu", autos);
                final RequestDispatcher dispatcher = request.getRequestDispatcher("html/NeuJson.jsp");
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
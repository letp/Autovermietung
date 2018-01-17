/** Peter */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    @Resource(lookup="jdbc/MyTHIPool")
    DataSource ds;
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    
	    Account form3 = new Account();
        
        form3.setName(request.getParameter("name"));
        form3.setVorname(request.getParameter("vorname"));
        form3.setEmail(request.getParameter("email"));
        form3.setStrasse(request.getParameter("strasse"));
        form3.setHnr(request.getParameter("hausnummer"));
        form3.setStadt(request.getParameter("stadt"));
        form3.setPlz(request.getParameter("plz"));
        form3.setPasswort(request.getParameter("passwort"));
        form3.setPasswort2(request.getParameter("passwort2"));
	    
        HttpSession session = request.getSession();
        Account form =  (Account) session.getAttribute("account");

        if (request.getParameter("passwort").equals(request.getParameter("passwort2"))){
            session.setAttribute("pwfalsch", 0);
            
           try(Connection con = ds.getConnection();
                   
                   PreparedStatement p = con.prepareStatement("UPDATE accounts SET name = ?, vorname = ?, strasse = ?, hausnummer = ?, stadt = ?, plz = ?, email = ?, passwort = ?, passwort2 = ? WHERE email = ?")){
                   
                   p.setString(1, form3.getName());
                   p.setString(2, form3.getVorname());
                   p.setString(3, form3.getStrasse());
                   p.setString(4, form3.getHnr());
                   p.setString(5, form3.getStadt());
                   p.setString(6, form3.getPlz());
                   p.setString(7, form3.getEmail());
                   p.setString(8, form3.getPasswort());
                   p.setString(9, form3.getPasswort2());
                   p.setString(10, form.getEmail());
                   
                   p.executeUpdate();
                   
                   final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Konto.jsp");
                   dispatcher.forward(request, response);
           } catch (Exception ex) {
               // TODO Auto-generated catch block
               throw new ServletException(ex.getMessage());
          }
          }else{
            session.setAttribute("pwfalsch", 1);
            final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Konto.jsp");
            dispatcher.forward(request, response);
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

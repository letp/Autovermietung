/** Peter */

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(lookup="jdbc/MyTHIPool")
    DataSource ds;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Eingaben von Login Feldern abholen
	    
	    HttpSession session = request.getSession();
	    Account form = new Account();
        
        form.setEmail(request.getParameter("email"));
        form.setPasswort(request.getParameter("passwort"));
        
	       ResultSet rs = null;
	       try(Connection con = ds.getConnection();
	               
	               PreparedStatement p = con.prepareStatement("SELECT * FROM accounts WHERE email = ? AND passwort = ?")){
	               
	               p.setString(1, request.getParameter("email"));
	               p.setString(2, request.getParameter("passwort"));
	               
	               rs = p.executeQuery();
	               if(rs.next()){
	                   form.setName(rs.getString("name"));
	                   form.setVorname(rs.getString("vorname"));
	                   form.setStrasse(rs.getString("strasse"));
	                   form.setHnr(rs.getString("hausnummer"));
	                   form.setStadt(rs.getString("stadt"));
	                   form.setPlz(rs.getString("postleitzahl"));
	                   session.setAttribute("account", form);
	                   session.setAttribute("logged", 1);
	                   final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Konto.jsp");
	                   dispatcher.forward(request, response);
	               }else{
	                   session.setAttribute("logfalsch", 1);
	                   final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Login.jsp");
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

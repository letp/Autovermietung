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
 * Servlet implementation class Account
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    @Resource(lookup="jdbc/MyTHIPool")
    DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Alle Angaben zu neuem Account holen
	    request.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();
	    ResultSet rs = null;
	    
	    Account form = new Account();
	    
		form.setName(request.getParameter("name"));
		form.setVorname(request.getParameter("vorname"));
		form.setEmail(request.getParameter("email"));
		form.setStrasse(request.getParameter("strasse"));
		form.setHnr(request.getParameter("hausnummer"));
		form.setStadt(request.getParameter("stadt"));
		form.setPlz(request.getParameter("postleitzahl"));
		form.setPasswort(request.getParameter("passwort"));
		form.setPasswort2(request.getParameter("passwort2"));
		
		if (request.getParameter("passwort").equals(request.getParameter("passwort2"))){
		    session.setAttribute("pwfalsch", 0);
		
		
		try(Connection con = ds.getConnection();
                
                PreparedStatement p = con.prepareStatement("SELECT * FROM accounts WHERE email = ?")){
                
                p.setString(1, request.getParameter("email"));
                
                rs = p.executeQuery();
                if(rs.next()){
                    session.setAttribute("vorhanden", 1);
                    final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Account.jsp");
                    dispatcher.forward(request, response);
                }else{
                    persist(form);
                    request.setAttribute("form", form);
                    session.setAttribute("vorhanden", 0);
                    session.setAttribute("account", form);
                    session.setAttribute("logged", 1);
                    final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Konto.jsp");
                    dispatcher.forward(request, response);
                }
                
                
         } catch (Exception ex) {
              // TODO Auto-generated catch block
              throw new ServletException(ex.getMessage());
         }
		}else{
            session.setAttribute("pwfalsch", 1);
            final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/Account.jsp");
            dispatcher.forward(request, response);
        }
		
	}
	
	private void persist(Account form) throws ServletException {
	    String[] generatedkeys = new String[] {"id"};

        try(Connection con = ds.getConnection();
        PreparedStatement p = con.prepareStatement("INSERT INTO accounts (name,vorname,email,strasse,hausnummer,stadt,plz,passwort,passwort2) VALUES (?,?,?,?,?,?,?,?,?)",generatedkeys)){
        
        p.setString(1, form.getName());
        p.setString(2, form.getVorname());
        p.setString(3, form.getEmail());
        p.setString(4, form.getStrasse());
        p.setString(5, form.getHnr());
        p.setString(6, form.getStadt());
        p.setString(7, form.getPlz());
        p.setString(8, form.getPasswort());
        p.setString(9, form.getPasswort2());
        p.executeUpdate();
        
        ResultSet rs = p.getGeneratedKeys();
        while(rs.next()){
            form.setId(rs.getLong(1));
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

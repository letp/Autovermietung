/**Peter */

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

/**
 * Servlet implementation class VermietenServlet
 */
@WebServlet("/VermietenServlet")
@MultipartConfig(maxFileSize=1024*1024*5,
                maxRequestSize=1024*1024*5*5,
                location= "/lars", 
                fileSizeThreshold=1024*1024)
public class VermietenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    @Resource(lookup="jdbc/MyTHIPool")
    DataSource ds;  
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VermietenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    HttpSession session = request.getSession();
	    ResultSet rs = null;
        Auto form = new Auto();
        String[] generatedkeys = new String[] {"id"};
        
        form.setBezeichnung(request.getParameter("bezeichnung"));
        form.setGetriebe(request.getParameter("getriebe"));
        form.setKraftstoff(request.getParameter("kraftstoff"));
        form.setMarke(request.getParameter("marke"));
        form.setPs(request.getParameter("ps"));
        form.setTopspeed(request.getParameter("speed"));
        form.setTyp(request.getParameter("typ"));
        Part file = request.getPart("image");
        
        //eingeloggten User holen für Anbieter id
        Account anbieter = (Account) session.getAttribute("account");
        
        try(Connection con = ds.getConnection();
                
                PreparedStatement p = con.prepareStatement("INSERT INTO autos (getriebe, marke, bezeichnung, typ, kraftstoff, ps, speed, vermieterID) VALUES (?,?,?,?,?,?,?,?)",generatedkeys)){
                
                p.setString(1, form.getGetriebe());
                p.setString(2, form.getMarke());
                p.setString(3, form.getBezeichnung());
                p.setString(4, form.getTyp());
                p.setString(5, form.getKraftstoff());
                p.setString(6, form.getPs());
                p.setString(7, form.getTopspeed());
                p.setInt(8, anbieter.getId());
                
                p.executeUpdate();

                rs = p.getGeneratedKeys();
                while(rs.next()){
                    form.setId(rs.getInt(1));
                }
                
                
                try (ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        InputStream in = file.getInputStream() ){
                    int i = 0;
                    while((i = in.read()) != -1){
                        baos.write(i);
                    }
                    form.setBild(baos.toByteArray());
                    baos.flush();
                } catch(IOException ex){
                    throw new ServletException(ex.getMessage());
                }
                ArrayList<Auto> autos = findAutos(form.getId());
                session.setAttribute("autos", autos);
                final RequestDispatcher dispatcher = request.getRequestDispatcher("home/html/CarView.html");
                dispatcher.forward(request, response);
                
         } catch (Exception ex) {
              // TODO Auto-generated catch block
              throw new ServletException(ex.getMessage());
         }
        

	}
	
	//Auto Liste in für mein Konto updaten
	   public ArrayList<Auto> findAutos(int id) throws ServletException{
	        ResultSet rs = null;
	        ArrayList<Auto> autos = new ArrayList<Auto>();
	        try(Connection con = ds.getConnection();
	                PreparedStatement p = con.prepareStatement("SELECT * FROM autos WHERE vermieterID = '"+id+"'")){
	                rs = p.executeQuery();
	                while(rs.next()){
	                        Auto auto = new Auto();
	                        auto.setBezeichnung(rs.getString("bezeichnung"));
	                        auto.setId(rs.getInt("id"));
	                        auto.setMarke(rs.getString("marke"));
	                        autos.add(auto);
	                }
	         } catch (Exception ex) {
	              // TODO Auto-generated catch block
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

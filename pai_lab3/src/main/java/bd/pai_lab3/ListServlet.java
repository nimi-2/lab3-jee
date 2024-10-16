package bd.pai_lab3;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ListServlet", urlPatterns = {"/ListServlet"})
public class ListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        String dbURL = "jdbc:mysql://localhost:3306/world?serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "";

        Class.forName("com.mysql.cj.jdbc.Driver");

        ArrayList<CountryBean> list = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             Statement st = conn.createStatement()) {
            String query = "SELECT Code, Name, Population, SurfaceArea FROM Country WHERE Continent = 'Europe'";
            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                CountryBean country = new CountryBean();
                country.setCode(rs.getString("Code"));
                country.setName(rs.getString("Name"));
                country.setPopulation(rs.getInt("Population"));
                country.setSurfaceArea(rs.getBigDecimal("SurfaceArea")); 
                list.add(country);
            }
            rs.close();
        }

        // Zapisz listę krajów w sesji
        HttpSession session = request.getSession();
        session.setAttribute("list", list);

        // Przekierowanie do strony JSP
        response.sendRedirect("countryList.jsp");
        //response.sendRedirect("country.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet that lists European countries with code and population";
    }
}

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;


public class ViewMyChartsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        request.getRequestDispatcher("viewMyCharts.jsp").forward(request, response);
    }
}
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/display-discount")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("txtDesc");
        float listPrice = Float.parseFloat(request.getParameter("txtPrice"));
        float discountPercent = Float.parseFloat(request.getParameter("txtDiscount"));
        double discountPrice = listPrice * discountPercent * 0.01;
        double discountAmount = listPrice - discountPrice;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<head> <title>display discount</title></head>");
        writer.println("<h1> Product Description :" + productDescription + "</h1>");
        writer.println("<h1> List Price :" + listPrice + "</h1>");
        writer.println("<h1> Discount Percent :" + discountPercent + "</h1>");
        writer.println("<h1> Discount Price :" + discountPrice + "</h1>");
        writer.println("<h1> Discount Amount :" + discountAmount + "</h1>");
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

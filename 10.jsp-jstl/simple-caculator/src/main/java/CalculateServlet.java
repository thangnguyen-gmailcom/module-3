import com.codegym.thang.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateServlet",urlPatterns = "/calculator")
public class CalculateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PrintWriter writer = response.getWriter();
        try {
            double first = Double.parseDouble(request.getParameter("first"));
            double second = Double.parseDouble(request.getParameter("second"));
            char operator = request.getParameter("operator").charAt(0);
            double result = Calculator.calculate(first,second,operator);
            writer.println(first + " " + operator + " " + second + " = " + result );

        }
        catch (Exception ex){
            writer.println("<html>");
            writer.println("<h1> Kiem tra lai o input </h1>");
            writer.println("<a href = " + "index.jsp" +">  quay lai</a> </html>");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

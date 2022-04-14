import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("fir_ope"));
        float secondOperand = Integer.parseInt(request.getParameter("sec_ope"));
        String operator = request.getParameter("operator");
        PrintWriter writer = response.getWriter();
        request.setAttribute("fir_ope", firstOperand);
        request.setAttribute("sec_ope", secondOperand);
        request.setAttribute("operator", operator);
        request.getRequestDispatcher("calculator.jsp").forward(request, response);
//        writer.println("<html>");
//        writer.println("<h1>Result:</h1>");
//        try{
//            float result = Calculator.calculate(firstOperand, secondOperand, operator);
//            writer.println(firstOperand + " " + operator + " " + secondOperand + " = " + result);
//        }catch (Exception ex){
//            writer.println("Error: " + ex.getMessage());
//        }
//        writer.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

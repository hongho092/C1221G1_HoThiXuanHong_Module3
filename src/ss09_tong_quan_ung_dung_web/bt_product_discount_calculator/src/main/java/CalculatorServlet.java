import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.println("hello2");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int price = Integer.parseInt(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int discountAmount = price * discount * (1/100);

        request.setAttribute("number1", price);
        request.setAttribute("number2", discount);
        request.setAttribute("number3", discountAmount);
        request.getRequestDispatcher("/discount.jsp").forward(request, response);

//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<h1>Price: " + price + "</h1>");
//        writer.println("<h1>Discount: " + discount + "</h1>");
//        writer.println("<h1>Discount Amount: " + discountAmount + "</h1>");
//        writer.println("</html>");
//        writer.println("hello1");
    }
}

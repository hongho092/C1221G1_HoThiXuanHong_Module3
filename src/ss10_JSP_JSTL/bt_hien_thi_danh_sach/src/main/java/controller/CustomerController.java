package controller;

import models.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController", "/"})
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Nguyễn A", "20/2/2000", "Đà Nẵng", "https://pngset.com/images/japan-woman-geisha-people-japanese-icon-geisha-icon-art-graphics-sport-sports-transparent-png-2864862.png"));
        customers.add(new Customer("Nguyễn B", "20/3/2000", "Quảng Nam", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEfjwpmeuv7P7KECLOXVuP2ccEEg6wv68a5Z4VxeOoEnhOFSLik018Ou2KPAPxQZH2qek&usqp=CAU"));
        customers.add(new Customer("Nguyễn C", "20/4/2000", "Quảng Ninh", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPL8za74LY3Ch_Z-vt-_lpdl8SFkCQPh0EuwCtkBoWrMECTB30mx8uWE-G5V5DH_6p5ZU&usqp=CAU"));
        customers.add(new Customer("Nguyễn D", "20/5/2000", "Quảng Ngãi", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSDpPie1CAvAw2B9Jr7Fpv5DsIbxyj8MH6bQZl6raAgzZa6aytu33Irsi9HzOfrSIX5_Q&usqp=CAU"));
        customers.add(new Customer("Nguyễn E", "20/6/2000", "Đà Nẵng", "https://static.mediacdn.vn/baochinhphu/image/sp-02.png"));
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

    }
}

package controller;

import dto.CustomerServiceNow;
import service.impl_service.customer.CustomerServiceImpl;
import service.interface_service.customer.CustomerService;
import service.interface_service.customer.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "CustomerServiceController", value = "/customer_service")
public class CustomerServiceController extends HttpServlet {

    private CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
//                goToCreate(request, response);
//                break;
            }
//            case "edit": {
//                findEmployeeById(request, response);
//                break;
//            }
//            case "delete": {
//                deleteEmployee(request, response);
//                break;
//            }
//            case "search": {
//                searchEmployee(request, response);
//                break;
//            }
            default: {
                goToList(request, response);
            }
        }
    }

    private void goToList(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerServiceNow> customerServiceNows = customerService.getListCSN();
        request.setAttribute("csn", customerServiceNows);
        try {
            request.getRequestDispatcher("view/customer_service_now/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        view/contract/create_contract_detail.jsp
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            request.setCharacterEncoding("UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "create": {
//                createEmployee(request, response);
//                break;
//            }
//            case "edit": {
//                infoEditEmployee(request, response);
//                break;
//            }
//        }
    }
}

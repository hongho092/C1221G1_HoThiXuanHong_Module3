package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServiceServlet", urlPatterns = {"/product", "/"})
public class ProductServiceServlet extends HttpServlet {

    private IProductService iProductService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("sgasbf");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//            case "show":
//                showProduct(request, response);
//                break;
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                List<Product> productList = iProductService.getList();
                request.setAttribute("products", productList);
                request.getRequestDispatcher("list.jsp").forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.deleteProduct(id);
        List<Product> productList = iProductService.getList();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.getById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.getById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("sgasbf");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "edit": {
                editProductPost(request, response);
                break;
            }
        }
    }

    private void editProductPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String made = request.getParameter("made");
        Product product = new Product(id, name, detail, quantity, made);
        iProductService.editProduct(product);
        request.setAttribute("mess", "Edit Success");
        request.getRequestDispatcher("edit.jsp").forward(request, response);

    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String made = request.getParameter("made");
        Product product = new Product(id, name, detail, quantity, made);
        iProductService.addProduct(product);
        request.setAttribute("mess", "Create Success");
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }


}

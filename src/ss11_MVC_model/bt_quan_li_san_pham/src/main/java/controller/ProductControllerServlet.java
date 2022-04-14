package controller;

import model.Product;
import service.IProduceService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductControllerServlet", urlPatterns = {"/product", "/"})
public class ProductControllerServlet extends HttpServlet {
    private IProduceService iProduceService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
//        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("create.jsp").forward(request, response);
                System.out.println("chuyen den trang tao");
            }
            case "update": {
                request.getRequestDispatcher("update.jsp").forward(request, response);
                System.out.println("chuyen den trang update");
            }
            default: {
                List<Product> products = iProduceService.getList();
                request.setAttribute("products", products);
                request.getRequestDispatcher("list.jsp").forward(request, response);
                System.out.println("day la trang hien thi");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("chuyen den doPost");
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                System.out.println("bat dau tao");
            }
            case "update": {
                updateProduct(request, response);
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = iProduceService.getList();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String color = request.getParameter("color");
        for (int i=0; i<products.size(); i++) {
            if (id == products.get(i).getId()) {
                products.remove(products.get(i));
                products.add(new Product(id, name, color));
            }
        }
        iProduceService.update(products);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String color = request.getParameter("color");
        Product product = new Product(id, name, color);
        iProduceService.save(product);
        List<Product> products = iProduceService.getList();
        System.out.println(products);

    }
}

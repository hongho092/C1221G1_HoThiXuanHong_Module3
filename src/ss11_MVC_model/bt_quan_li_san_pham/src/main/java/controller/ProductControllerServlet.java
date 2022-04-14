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
            case "delete": {
                request.getRequestDispatcher("delete.jsp").forward(request, response);
                System.out.println("chuyen den trang delete");
            }
            case "find": {
                request.getRequestDispatcher("find.jsp").forward(request, response);
                System.out.println("chuyen den trang find");
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
                System.out.println("bat dau update");
            }
            case "delete": {
                deleteProduct(request, response);
                System.out.println("bat dau delete");
            }case "find": {
                findProduct(request, response);
                System.out.println("bat dau find");
            }
        }
    }

    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = iProduceService.getList();
        int id = Integer.parseInt(request.getParameter("id"));
        for (int i=0; i<products.size(); i++) {
            if (id == products.get(i).getId()) {
                String name = products.get(i).getName();
                String color = products.get(i).getColor();
                request.setAttribute("show3", "Find Success");
                request.setAttribute("name", name);
                request.setAttribute("color", color);
                request.getRequestDispatcher("find.jsp").forward(request, response);
            }
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = iProduceService.getList();
        int id = Integer.parseInt(request.getParameter("id"));
        for (int i=0; i<products.size(); i++) {
            if (id == products.get(i).getId()) {
                products.remove(i);
                request.setAttribute("show2", "Delete Success");
                request.getRequestDispatcher("delete.jsp").forward(request, response);
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = iProduceService.getList();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String color = request.getParameter("color");
        for (int i=0; i<products.size(); i++) {
            if (id == products.get(i).getId()) {
                products.get(i).setName(name);
                products.get(i).setColor(color);
                request.setAttribute("show1", "Update Success");
                request.getRequestDispatcher("update.jsp").forward(request, response);
            }
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String color = request.getParameter("color");
        Product product = new Product(id, name, color);
        iProduceService.save(product);
        request.setAttribute("show", "Add Success");
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }
}

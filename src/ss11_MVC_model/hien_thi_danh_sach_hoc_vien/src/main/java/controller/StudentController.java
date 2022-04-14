package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", urlPatterns = {"/student", "/"})
public class StudentController extends HttpServlet {

    private IStudentService iStudentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("create.jsp").forward(request, response);
            }
            default: {
                List<Student> studentList = iStudentService.getListStudent();
                request.setAttribute("students", studentList);
                request.getRequestDispatcher("list.jsp").forward(request, response);
                System.out.println("đã in rồi");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }
}

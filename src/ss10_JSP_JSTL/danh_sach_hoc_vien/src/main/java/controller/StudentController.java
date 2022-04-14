package controller;

import models.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentController", value = "/StudentController")
public class StudentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Student> students = new ArrayList<>();
        students.add(new Student(234, "Nguyễn A", "20/02/2000", 0, 7));
        students.add(new Student(123, "Nguyễn B", "24/02/2000", 1, 8));
        students.add(new Student(456, "Nguyễn C", "23/02/2000", 1, 5));
        students.add(new Student(786, "Nguyễn D", "21/02/2000", 0, 3));
        students.add(new Student(960, "Nguyễn E", "25/02/2000", 1, 10));
        students.add(new Student(583, "Nguyễn F", "26/02/2000", 0, 6));
        request.setAttribute("students", students);
        request.getRequestDispatcher("student_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

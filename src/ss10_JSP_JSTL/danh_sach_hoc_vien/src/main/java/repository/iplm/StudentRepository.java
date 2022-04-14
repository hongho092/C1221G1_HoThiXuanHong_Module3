package repository.iplm;

import model.Student;
import repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<Student> students = new ArrayList<>();
    static {
        students.add(new Student(234, "Nguyễn A", "20/02/2000", 0, 7));
        students.add(new Student(123, "Nguyễn B", "24/02/2000", 1, 8));
        students.add(new Student(456, "Nguyễn C", "23/02/2000", 1, 5));
        students.add(new Student(786, "Nguyễn D", "21/02/2000", 0, 3));
        students.add(new Student(960, "Nguyễn E", "25/02/2000", 1, 10));
        students.add(new Student(583, "Nguyễn F", "26/02/2000", 0, 6));
    }

    @Override
    public List<Student> getList() {
        return students;
    }
}

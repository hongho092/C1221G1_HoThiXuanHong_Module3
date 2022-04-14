package service.iplm;

import model.Student;
import repository.IStudentRepository;
import repository.iplm.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository iStudentRepository = new StudentRepository();

    @Override
    public List<Student> getListStudent() {
        List<Student> studentList = iStudentRepository.getList();
        return studentList;
    }
}

use quan_li_sinh_vien;

select * from student;

select * from student where `status` = true;

select * from `subject` where credit < 10;

select student.student_id, student.student_name, class.class_name
from student join class on student.class_id = class.class_id
where class.class_name = "A1";

select student.student_id, student.student_name, `subject`.sub_name, mark.mark_id
from student join mark on student.student_id = mark.student_id join `subject` on mark.sub_id = `subject`.sub_id
where `subject`.sub_name = "CF";

use quan_li_sinh_vien;

select * from student where student.student_name like "H%";

select * from class where month(class.start_date) = 12;

select * from `subject` where `subject`.credit between 3 and 5;

set sql_safe_updates = 0;
update student
set student.class_id = 2 where student.student_name = "Hung";
set sql_safe_updates = 1;

select student.student_name, `subject`.sub_name, mark.mark 
from ((student join mark on student.student_id = mark.student_id)
             join `subject` on mark.sub_id = `subject`.sub_id)
order by mark, student_name;

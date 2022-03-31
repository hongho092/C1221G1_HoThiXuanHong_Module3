use quan_li_sinh_vien;

select count(student.student_id) as `Số lượng học viên`, student.address
from student
group by student.address;

select student.student_id, student.student_name, avg(mark.mark) as `Điểm trung bình` 
from student 
join mark on student.student_id = mark.student_id
group by student.student_name;

select student.student_id, student.student_name, avg(mark.mark) as `Điểm trung bình` 
from student 
join mark on student.student_id = mark.student_id
group by student.student_name
having `Điểm trung bình` > 15;

select student.student_id, student.student_name, avg(mark.mark) as `Điểm trung bình` 
from student 
join mark on student.student_id = mark.student_id
group by student.student_name
having `Điểm trung bình` >= all(select avg(mark.mark) from mark group by mark.student_id);


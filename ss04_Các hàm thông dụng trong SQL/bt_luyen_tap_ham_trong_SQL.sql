use quan_li_sinh_vien;

select * from `subject` 
having credit >= all (select max(credit) from `subject`);

select `subject`.sub_id, student.student_id, `subject`.sub_name, mark.mark
from mark
join `subject`
on mark.sub_id = `subject`.sub_id
join student
on student.student_id = mark.student_id
group by sub_id
having mark >= all (select max(mark) from mark);

select student.student_id, student.student_name, student.address, avg(mark)
from student
join mark
on student.student_id = mark.student_id
group by student_id
order by avg(mark);
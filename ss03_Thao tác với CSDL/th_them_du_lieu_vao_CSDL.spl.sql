use quan_li_sinh_vien;

insert into class (class_name, start_date, `status`) value 
("A1", "2008-12-20", 1),
("A2", "2008-12-22", 1),
("B3", current_date, 0);

insert into student value
(1, "Hung", "Ha noi", "0912113113", 1, 1);
insert into student (student_name, address, `status`, class_id) value
("Hoa", "Hai Phong", 1, 1);
insert into student (student_name, address, phone, `status`, class_id) value
("Manh", "HCM", 0123123123, 0, 2);

insert into `subject` (sub_name, credit, `status`) value
("CF", 5, 1),
("C", 6, 1),
("HDJ", 5, 1),
("RDBMS", 10, 1);

insert into mark (sub_id, student_id, mark, exam_times) value
(1, 1, 8, 1),
(3, 2, 10, 2),
(2, 3, 12, 1);


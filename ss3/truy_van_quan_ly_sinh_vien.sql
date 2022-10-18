use quan_ly_sinh_vien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’--
select * 
from student
 where student_name  like 'h%';
 
 -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.--
 select * 
 from class where month(start_date) = 12;
 
 -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5 --
 select * 
 from `subject` where credit between 3 and 5;
 
 -- Thay đổi mã lớp(class_id) của sinh viên có tên ‘Hung’ là 2. --
 SET SQL_SAFE_UPDATES = 0;

 update student
 set class_id = 2
 where student_name = 'Hung';
 
  select * 
 from student;
 
 -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần. --
 select student.student_name,`subject`.sub_name,mark.mark 
 from mark
 join student on student.student_id = mark.student_id
 join `subject` on `subject`.sub_id = mark.sub_id
 order by mark.mark desc,
 student.student_name asc;
 
 -- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
 select *
 from `subject` s 
 where s.credit = (
 select max(credit)
 from `subject`);
 
 -- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select *, max(m.mark ) as max_m
from mark m
join `subject` s on m.sub_id = s.sub_id;


 -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
 select *,avg(mark) as diem_trung_binh
 from student s
 left join mark m on s.student_id = m.student_id
 group by s.student_id
 order by diem_trung_binh desc;
 
 
 


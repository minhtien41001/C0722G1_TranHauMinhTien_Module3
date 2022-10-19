use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from `subject`
where credit = (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.*, m.mark
from `subject` s join mark m on s.subject_id = m.subject_id
where m.mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần.
select st.*, avg(m.mark) as avg_mark
from student st join mark m on st.student_id = m.student_id
group by student_id
order by avg_mark desc;
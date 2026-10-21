USE QuanLySinhVien;

-- 1. Hiển thị tất cả sinh viên có tên bắt đầu bằng ký tự 'h'
SELECT * 
FROM Student 
WHERE StudentName LIKE 'h%';

-- 2. Hiển thị thông tin các lớp học bắt đầu vào tháng 12
SELECT * 
FROM Class 
WHERE MONTH(StartDate) = 12;

-- 3. Hiển thị các môn học có credit trong khoảng từ 3 đến 5
SELECT * 
FROM Subject 
WHERE Credit BETWEEN 3 AND 5;

-- 4. Thay đổi mã lớp (ClassID) của sinh viên có tên 'Hung' thành 2
SET SQL_SAFE_UPDATES = 0; -- Tắt chế độ an toàn để cho phép UPDATE theo tên

UPDATE Student 
SET ClassID = 2 
WHERE StudentName = 'Hung';

SET SQL_SAFE_UPDATES = 1; -- Bật lại chế độ an toàn

-- 5. Hiển thị StudentName, SubName, Mark (sắp xếp điểm giảm dần, tên tăng dần)
SELECT S.StudentName, Sub.SubName, M.Mark
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
JOIN Subject Sub ON M.SubId = Sub.SubId
ORDER BY M.Mark DESC, S.StudentName ASC;
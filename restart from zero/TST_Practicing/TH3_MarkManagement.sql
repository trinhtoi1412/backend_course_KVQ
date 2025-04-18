create table Students(
    StudentID varchar(12) not null primary key,
    StudentName varchar(25) not null ,
    DateofBirth date not null ,
    Email varchar(40),
    Phone varchar(12),
    Class varchar(10)
);

create table Subjects(
    SubjectID varchar(10) not null primary key ,
    SubjectName varchar(25) not null
);

create table Mark(
    StudentID varchar(12),
    SubjectID varchar(10),
    Theory int,
    Practical int,
    Date date,
    constraint pri_key primary key (StudentID, SubjectID),
    foreign key (StudentID) references Students(StudentID),
    foreign key (SubjectID) references Subjects(SubjectID)
);

insert into Students
values
('AV0807005', 'Mai Trung Hiếu', '1989-10-11', 'trunghieu@yahoo.com', '0904115116', 'AV1'),
('AV0807006', 'Nguyễn Quý Hùng', '1988-12-2', 'quyhung@yahoo.com', '0955667787', 'AV2'),
('AV0807007', 'Hồ Đắc Quỳnh', '1990-1-2', 'dachuynh@yahoo.com', '0988574747', 'AV2'),
('AV0807009', 'An Đăng Khuê', '1986-3-6', 'dangkhue@yahoo.com', '0986757463', 'AV1'),
('AV0807010', 'Nguyễn T. Tuyết Lan', '1989-7-12', 'tuyetlan@yahoo.com', '0983310342', 'AV2'),
('AV0807011', 'Đinh Long Phụng', '1990-12-2', 'phunglong@yahoo.com', '', 'AV1'),
('AV0807012', 'Nguyễn Tuấn Nam', '1990-3-2', 'trunghieu@yahoo.com', '', 'AV1');

insert into Subjects
values
('S001', 'SQL'),
('S002', 'Java Simplefield'),
('S003', 'Active Server Page');

insert into Mark
values
('AV0807005', 'S001', 8, 25,'2008-5-6'),
('AV0807006', 'S002', 16, 30,'2008-5-6'),
('AV0807007', 'S001', 10, 25,'2008-5-6'),
('AV0807009', 'S003', 7, 13,'2008-5-6'),
('AV0807010', 'S003', 9, 16,'2008-5-6'),
('AV0807011', 'S002', 8, 30,'2008-5-6'),
('AV0807012', 'S001', 7, 31,'2008-5-6'),
('AV0807005', 'S002', 12, 11,'2008-6-6'),
('AV0807005', 'S003', 11, 20,'2008-6-6'),
('AV0807010', 'S001', 7, 6,'2008-6-6');

--câu 1: hiển thị nội dung bảng Students
select * from Students;

update Students
set Phone = '0969799153'
where StudentID = 'AV0807011';

--câu 2: hiển thị nội dung sinh viên lớp AV1
select * from Students
where Class = 'AV1';

--câu 3: chuyển sv AV0807012 sang lớp AV2
update Students
set Class = 'AV2'
where StudentID = 'AV0807012';

-- câu 4: tính tổng số sv từng lớp
select Class,
       count(*) as "total_student" from Students group by Class;

-- câu 5: hiển thị danh sách sinh viên lớp AV2 tăng dần theo tên
select * from Students
where Class = 'AV2'
order by StudentName;

-- câu 6: ds sv môn s001 có theory<10 thi ngày 6/5
select * from Students
where StudentID in(
    select Mark.StudentID from Mark where SubjectID = 'S001' and Theory < 10 and Date = '2008-5-6'
    );

--câu 7: tổng số sinh viên môn s001 theory<10
select count(*) as Total_student_fail_S001 from Mark
where SubjectID = 'S001' and Theory < 10;

-- câu 8: ds sv lớp AV1 sinh sau ngày 1/1/1980
select * from Students
where Class = 'AV1' and DateofBirth > '1980-1-1';

-- câu 9: xóa sv mã AV0807011
delete from Mark
where StudentID = 'AV0807011';
delete from Students
where StudentID = 'AV0807011';

--câu 10: ds sv S001 ngày 6/5 gồm StuID, StuName, SubName, Theory, Prac, Date
select Students.StudentID, StudentName, SubjectName, Theory, Practical, Date
from Students
    inner join Mark on Students.StudentID = Mark.StudentID
    inner join Subjects on Mark.SubjectID = Subjects.SubjectID
where Mark.SubjectID = 'S001' and Mark.Date = '2008-5-6';

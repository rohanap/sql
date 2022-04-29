-- Instead of update triggers - Part 46

select * from Department;


CREATE TABLE Employee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
);


CREATE TABLE Department
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)


Insert into Department values (1,'IT');
Insert into Department values (2,'Payroll');
Insert into Department values (3,'HR');
Insert into Department values (4,'Admin');


Insert into Employee values (1,'John', 'Male', 3);
Insert into Employee values (2,'Mike', 'Male', 2);
Insert into Employee values (3,'Pam', 'Female', 1);
Insert into Employee values (4,'Todd', 'Male', 4);
Insert into Employee values (5,'Sara', 'Female', 1);
Insert into Employee values (6,'Ben', 'Male', 3);


Update Department set DeptName = 'HR' where DeptId = 3;

CREATE Trigger tr_vWEmployeeDetails_InsteadOfUpdate
on vWEmployeeDetails
instead of update
as
Begin
 -- if EmployeeId is updated
 if(Update(Id))
 Begin
  Raiserror('Id cannot be changed', 16, 1)
  Return
 End
 
 -- If DeptName is updated
 if(Update(DeptName)) 
 Begin
  Declare @DeptId int

  Select @DeptId = DeptId
  from Department
  join inserted
  on inserted.DeptName = Department.DeptName
  
  if(@DeptId is NULL )
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  
  Update Employee set DepartmentId = @DeptId
  from inserted
  join Employee
  on Employee.Id = inserted.id
 End
 
 -- If gender is updated
 if(Update(Gender))
 Begin
  Update Employee set Gender = inserted.Gender
  from inserted
  join Employee
  on Employee.Id = inserted.id
 End
 
 -- If Name is updated
 if(Update(Name))
 Begin
  Update Employee set Name = inserted.Name
  from inserted
  join Employee
  on Employee.Id = inserted.id
 End
End;


SELECT * FROM vWEmployeeDetails;

Update vWEmployeeDetails
Set Name = 'Emma', DeptName = 'IT'
WHERE Id= 8;

Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1;

Update vWEmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
where Id = 1;
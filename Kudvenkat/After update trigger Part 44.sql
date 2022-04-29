-- After update trigger - Part 44

Create trigger tr_tblEmployee_ForUpdate
on Employee
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End;

SELECT * FROM Employee;

Update Employee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id = 4;

Alter trigger tr_tblEmployee_ForUpdate
on Employee
for Update
as
Begin
      -- Declare variables to hold old and updated data

      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldSalary int, @NewSalary int
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @OldDeptId int, @NewDeptId int

      -- Variable to build the audit string
      Declare @AuditString nvarchar(1000)

      -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted

 
      -- Loop thru the records in temp table
      While(Exists(Select Id from #TempTable))
      Begin
     
	 --Initialize the audit string to empty string
       Set @AuditString = ''

     -- Select first row data from temp table
            Select Top 1 @Id = Id, @NewName = Name, 
            @NewGender = Gender, @NewSalary = Salary,
            @NewDeptId = DepartmentId
            from #TempTable
     
	 -- Select the corresponding row from deleted table
            Select @OldName = Name, @OldGender = Gender, 
            @OldSalary = Salary, @OldDeptId = DepartmentId
            from deleted where Id = @Id  
			
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
            if(@OldSalary <> @NewSalary)
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
                  
            if(@OldDeptId <> @NewDeptId)
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))

				  insert into tblEmployeeAudit values(@AuditString)
				  
				  -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Id = @Id
      End
End


Update Employee set Name = 'Tods', Salary = 4000, 
Gender = 'Male' where Id = 4;

SELECT * FROM tblEmployeeAudit;


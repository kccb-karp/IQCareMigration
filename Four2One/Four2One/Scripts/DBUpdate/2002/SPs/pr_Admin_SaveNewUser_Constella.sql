

/****** Object:  StoredProcedure [dbo].[Pr_Admin_SaveNewUser_Constella]    Script Date: 8/29/2018 10:08:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Pr_Admin_SaveNewUser_Constella]              
              
@fname varchar(50),              
@lname varchar(50),              
@username varchar(20),              
@password varchar(50),
@EmpId int,              
@userid int              
              
as              
              
begin              
    if exists(select userid from mst_user where username = @username) begin    
          Raiserror('Duplication error: The username is already taken',16,1);            
          return              
     end    
	If (@EmpId > 0 And Exists(Select 1 From Mst_User U Where U.EmployeeId = @EmpId  And U.DeleteFlag = 0 And (@EmpId Is Not Null Or @EmpId > 0))) Begin
	Raiserror('Duplication: The employee is already linked to another user',16,1);
	Return;
	End         
	Insert Into mst_user (
		userlastname,
		userfirstname,
		username,
		password,
		EmployeeId,
		deleteflag,
		operatorid,
		createdate)
	Values (
		@lname,
		@fname,
		@username,
		@password,
		@EmpId,
		0,
		@userid,
		getdate() )                    
              
	select scope_identity()        
end

GO



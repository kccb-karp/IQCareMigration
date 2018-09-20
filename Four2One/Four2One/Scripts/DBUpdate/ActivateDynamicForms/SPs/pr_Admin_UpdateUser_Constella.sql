

/****** Object:  StoredProcedure [dbo].[pr_Admin_UpdateUser_Constella]    Script Date: 8/29/2018 10:14:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[pr_Admin_UpdateUser_Constella]  
(  
 @UserLastName varchar(50),  
 @UserFirstName varchar(50),  
 @username varchar(50),  
 @Password varchar(50), 
 @EmpId int, 
 @OperatorID int,  
 @UserID int  
)  
AS  
  
begin


If (@EmpId > 0 And Exists(Select 1 From Mst_User U Where U.EmployeeId = @EmpId And userId<> @UserId And U.DeleteFlag = 0 And (@EmpId Is Not Null Or @EmpId > 0))) Begin

	Raiserror('Duplication: The employee is already linked to another user',16,1);
	Return;

End

Update [mst_User] Set
	[UserLastName] = @UserLastName,
	[UserFirstName] = @UserFirstName,
	[UserName] = @username,
	[Password] = @Password,
	[EmployeeId] = @EmpId,
	[OperatorID] = @OperatorID,
	[UpdateDate] = getdate()
Where [UserID] = @UserID
And [DeleteFlag] = 0

End
GO



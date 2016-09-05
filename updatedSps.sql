Create PROCEDURE [dbo].[spn_Inv_GetInvEquipmentDetail]
(
		@ID int
	)
AS
 
select InvEquipment.*
from dbo.InvEquipment
where ID=@ID

ALTER PROCEDURE [dbo].[spn_Inv_GetEquipmentList]
(
		@FacilityNum varchar(50)
	)
AS
 
select InvEquipment.*
from dbo.InvEquipment
where ParentFacility#=@FacilityNum
and Status = 'Active'
order by EquipmentSerialNo

Create PROCEDURE [dbo].[spn_Inv_DeactivateInvEquipment]
(
		@ID int,
		@UserName varchar(50),
		@Res int OUTPUT		
	)
AS

Begin

	Set @Res = 0

	UPDATE dbo.InvEquipment 
	SET	Status='Inactive', ModifiedDate=getdate(), ModifiedBy=@UserName
	WHERE ID=@ID
	if @@error<> 0 GOTO E_Error                                      	
 return
    
	
E_Error:
    set @Res=@@error
    return	
End


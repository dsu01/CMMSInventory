USE [msDATA]
GO
/****** Object:  StoredProcedure [dbo].[spn_inv_deleteEquipmentAttachment]    Script Date: 9/18/2016 4:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter  PROCEDURE [dbo].[spn_inv_deleteEquipmentAttachment]
	(
		@attachmentSysId int,		-- required
		@Res int OUTPUT			
	)
AS
Begin
declare @EquipmentGroup as varchar(50)
declare @EquipmentSystem as varchar(50)

Set @Res = 0

	/* initially, check key fields. If null then, return -1  */	
	if @attachmentSysId is null
	Begin
		set @Res=-1
		return
	End

	delete from InvEquipmentAttachment where ID = @attachmentSysId				
			
	if @@error<> 0 GOTO E_Error
                                      			
	return	
	
E_Error:
    set @Res=@@error
    return	
End


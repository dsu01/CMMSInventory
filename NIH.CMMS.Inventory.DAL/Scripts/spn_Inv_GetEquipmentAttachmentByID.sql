USE [msDATA]
GO
/****** Object:  StoredProcedure [dbo].[spn_Inv_GetEquipmentAttachmentByID]    Script Date: 9/18/2016 10:00:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

alter PROCEDURE [dbo].[spn_Inv_GetEquipmentAttachmentByID]
(
		@attachmentSysId int
	)
AS
 
select * from dbo.InvEquipmentAttachment
where ID = @attachmentSysId







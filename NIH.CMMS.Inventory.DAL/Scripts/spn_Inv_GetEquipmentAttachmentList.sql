USE [msDATA]
GO
/****** Object:  StoredProcedure [dbo].[spn_Inv_GetEquipmentAttachmentList]    Script Date: 9/18/2016 10:00:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

alter PROCEDURE [dbo].[spn_Inv_GetEquipmentAttachmentList]
(
		@equipmentSysId int
	)
AS
 
select * from dbo.InvEquipmentAttachment
where InvEquipmentID = @equipmentSysId and IsActive = 1
order by Title






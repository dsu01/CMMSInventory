USE [msDATA]
GO

CREATE TABLE [dbo].[InvFacilityAttachment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvFacilityID] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[ContentType] [nvarchar](200) NULL,
	[Data] [varbinary](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[InvFacilityAttachment] ADD  CONSTRAINT [DF_InvFacilityAttachment_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[InvFacilityAttachment] ADD  CONSTRAINT [DF_InvFacilityAttachment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[InvFacilityAttachment]  WITH CHECK ADD  CONSTRAINT [FK_InvFacilityAttachment_InvFacility] FOREIGN KEY([InvFacilityID])
REFERENCES [dbo].[InvFacility] ([ID])
GO

ALTER TABLE [dbo].[InvFacilityAttachment] CHECK CONSTRAINT [FK_InvFacilityAttachment_InvFacility]
GO


CREATE TABLE [dbo].[InvEquipmentAttachment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvEquipmentID] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[ContentType] [nvarchar](200) NULL,
	[Data] [varbinary](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[InvEquipmentAttachment] ADD  CONSTRAINT [DF_InvEquipmentAttachment_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[InvEquipmentAttachment] ADD  CONSTRAINT [DF_InvEquipmentAttachment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[InvEquipmentAttachment]  WITH CHECK ADD  CONSTRAINT [FK_InvEquipmentAttachment_InvEquipment] FOREIGN KEY([InvEquipmentID])
REFERENCES [dbo].[InvEquipment] ([ID])
GO

ALTER TABLE [dbo].[InvEquipmentAttachment] CHECK CONSTRAINT [FK_InvEquipmentAttachment_InvEquipment]
GO


USE [msDATA]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetInvEquipmentDetail]    Script Date: 9/5/2016 2:10:23 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetInvEquipmentDetail]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_DeactivateInvEquipment]    Script Date: 9/5/2016 2:10:23 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_DeactivateInvEquipment]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetFacilityDetailsByWRNum]    Script Date: 9/5/2016 2:10:23 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetFacilityDetailsByWRNum]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetTypeList]    Script Date: 9/5/2016 2:10:23 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetTypeList]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetTypeList]    Script Date: 9/5/2016 2:10:23 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[spn_Inv_GetTypeList]
AS
Select distinct SystemGroup
from InvFacilitySystem
Order By SystemGroup ASC

GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetFacilityDetailsByWRNum]    Script Date: 9/5/2016 2:10:23 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



Create PROCEDURE [dbo].[spn_Inv_GetFacilityDetailsByWRNum]
(
		@WRNum varchar(50)
)
AS 

Begin
	select *
	from dbo.InvFacility
	where InvFacility.WorkRequest#=@WRNum
End









GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_DeactivateInvEquipment]    Script Date: 9/5/2016 2:10:23 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



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






GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetInvEquipmentDetail]    Script Date: 9/5/2016 2:10:23 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



Create PROCEDURE [dbo].[spn_Inv_GetInvEquipmentDetail]
(
		@ID int
	)
AS
 
select InvEquipment.*
from dbo.InvEquipment
where ID=@ID







GO






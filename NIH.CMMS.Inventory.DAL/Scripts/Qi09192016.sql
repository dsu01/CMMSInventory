USE [msDATA]
GO

ALTER TABLE [dbo].[InvFacilityAttachment] DROP CONSTRAINT [FK_InvFacilityAttachment_InvFacility]
GO

ALTER TABLE [dbo].[InvFacilityAttachment] DROP CONSTRAINT [DF_InvFacilityAttachment_IsActive]
GO

ALTER TABLE [dbo].[InvFacilityAttachment] DROP CONSTRAINT [DF_InvFacilityAttachment_CreatedOn]
GO

/****** Object:  Table [dbo].[InvFacilityAttachment]    Script Date: 9/19/2016 11:22:30 PM ******/
DROP TABLE [dbo].[InvFacilityAttachment]
GO

/****** Object:  Table [dbo].[InvFacilityAttachment]    Script Date: 9/19/2016 11:22:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
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

SET ANSI_PADDING OFF
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

ALTER TABLE [dbo].[InvEquipmentAttachment] DROP CONSTRAINT [FK_InvEquipmentAttachment_InvEquipment]
GO

/****** Object:  Table [dbo].[InvEquipmentAttachment]    Script Date: 9/19/2016 11:24:10 PM ******/
DROP TABLE [dbo].[InvEquipmentAttachment]
GO

/****** Object:  Table [dbo].[InvEquipmentAttachment]    Script Date: 9/19/2016 11:24:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[InvEquipmentAttachment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvEquipmentID] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[ContentType] [nvarchar](200) NULL,
	[Data] [varbinary](max) NULL,
	[CreatedOn] [datetime] NULL CONSTRAINT [DF_InvEquipmentAttachment_CreatedOn]  DEFAULT (getdate()),
	[CreatedBy] [varchar](100) NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_InvEquipmentAttachment_IsActive]  DEFAULT ((1)),
	[Title] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[InvEquipmentAttachment]  WITH CHECK ADD  CONSTRAINT [FK_InvEquipmentAttachment_InvEquipment] FOREIGN KEY([InvEquipmentID])
REFERENCES [dbo].[InvEquipment] ([ID])
GO

ALTER TABLE [dbo].[InvEquipmentAttachment] CHECK CONSTRAINT [FK_InvEquipmentAttachment_InvEquipment]
GO


ALTER TABLE dbo.InvEquipment 
ADD CKTSUsed varchar(6) NULL 
,VOLTSPRIMARY varchar(20) NULL 
,AMP varchar(20) NULL 
,KVA varchar(20) NULL 
,VOLTSSECONDARY varchar(20) NULL
,VOLTS varchar(20) NULL
,W varchar(6) NULL 
,PH varchar(6) NULL 
,NOofCKTS varchar(6) NULL;  

Go

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetInvEquipmentDetail]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetInvEquipmentDetail]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_DeactivateInvEquipment]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_DeactivateInvEquipment]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetFacilityDetailsByWRNum]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetFacilityDetailsByWRNum]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetTypeList]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetTypeList]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_Search_GetFacilityList]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_Search_GetFacilityList]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetListByType_Search]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetListByType_Search]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetBuildingList_Search]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetBuildingList_Search]
GO

/****** Object:  StoredProcedure [dbo].[spn_inv_updateEquipmentAttachment]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_inv_updateEquipmentAttachment]
GO

/****** Object:  StoredProcedure [dbo].[spn_inv_deleteEquipmentAttachment]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_inv_deleteEquipmentAttachment]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetEquipmentAttachmentList]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetEquipmentAttachmentList]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetEquipmentAttachmentByID]    Script Date: 9/19/2016 11:25:37 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetEquipmentAttachmentByID]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetEquipmentAttachmentByID]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[spn_Inv_GetEquipmentAttachmentByID]
(
		@attachmentSysId int
	)
AS
 
select * from dbo.InvEquipmentAttachment
where ID = @attachmentSysId







GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetEquipmentAttachmentList]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[spn_Inv_GetEquipmentAttachmentList]
(
		@equipmentSysId int
	)
AS
 
select * from dbo.InvEquipmentAttachment
where InvEquipmentID = @equipmentSysId and IsActive = 1
order by Title






GO

/****** Object:  StoredProcedure [dbo].[spn_inv_deleteEquipmentAttachment]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[spn_inv_deleteEquipmentAttachment]
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


GO

/****** Object:  StoredProcedure [dbo].[spn_inv_updateEquipmentAttachment]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spn_inv_updateEquipmentAttachment]
	(
		@invEquipmentSysID int,		-- required
		@FileName varchar(100),		-- required
		@ContentType nvarchar(200) = null,
		@Data varbinary(max) ,   -- required
		@CreatedOn datetime = getdate,
		@CreatedBy varchar(100) = null,
		@IsActive bit = 1,
		@Title nvarchar(200),
		@ID int OUTPUT,	
		@Res int OUTPUT	
	)
AS
Begin
declare @EquipmentGroup as varchar(50)

declare @EquipmentSystem as varchar(50)

Set @Res = 0


/* initially, check key fields. If null then, return -1  */	
	if @invEquipmentSysID is null or @FileName is null or @Data  is null
	Begin
		set @Res=-1
		return
	End
			
	if @@error<> 0 GOTO E_Error

			-- logic only for inserts
			Begin -- begin for insert\			
						
				INSERT INTO [dbo].[InvEquipmentAttachment]
						   ([InvEquipmentID]
						   ,[FileName]
						   ,[ContentType]
						   ,[Data]
						   ,[CreatedOn]
						   ,[CreatedBy]
						   ,[IsActive]
						   ,[Title])
					 VALUES
						   (@invEquipmentSysID
						   ,@FileName
						   ,@ContentType
						   ,@Data
						   ,@CreatedOn
						   ,@CreatedBy
						   ,@IsActive
						   ,@Title
						   )

					-- INSERT as one equipment					   
					SELECT @ID = @@IDENTITY
					If @@error <> 0	GOTO E_Error					
					return
				
		End--end for insert new
	
E_Error:
	print 'Error Happened'
	set @ID = null
    set @Res=@@error	
    return	
End


GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetBuildingList_Search]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



Create PROCEDURE [dbo].[spn_Inv_GetBuildingList_Search]
AS
Select ID, Building
from InvBuilding
Where active=-1
Order By Building ASC



GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetListByType_Search]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[spn_Inv_GetListByType_Search]
	@SystemGroup varchar(50)
AS
Select ID, SystemTitle
from InvFacilitySystem
where SystemGroup = @SystemGroup
Order By Systemtitle ASC



GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_Search_GetFacilityList]    Script Date: 9/19/2016 11:25:37 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[spn_Inv_Search_GetFacilityList]
(
		@SystemIds varchar(max),	-- from spn_Inv_GetSystem_Search, separated by ,
		@TypeId varchar(max), -- from spn_Inv_GetTypeList
		@BuildingIds varchar (max),	 -- from spn_Inv_GetBuildingList
		--@ComponentIds varchar(max),
		@FacilityNo varchar(50),
		@WorkRequest varchar(50),		
		@Status varchar(10)
	)
AS
 


select InvFacility.ID,InvFacility.Facility#Temp, InvFacility.Facility#, InvFacility.FacilityFunction, InvFacility.FacilityGroup, 
InvFacility.FacilitySystem, InvFacility.FacilityID, InvFacility.Building, InvFacility.[location], InvFacility.[ElectricalOther], 
COUNT(invequipment.id) as TotalEquipments, InvFacility.WorkRequest#, InvFacility.Floor, InvFacility.Status

from dbo.InvFacility 
left join dbo.InvEquipment on InvFacility.Facility# = InvEquipment.parentfacility#
where 1=1
And ((@TypeId is null) or (InvFacility.FacilityGroup like @TypeId + '%'))
And ((@SystemIds is null) or (InvFacility.FacilitySystem IN (SELECT distinct systemtitle FROM dbo.InvFacilitySystem)))
And ((@BuildingIds is null) or (InvFacility.Building IN (SELECT distinct building FROM dbo.InvBuilding)))
--And ((@SystemIds is null) or (InvFacility.FacilitySystem IN (SELECT [Value] FROM dbo.fn_DelimSepStr(@SystemIds,','))))	

And ((@facilityNo is null) or (InvFacility.Facility# like '%' + @FacilityNo + '%') or (InvFacility.Facility#Temp like '%' + @FacilityNo + '%'))
And ((@Status='3') or (((@Status='1') and (InvFacility.Facility# like 'T%')) or ((@Status='2') and (InvFacility.Facility# not like 'T%'))))

And ((@WorkRequest is null) or (InvFacility.WorkRequest# like '%' + @WorkRequest+'%'))
AND (InvFacility.Facility# is not null)
group by InvFacility.ID,InvFacility.Facility#Temp,InvFacility.Facility#, InvFacility.FacilityFunction, InvFacility.FacilityGroup, InvFacility.FacilitySystem, 
InvFacility.FacilityID, InvFacility.Building, InvFacility.[location], InvFacility.WorkRequest#, InvFacility.WorkRequest#, InvFacility.Floor, InvFacility.Status,InvFacility.[ElectricalOther]
order by InvFacility.Facility# asc






GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetTypeList]    Script Date: 9/19/2016 11:25:37 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetFacilityDetailsByWRNum]    Script Date: 9/19/2016 11:25:37 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_DeactivateInvEquipment]    Script Date: 9/19/2016 11:25:37 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetInvEquipmentDetail]    Script Date: 9/19/2016 11:25:37 PM ******/
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


Create PROCEDURE [dbo].[spn_Inv_GetSystemEquipmentList]
AS
Select distinct SystemTitle, SystemAbbreviation
from InvFacilitySystem
Where SystemGroup like '%Equipment%'
Order By Systemtitle ASC




GO



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




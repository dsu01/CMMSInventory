USE [msDATA]
GO
--9/24/2016
ALTER PROCEDURE [dbo].[spn_Inv_GetSystem_Search_newSite]
      (
            @SearchIndex varchar(10) -- from the search front page, 0 for all; 1 for Mechanical and 2 for Electrical - 9/24/2016
      )
AS
  
Select ID as [Key], SystemGroup + ' - ' + SystemTitle as [Description]
from InvFacilitySystem
where (@SearchIndex = '0' and (SystemGroup like 'Mechanical%' or SystemGroup like 'Electrical%')) or (@Searchindex = '1' and SystemGroup like 'Mechanical%') or (@Searchindex = '2' and SystemGroup like 'Electrical%')
Order By SystemGroup + ' - ' + SystemTitle  ASC

 GO

ALTER PROCEDURE [dbo].[spn_Inv_GetBuildingList_Search]
AS
Select ID as [Key], Building as [Description]
from InvBuilding
Where active=-1
Order By Building ASC

GO

ALTER PROCEDURE [dbo].[spn_inv_AddElectricalEquipment_NewSite]
	(
		@FacilitySystemID smallint,		-- required, from table invFacilitySystem after user selects.
		
		@Comments varchar(255),
		@Building varchar(50),			-- required
		@Floor varchar(20),			
		@FacilityLocation varchar(50),	-- required
		@FacilityID varchar(50),		-- required - not the Facility#
		@WorkRequestNo varchar(50),
		@Function varchar(50),
		@BSL smallint,				-- default 0
		@AAALAC smallint,			-- default 0
		@TJC smallint,				-- default 0
			@UserName varchar(50),				-- required
			@ElectricalOther varchar(50),
				
--		@EquipmentID varchar(50),
--		@EquipmentLocation varchar(50),
--		@TypeorUse varchar(50),
		@Manufacturer varchar(50),
		@ModelNo varchar(50),
		@SerialNo varchar(50),
		@Size varchar(50),
		@InstallDate date,
--		@Capacity varchar(50),
--		@CapacityHeadTest varchar(50),
--		@FuelRefrigeration varchar(50),
---		@MotorManufacturer varchar(50),
--		@HP varchar(50),
--		@MotorType varchar(50),
--		@MotorSerialNo varchar(50),
--		@MotorInstallDate date,
--		@MotorModel varchar(50),
--		@Frame varchar(50),
--		@RPM varchar(50),
--		@Voltage varchar(50),
--		@Amperes varchar(50),
--		@PhaseCycle varchar(50),
--		@BSLClassification varchar(50),
--		@TJCValue int,
--		@PMSchedule varchar(50),

		@VOLTS varchar(20),
		@AMP varchar(20),
		@KVA varchar(20),
		@VOLTSprimary varchar(20),
		@VOLTSSecondary varchar(20),
		@PH varchar(6),
		@W varchar(6),
		@NOofCKTS varchar(6),
		@CKTSUsed varchar(6),
		
	
		@inventoryby varchar(50),			-- recommendation
		@inventoryDate Datetime,			-- recommendation
		@FacilityNo varchar(50) OUTPUT,		-- return a new Facility# as Temporary
			@ID int OUTPUT,	
		@Res int OUTPUT		
	)
AS
declare @SystemGroup as varchar(50)
declare @SystemTitle as varchar(50)
declare @iden as int
declare @Property as varchar(50)

set @iden = 0

Set @Res = 0

	/* initially, check key fields. If null then, return -1  */	
	if @Building is null or @FacilitySystemID is null or @FacilityLocation is null or @FacilityID is null
	Begin
		set @FacilityNo = null
		set @Res=-1
		return
	End
		
	select @Property = Property
	from dbo.InvBuilding where Building = @Building and Active = -1
	
	if @@error<> 0 GOTO E_Error
	
	select @SystemGroup = SystemGroup, @SystemTitle = SystemTitle
	from dbo.InvFacilitySystem where id = @facilitySystemID
	
	if @@error<> 0 GOTO E_Error
	
	if @SystemGroup is null set @SystemGroup = 'Electrical Equipment' -- required in the table of invFacility

	/* second, create a record of mecahnical system only into table*/
--	begin
		
		set @iden = IDENT_CURRENT('invFacility')+1
		
		set @FacilityNo = 'T' + RIGHT(Convert(varchar(6),100000+@iden), 5)
					
		Insert into	dbo.InvFacility([WorkRequest#],[Facility#],[Facility#Temp],[FacilitySystem],[FacilityGroup],[FacilityFunction],
           [FacilityID],[Comments],[Property],[Building],[Floor],[Location],[BSL],[AAALAC],[TJC],
           [Manufacturer],[Model],[SerialNo],[Size],[InstallDate],ElectricalOther,[VOLTS],[AMP],[KVA],[VOLTSprimary],
           [VOLTSSecondary],[PH],[W],[NOofCKTS],[CKTSUsed],[InputBy], [InventoryBy], [inventorydate])
		VALUES
           ( @WorkRequestNo,@FacilityNo,@FacilityNo,@SystemTitle,@SystemGroup,@Function,@FacilityID, @Comments, @Property, @Building,
           @Floor,@FacilityLocation,@BSL,@AAALAC,@TJC,@Manufacturer,@ModelNo,@SerialNo,@Size,@InstallDate,
           @ElectricalOther,@VOLTS,@AMP,@KVA,@VOLTSprimary,@VOLTSSecondary,@PH,@W,@NOofCKTS,@CKTSUsed,
           @UserName, @inventoryby, @inventoryDate)
           
			SELECT @ID = @@IDENTITY
					If @@error <> 0	GOTO E_Error
		
		return


E_Error:
	set @FacilityNo = null
    set @Res=@@error
    return













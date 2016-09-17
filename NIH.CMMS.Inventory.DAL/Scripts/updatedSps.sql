USE [msDATA]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetInvEquipmentDetail]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetInvEquipmentDetail]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_DeactivateInvEquipment]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_DeactivateInvEquipment]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetFacilityDetailsByWRNum]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetFacilityDetailsByWRNum]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetTypeList]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetTypeList]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_Search_GetFacilityList]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_Search_GetFacilityList]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetListByType_Search]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetListByType_Search]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetBuildingList_Search]    Script Date: 9/6/2016 11:44:30 PM ******/
DROP PROCEDURE [dbo].[spn_Inv_GetBuildingList_Search]
GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetBuildingList_Search]    Script Date: 9/6/2016 11:44:30 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spn_Inv_Search_GetFacilityList]
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



Create PROCEDURE [dbo].[spn_Inv_GetBuildingList_Search]
AS
Select ID, Building
from InvBuilding
Where active=-1
Order By Building ASC



GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetListByType_Search]    Script Date: 9/6/2016 11:44:30 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_Search_GetFacilityList]    Script Date: 9/6/2016 11:44:30 PM ******/
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

from dbo.InvFacility left join dbo.InvEquipment on InvFacility.Facility# = InvEquipment.parentfacility#
where 1=1
--And ((@Building is null) or (InvFacility.Building=@Building))
--And ((@System is null) or (InvFacility.FacilitySystem=@system))
--And ((@Group is null) or (InvFacility.FacilityGroup like @Group + '%'))
And ((@facilityNo is null) or (InvFacility.Facility# like '%' + @FacilityNo + '%') or (InvFacility.Facility#Temp like '%' + @FacilityNo + '%'))
And ((@Status='3') or (((@Status='1') and (InvFacility.Facility# like 'T%')) or ((@Status='2') and (InvFacility.Facility# not like 'T%'))))

And ((@WorkRequest is null) or (InvFacility.WorkRequest# like '%' + @WorkRequest+'%'))
AND (InvFacility.Facility# is not null)
group by InvFacility.ID,InvFacility.Facility#Temp,InvFacility.Facility#, InvFacility.FacilityFunction, InvFacility.FacilityGroup, InvFacility.FacilitySystem, 
InvFacility.FacilityID, InvFacility.Building, InvFacility.[location], InvFacility.WorkRequest#, InvFacility.WorkRequest#, InvFacility.Floor, InvFacility.Status,InvFacility.[ElectricalOther]
order by InvFacility.Facility# asc






GO

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetTypeList]    Script Date: 9/6/2016 11:44:30 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetFacilityDetailsByWRNum]    Script Date: 9/6/2016 11:44:30 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_DeactivateInvEquipment]    Script Date: 9/6/2016 11:44:30 PM ******/
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

/****** Object:  StoredProcedure [dbo].[spn_Inv_GetInvEquipmentDetail]    Script Date: 9/6/2016 11:44:30 PM ******/
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



USE [msDATA]
GO
/****** Object:  StoredProcedure [dbo].[spn_Inv_Search_GetFacilityList]    Script Date: 10/11/2016 6:53:50 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER Procedure [dbo].[spn_Inv_Search_GetFacilityList]
(
@SystemIds varchar(max), -- numeric, 1,2,3
@TypeId varchar(10), -- 0 - all, 1 - Mechanical and 2 Electrical
@BuildingIds varchar(max), -- building from invBuilding, - the ID number 1,2,3
@FacilityNo varchar(50),
@WorkRequest varchar(50), 
@Status varchar(10)  -- 3 means all, 1 is unassigned, 2 assigned
)
AS

select InvFacility.ID,InvFacility.Facility#Temp, InvFacility.Facility#, InvFacility.FacilityFunction, InvFacility.FacilityGroup, 
InvFacility.FacilitySystem, InvFacility.FacilityID, InvFacility.Building, InvFacility.[location], 
invFacility.WorkRequest#, InvFacility.Floor, InvFacility.Status, COUNT(invequipment.ID) as totalequipments 
from dbo.InvFacility left join dbo.InvEquipment on InvFacility.Facility# = InvEquipment.parentfacility#
where 1=1
and ((@BuildingIds is null) or (InvFacility.Building in (select [invbuilding].building from [invbuilding] where [invbuilding].ID in (SELECT [Value] FROM dbo.fn_DelimSepStr(@buildingIds,',')) )))

AND ((@TypeId is null)
OR (@TypeId=0)
OR (@TypeId=1 and InvFacility.[FacilityGroup] in ('Mechanical System','Mechanical Equipment'))
OR (@TypeId=2 and InvFacility.[FacilityGroup] in ('Electrical System','Electrical Equipment'))
)
And ((@SystemIds is null) or (InvFacility.FacilitySystem in (select InvFacilitySystem.SystemTitle from InvFacilitySystem where InvFacilitySystem.ID in (SELECT [Value] FROM dbo.fn_DelimSepStr(@SystemIds,',')) )))
and ((@BuildingIds is null) or (InvFacility.Building in (select InvFacility.building from [invbuilding] where [invbuilding].ID in (SELECT [Value] FROM dbo.fn_DelimSepStr(@BuildingIds,',')) )))
And ((@facilityNo is null) or (InvFacility.Facility# like '%' + @FacilityNo + '%') or (InvFacility.Facility#Temp like '%' + @FacilityNo + '%'))
And ((@Status='3') or (((@Status='1') and (InvFacility.Facility# like 'T%')) or ((@Status='2') and (InvFacility.Facility# not like 'T%'))))
And ((@WorkRequest is null) or (InvFacility.WorkRequest# like '%' + @WorkRequest+'%'))
AND (InvFacility.Facility# is not null)
group by InvFacility.ID,InvFacility.Facility#Temp,InvFacility.Facility#, InvFacility.FacilityFunction, InvFacility.FacilityGroup, 
InvFacility.FacilitySystem, invFacility.FacilityID, InvFacility.Building, InvFacility.[location], 
InvFacility.WorkRequest#, InvFacility.Floor, InvFacility.Status
order by InvFacility.Facility# asc

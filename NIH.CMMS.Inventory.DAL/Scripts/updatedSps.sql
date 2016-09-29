USE [msDATA]
GO
ALTER TABLE dbo.InvEquipment 
ADD EquipmentNo varchar(50) NULL
GO
--9/24/2016

ALTER PROCEDURE [dbo].[spn_Inv_GetSystem_Search_newSite]
      (
            @SearchIndex varchar(10) -- from the search front page, 0 for all; 1 for Mechanical and 2 for Electrical - 9/24/2016
      )
AS
  
Select ID as [Key], SystemGroup + ' - ' + SystemTitle as [Description]
from InvFacilitySystem
where (@SearchIndex = '0' and (SystemGroup like 'Mechanical%' or SystemGroup like 'Electrical%')) 
	or (@Searchindex = '1' and SystemGroup like 'Mechanical%') 
	or (@Searchindex = '2' and SystemGroup like 'Electrical%')
Order By SystemGroup + ' - ' + SystemTitle  ASC


 GO

ALTER PROCEDURE [dbo].[spn_Inv_GetBuildingList_Search]
AS
Select ID as [Key], Building as [Description]
from InvBuilding
Where active=-1
Order By Building ASC

GO

USE [msDATA]
GO
--9/24/2016

ALTER PROCEDURE [dbo].[spn_Inv_GetListByType_Search]
	@SystemGroup varchar(50)
AS
Select ID, SystemGroup + '--' + SystemTitle as [Description]
from InvFacilitySystem
where SystemGroup like @SystemGroup + '%'
Order By Systemtitle ASC

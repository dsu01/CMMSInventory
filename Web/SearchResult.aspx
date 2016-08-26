<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true"  CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" Title="CMMS Inventory Search Result Page" %>

<asp:Content ID="ContentDefault" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
<asp:UpdatePanel runat="server" ID="udpPnlSearchResult">
   <Triggers>
                <asp:PostBackTrigger ControlID="btnExportToExcel" />
                <asp:PostBackTrigger ControlID="btnExportToPDF" />
             </Triggers> 
       <ContentTemplate> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">             
                 <asp:Panel ID="pnlResult" runat="server">
                   <tr>
                        <td class="redheading">Search Result</td>
                   </tr>
                   <tr>
                        <td>
                            <table style="width:98%;">
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbModifySearch" CommandName="KeepAlive" runat="server" Visible="false"
                                            CssClass="GridViewButtons" SkinID="HyperLinkButton2" OnClick="lbModifySearch_OnClick"></asp:LinkButton>
                                        current criteria:
                                    </td>
                                    <td align="right">
                                        <table id="trExportandPrintButtons" runat="server" visible="false">
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="btnExportToExcel" runat="Server" Text="Export To Excel" OnClick="btnExportToExcel_OnClick" />
                                                    <asp:Button ID="btnExportToPDF" runat="Server" Text="Export To PDF" OnClick="btnExportToPDF_OnClick" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                      <tr>
                        <td>
                            <asp:Label runat="server" ID="lblValidationError" CssClass="errortext" Visible="false"
                                EnableViewState="false" />
                        </td>
                    </tr>
                   <tr>
                       <td>
                          <asp:Panel ID="pnlResults" runat="server">
                          <asp:Label ID="lblTotalNumberOfResult" runat="server" CssClass="rptTotal" />
                        	<asp:gridview id="gvFacilitys" SkinID="gvRegPagingSorting" runat="server" AutoGenerateColumns="false" OnSorting="gvFacilitys_OnSorting"
                                            OnPageIndexChanging="gvFacilitys_OnPageIndexChanging">
                                    <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10" />
                                            <PagerStyle ForeColor="Black" HorizontalAlign="Right" Height="8" BackColor="#E0E0E0"
                                                Font-Size="11px" Font-Underline="true" Font-Bold="true" />
				                <Columns>
				                 <asp:TemplateField HeaderText="Facility#"  HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                     
                                        <asp:Label id="lblFacilityNum" runat="server" text='<%# Eval("Facility#") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField> 
				
				                <asp:TemplateField HeaderText="Facility ID" ItemStyle-HorizontalAlign="Center">
					                <ItemTemplate>
					
						                <asp:Label id="lblFacilityID" runat="server" text='<%# Eval("FacilityID") %>' />
					                </ItemTemplate>				
				                </asp:TemplateField>
				                <asp:TemplateField HeaderText="Facility Function" ItemStyle-HorizontalAlign="Center">
					                <ItemTemplate>
						                <asp:Label id="lblFacFunction" runat="server" text='<%# Eval("FacilityFunction") %>' />
					                </ItemTemplate>					
				                </asp:TemplateField>
				                 <asp:TemplateField HeaderText="Facility System" ItemStyle-HorizontalAlign="Center">
					                <ItemTemplate>
						                <asp:Label ID="lblFacSystem" runat="server" Text='<%# Eval("FacilitySystem") %>' />
						
					                </ItemTemplate>												
	                            </asp:TemplateField>
				                <asp:TemplateField HeaderText="Building" ItemStyle-HorizontalAlign="Center">
					                <ItemTemplate>
						                <asp:Label id="lblBuilding" runat="server" text='<%# Eval("Building") %>' />
					                </ItemTemplate>					
				                </asp:TemplateField>																		
				                <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Center">
					                <ItemTemplate>
						                <asp:Label id="lblLocation" runat="server" text='<%# Eval("Location") %>' />
					                </ItemTemplate>					
				                </asp:TemplateField>
				                <asp:TemplateField HeaderText="# of Equipments" ItemStyle-HorizontalAlign="Center">
					                <ItemTemplate>
						                <asp:Label id="lblNumEquip" runat="server" text='<%# Eval("TotalEquipments") %>' />
					                </ItemTemplate>					
				                </asp:TemplateField>
					
                                                                                                                                                                                                               
                  
					                </Columns>
				                </asp:gridview>
                               </asp:Panel>
                       </td>
                    </tr>
                           
                             <tr>
                                <td colspan="4" align="center" class="text7">  
                                <asp:UpdateProgress ID="progress1" AssociatedUpdatePanelID="udpPnlSearchResult"  runat="server">
                                   <ProgressTemplate>
                                     <img src="Image/indicator.gif" alt="Please wait..." />&nbsp;Please wait...
                                      

                                   </ProgressTemplate>
                                </asp:UpdateProgress>  
                                </td>
                              </tr>
                      
               
            </table> 
        </ContentTemplate> 
</asp:UpdatePanel> 
</asp:Content>
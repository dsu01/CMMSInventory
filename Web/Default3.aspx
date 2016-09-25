<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true"  CodeFile="Default3.aspx.cs" Inherits="Default3" Title="CMMS Inventory Main Page" %>


<asp:Content ID="ContentDefault" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
<asp:UpdatePanel runat="server" ID="udpPnlDefault">
  
       <ContentTemplate> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="redheading">Quick Search</td>
                </tr>
                <tr>
                    <td width="100%" valign="top">
                        <asp:UpdatePanel runat="server" ID="udpPnlQuickSearch" UpdateMode="Conditional">
                            <ContentTemplate> 
                        <table width="100%" cellspacing="0" cellpadding="0" bgcolor="#d3d3d3">                            
                            <tr>
                                <td width="100%">
                                <div class="cbb">                                
                                    <table width="100%" cellpadding="3" cellspacing="0" style="background-color:White; border: solid 1px Maroon">
                                       <tr> <td class="leftLabel">Facility#:</td>
                                                <td align="left"><asp:TextBox ID="txtFacilityNum" runat="server" SkinID="MaxTextBox"></asp:TextBox> 
                                                 <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                                    TargetControlID="txtFacilityNum" 
                                                    WatermarkText="e.g. 03475 or T00005" 
                                                    WatermarkCssClass="watermarked" /> 
                                                 <asp:imagebutton id="imgbtnFacNumSearch" runat="server" AlternateText="Find By Facility Number" ImageUrl="~/Image/btn_find.jpg" CausesValidation="false" OnClick="btnSearchByFacNum_Click"></asp:imagebutton>
                                                
                                                </td>    
                                   
                                            <td class="leftLabel">NIH Work Request#:</td>
						                        <td align="left"><asp:TextBox ID="txtWRNum" runat="server" SkinID="MaxTextBox"></asp:TextBox>
						                    
                                                  <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE2" runat="server" 
                                                    TargetControlID="txtWRNum" 
                                                    WatermarkText="e.g. HQC70354" 
                                                    WatermarkCssClass="watermarked" /> 
                                                 <asp:imagebutton id="imgbtnWRSearch" runat="server" AlternateText="Find By WR number" ImageUrl="~/Image/btn_find.jpg" CausesValidation="false" OnClick="btnSearchByWRNum_Click"></asp:imagebutton>
                                                </td>                           
                                        </tr>                                         
                                    </table> 
                                </div> 
                                </td> 
                             </tr> 
                        </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                     </td>
                 </tr> 

                 <tr>
                     <td class="redheading"><br />Inventory Advanced Search 
                     </td>
                 </tr>  
                 <asp:Panel ID="pnlAdvanceSearch" runat="server">
                            <%-- <tr>
                                <td >* Select one or more criteria then click the "Search Inventory" button to generate a list of equipment.
                                </td>
                             </tr> --%>
                         
                             <tr>
                                <td width="100%">
                                
                                <div class="cbb">
                                    <asp:UpdatePanel runat="server" ID="udpPnlAdvanceSearch" UpdateMode="Conditional">
                                        <ContentTemplate> 
                                 <table width="100%" cellpadding="3" cellspacing="0" style="background-color:White; border: solid 1px Maroon">
                                     <tr>
                                       <td class="leftLabel">Type:</td>
                                            <td align="left" class="text7">                                            
                                             <asp:RadioButtonList ID="rblstType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblstType_SelectedIndexChanged" AutoPostBack="true" >
                                                 <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                                  <asp:ListItem Text="Mechanical" Value="1"></asp:ListItem>
                                                  <asp:ListItem Text="Electrical" Value="2"></asp:ListItem>
                                             </asp:RadioButtonList>
                                       <asp:RequiredFieldValidator ID="rqType" runat="server" ControlToValidate="rblstType" Display="Dynamic" ErrorMessage="Please select a Type" InitialValue="-1"></asp:RequiredFieldValidator>
                                         </td>
                                    </tr>
                                 
                                     <tr>    				    
				                        <td class="leftLabel">Selection:</td>
				                        <td class="text7">
				                         <!-- Only this area is updated on PostBack -->
                                                <asp:UpdatePanel ID="updatePnl2" runat="server" UpdateMode="conditional">
                                                    <ContentTemplate>
					                                <table width="500">
						                                <tr>
							                                <td width="300">
								                                <asp:ListBox ID="lbSystems" style="width:300px; min-height:300px" SelectionMode="Multiple" Runat="server" DataTextField = "Description" DataValueField = "ID"></asp:ListBox>
							                                </td>
							   
							                                 <td  width="90" align="center">
				                                               
					                                            <asp:button Text="  add >>" Runat="server" ID="btnSelectSystem" Width="80" CausesValidation="false" OnClick="btnSelectSystem_Click" UseSubmitBehavior="False"></asp:button><br />
					                                            <br />
					                                            <asp:button Text=" remove <<" Runat="server" ID="btnRemoveSystem" Width="80" CausesValidation="false" OnClick="btnRemoveSystem_Click" UseSubmitBehavior="False"></asp:button>
				                                                 <br /><br />
                                                                 <asp:Button ID="btnSelectAllSystem" runat="server" Text=" add all   >>" CausesValidation="false"
                                                                OnClick="btnAddAllSystem_Click" /><br /><br />
                                                                 <asp:Button ID="btnRemoveAllSystem" runat="server" Text=" remove all <<" CausesValidation="false"
                                                                OnClick="btnRemoveAllSystem_Click" />
                                                             </td>
							                                <td width="300">
								                                <asp:ListBox ID="lbExtSystems" style="width:300px; min-height:300px" SelectionMode="Multiple" Runat="server" DataTextField = "Description" DataValueField = "ID"></asp:ListBox>
							                                </td>
						                                </tr>
					                                </table>
					                            </ContentTemplate>
                                                </asp:UpdatePanel>
				                        </td>
			                        </tr>
                            
                                    <%--  <tr>
                                         <td></td>
                                         <td style="color:darkgreen; font-size:.8em;">(current seleted building: <asp:Label ID="lbSelectedBuildingValue" runat="server"></asp:Label>)
                                         </td>                                            
                                    </tr>--%>
                                        
                                                      
                                     <tr>    				    
				                        <td class="leftLabel">Building:</td>
				                        <td class="text7">
				                         <!-- Only this area is updated on PostBack -->
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
                                                    <ContentTemplate>
					                                <table width="500">
						                                <tr>
							                                <td width="300">
								                                <asp:ListBox ID="lbBuilding"  style="width:300px; min-height:300px"  SelectionMode="Multiple" Runat="server" DataTextField = "Building" DataValueField = "ID"></asp:ListBox>
							                                </td>
							   
							                                 <td  width="90" align="center">
				                                               
					                                            <asp:button Text="  add >>" Runat="server" ID="btnSelectBuilding" Width="80" CausesValidation="false" OnClick="btnSelectBuilding_Click" UseSubmitBehavior="False"></asp:button><br />
					                                            <br />
					                                            <asp:button Text=" remove <<" Runat="server" ID="btnRemoveBuilding" Width="80" CausesValidation="false" OnClick="btnRemoveBuilding_Click" UseSubmitBehavior="False"></asp:button>
				                                              <br /><br />
                                                                 <asp:Button ID="btnSelectAllBuilding" runat="server" Text=" add all   >>" CausesValidation="false"
                                                                OnClick="btnAddAllBuilding_Click" /><br /><br />
                                                                 <asp:Button ID="btnRemoveAllBuilding" runat="server" Text=" remove all <<" CausesValidation="false"
                                                                OnClick="btnRemoveAllBuilding_Click" />
                                                             </td>
							                                <td width="300">
								                                <asp:ListBox ID="lbExtBuilding" style="width:300px; min-height:300px"  SelectionMode="Multiple" Runat="server" DataTextField = "Building" DataValueField = "ID"></asp:ListBox>
							                                </td>
						                                </tr>
					                                </table>
					                            </ContentTemplate>
                                                </asp:UpdatePanel>
				                        </td>
			                        </tr>  
                                    
                                   
                                    <tr>   
						                   
                                            <td class="leftLabel">Facility# assigned?</td>
                                            <td align="left" class="text7">
                                                <asp:RadioButtonList ID="radioSelect" runat="server" RepeatDirection="Horizontal">
						                        <asp:ListItem Text="Un-Assigned" Value="1" Selected="True" />
						                        <asp:ListItem Text="Assigned" Value="2" />
						                        <asp:ListItem Text="All" Value="3" />
						                     </asp:RadioButtonList>
						                    </td>
    						           </tr>                                  
                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                 </div>
                                </td>
                            </tr>
                             <tr>
                                <td colspan="4" align="center" class="text7"><br /> 
                                    <asp:Button runat="server" ID="btnSearch" CssClass="submitGreen" Text="Search Inventory" UseSubmitBehavior="false" OnClick="btnSearch_Click">
                                            </asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnReset" CssClass="submitRed" Text="Reset Criteria" UseSubmitBehavior="false" OnClick="btnReset_Click" >
                                            </asp:Button>
                                              &nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Label ID="test" runat="server"></asp:Label>
                                    <br /><br />
                                </td>
                             </tr>
                             <tr>
                                <td colspan="4" align="center">  
                                <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="udpPnlAdvanceSearch" runat="server">
                                   <ProgressTemplate>
                                     <img src="Image/indicator.gif" alt="Please wait..." />&nbsp;Please wait...                                      

                                   </ProgressTemplate>
                                </asp:UpdateProgress>  

                                </td>
                              </tr>                             
                       
                </asp:Panel>
         
                  </table> 
    </ContentTemplate> 
    </asp:UpdatePanel> 
</asp:Content>
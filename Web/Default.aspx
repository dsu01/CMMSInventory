<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Title="CMMS Inventory Main Page" %>


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
                                       <tr> <td class="leftLabel">Facility#:&nbsp;&nbsp;<asp:TextBox ID="txtFacilityNum" runat="server" SkinID="MaxTextBox" MaxLength="50"></asp:TextBox> 
                                                 <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                                    TargetControlID="txtFacilityNum" 
                                                    WatermarkText="e.g. 03475 or T00005" 
                                                    WatermarkCssClass="watermarked" /> 
                                                 <asp:imagebutton id="imgbtnFacNumSearch" runat="server" AlternateText="Find By Facility Number" ImageUrl="~/Image/btn_find.jpg" CausesValidation="false" OnClick="btnSearchByFacNum_Click"></asp:imagebutton>
                                                
                                                </td>    
                                   
                                            <td class="leftLabel">NIH Work Request#:&nbsp;&nbsp;<asp:TextBox ID="txtWRNum" runat="server" SkinID="MaxTextBox" MaxLength="50"></asp:TextBox>
						                    
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
                             <tr>
                                <td width="100%">
                                
                                <div class="cbb">
                                    <asp:UpdatePanel runat="server" ID="udpPnlAdvanceSearch" UpdateMode="Conditional">
                                        <ContentTemplate> 
                                             <table width="100%" cellpadding="3" cellspacing="0" style="background-color:White; border: solid 1px Maroon">
                                     <tr>
                                     
                                            <td align="left" class="leftLabel">                                         
                                             <asp:RadioButtonList ID="rblstType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblstType_SelectedIndexChanged" AutoPostBack="true" >
                                                 <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                                  <asp:ListItem Text="Mechanical" Value="1"></asp:ListItem>
                                                  <asp:ListItem Text="Electrical" Value="2"></asp:ListItem>
                                             </asp:RadioButtonList>
                                       <asp:RequiredFieldValidator ID="rqType" runat="server" ControlToValidate="rblstType" Display="Dynamic" ErrorMessage="Please select a Type" InitialValue=""></asp:RequiredFieldValidator>
                                         </td>

                                         <td class="leftLabel"><br />Building:</td>
                                    </tr>
                                 
                                     <tr>    				    
				                      
				                        <td class="text7">
				                         <!-- Only this area is updated on PostBack -->
                                                <asp:UpdatePanel ID="updatePnl2" runat="server" UpdateMode="conditional">
                                                    <ContentTemplate>
					                                <table >
						                                <tr>
							                                <td>
                                                                <div style="height: 600px; width: 90%; overflow: auto">
								                                <asp:ListBox ID="lbSystems" style="width:250px; height:600px; font-size:.95em" SelectionMode="Multiple" Runat="server" DataTextField = "Description" DataValueField = "Key"></asp:ListBox>
							                                    </div>
                                                              </td>
							   
							                                 <td align="center" width="100">
				                                               
					                                            <asp:button Text="add>>" Runat="server" ID="btnSelectSystem" CssClass="text7" Width="50" CausesValidation="false" OnClick="btnSelectSystem_Click" UseSubmitBehavior="False"></asp:button><br />
					                                            <br />
					                                            <asp:button Text="remove<<" Runat="server" ID="btnRemoveSystem" CssClass="text7" Width="50" CausesValidation="false" OnClick="btnRemoveSystem_Click" UseSubmitBehavior="False"></asp:button>
				                                                 <br /><br />
                                                                 <asp:Button ID="btnSelectAllSystem" runat="server" Text=" add all>>" CausesValidation="false" CssClass="text7"
                                                                OnClick="btnAddAllSystem_Click" /><br /><br />
                                                                 <asp:Button ID="btnRemoveAllSystem" runat="server" Text=" remove all<<" CausesValidation="false" CssClass="text7"
                                                                OnClick="btnRemoveAllSystem_Click" />
                                                             </td>
							                                <td>
                                                                <div style="height: 600px; width: 90%; overflow: auto">
								                                <asp:ListBox ID="lbExtSystems" style="width:250px; height:600px; font-size:.95em" SelectionMode="Multiple" Runat="server" DataTextField = "Description" DataValueField = "Key"></asp:ListBox>
                                                                </div>
							                                </td>
						                                </tr>
					                                </table>
					                            </ContentTemplate>
                                                </asp:UpdatePanel>
				                        </td>		                        				    
				                      
				                        <td class="text7">
				                         <!-- Only this area is updated on PostBack -->
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
                                                    <ContentTemplate>
					                                <table>
						                                <tr>
							                                <td width="200">
                                                                  <div style="height: 600px; width: 95%; overflow: auto">
								                                <asp:ListBox ID="lbBuilding"  style="width:200px; height:600px; font-size:.95em" SelectionMode="Multiple" Runat="server" DataTextField = "Description" DataValueField = "Key"></asp:ListBox>
							                               </div>
                                                              </td>
							                                  <td align="center">
				                                               
					                                            <asp:button Text="add>>" Runat="server" ID="btnSelectBuilding" CssClass="text7" Width="50" CausesValidation="false" OnClick="btnSelectBuilding_Click" UseSubmitBehavior="False"></asp:button><br />
					                                            <br />
					                                            <asp:button Text="remove<<" Runat="server" ID="btnRemoveBuilding" CssClass="text7" Width="50" CausesValidation="false" OnClick="btnRemoveBuilding_Click" UseSubmitBehavior="False"></asp:button>
				                                              <br /><br />
                                                                 <asp:Button ID="btnSelectAllBuilding" runat="server" Text=" add all>>" CausesValidation="false" CssClass="text7"
                                                                OnClick="btnAddAllBuilding_Click" /><br /><br />
                                                                 <asp:Button ID="btnRemoveAllBuilding" runat="server" Text=" remove all<<" CausesValidation="false" CssClass="text7"
                                                                OnClick="btnRemoveAllBuilding_Click" />
                                                             </td>
							                                <td width="200">
                                                                 <div style="height: 600px; width: 95%; overflow: auto">
								                                <asp:ListBox ID="lbExtBuilding"  style="width:200px; height:600px; font-size:.95em" SelectionMode="Multiple" Runat="server" DataTextField = "Description" DataValueField = "Key"></asp:ListBox>
							                                  </div>
                                                              </td>
						                                </tr>
					                                </table>
					                            </ContentTemplate>
                                                </asp:UpdatePanel>
				                        </td>
			                        </tr>  
                                     <tr>   
						                   
                                            <td class="text7"><br /><b>Facility# assigned?</b>
                                           
                                                <asp:RadioButtonList ID="radioSelect" runat="server" RepeatDirection="Horizontal">
						                        <asp:ListItem Text="Un-Assigned" Value="1" />
						                        <asp:ListItem Text="Assigned" Value="2" />
						                        <asp:ListItem Text="All" Value="3" Selected="True" />
						                     </asp:RadioButtonList>
						                    </td>
    						              
                                   
                                        <td class="text7"><br /> 
                                            <asp:Button runat="server" ID="btnSearch" CssClass="submitGreen" Text="Search Inventory" UseSubmitBehavior="false" OnClick="btnSearch_Click">
                                                    </asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnReset" CssClass="submitRed" Text="Reset Criteria" UseSubmitBehavior="false" OnClick="btnReset_Click" >
                                                    </asp:Button>
                                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                             <asp:Label ID="test" runat="server"></asp:Label>
                                            <br /><br />
                                        </td>
                             </tr>
                                                      
                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                 </div>
                                </td>
                            </tr>
                           
                             <tr>
                                <td align="center">  
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
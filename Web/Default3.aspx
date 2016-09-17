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
                     </td>
                 </tr> 

                 <tr>
                     <td class="redheading"><br />Inventory Advanced Search </td>
                 </tr>  
                 <asp:Panel ID="pnlAdvanceSearch" runat="server">
                            <%-- <tr>
                                <td >* Select one or more criteria then click the "Search Inventory" button to generate a list of equipment.
                                </td>
                             </tr> --%>
                         
                             <tr>
                                <td width="100%">
                                
                                <div class="cbb">
                                 <table width="100%" cellpadding="3" cellspacing="0" style="background-color:White; border: solid 1px Maroon">
                                      <tr>
                                       <td class="leftLabel">Type:</td>
                                            <td align="left" class="text7">                                            
                                             <asp:RadioButtonList ID="rblstType" runat="server" RepeatDirection="Horizontal" DataTextField="SystemGroup" OnSelectedIndexChanged="rblstType_SelectedIndexChanged" AutoPostBack="true" />
                                       </td>
                                     </tr>
                                     <asp:Panel ID="pnlSelection" runat="server" Visible="false">
                                     <tr>
                                         <td></td>
                                         <td style="color:darkgreen; font-size:.8em;">(seleted values: <asp:Label ID="lbSelectedSystemValue" runat="server" Text="Air Dryer, Air Handling Unit"></asp:Label>)
                                         </td>
                                     </tr>
                                     <tr>
                                        <td class="leftLabel" width ="20%">Selection:</td>
                                        <td class="text7"> 
                                            <asp:Panel ID="pnlSystem" runat="server" style="max-height:250px;" ScrollBars="Auto">
                                                 <asp:CheckBoxList ID="drplstSystem" runat="server" RepeatDirection="Horizontal" RepeatColumns="8" DataTextField="SystemTitle" DataValueField="ID" OnSelectedIndexChanged="cklstSystemSelectedIndexChangd" AutoPostBack="true">
                                             </asp:CheckBoxList>
                                            </asp:Panel>      
                                        </td>
                                    </tr>
                                 <%--  <tr>
                                         <td></td>
                                         <td class="errortext">seletec equipment values: <asp:Label ID="lbSelectedEquipmentValue" runat="server" Text="Air Dryer, Air Handling Unit"></asp:Label>
                                         </td>
                                     </tr>
                                    <tr>
                                        <td class="leftLabel">Equipment:</td>
                                        <td align="left" class="text7">        
                                             <asp:Panel ID="pnlEquipment" runat="server" style="max-height:150px;" ScrollBars="Auto">                           
                                            <asp:CheckBoxList ID="ckbxlstComponent" runat="server" DataTextField="SystemTitle"  DataValueField="ID" RepeatDirection="Horizontal" RepeatColumns="8" />
                                         </asp:Panel>     
                                       </td>
                                    </tr>--%>
                                     </asp:Panel>
                                      <tr>
                                         <td></td>
                                         <td style="color:darkgreen; font-size:.8em;">(seleted building values: <asp:Label ID="lbSelectedBuildingValue" runat="server"></asp:Label>)
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="leftLabel">Building</td>
                                        <td align="left" class="text7">    
                                             <asp:Panel ID="pnlBuilding" runat="server" style="max-height:150px;" ScrollBars="Auto">                                                          
                                            <asp:CheckBoxList ID="drplstBuilding" runat="server" DataTextField="Building" RepeatDirection="Horizontal" RepeatColumns="8" DataValueField="ID" OnSelectedIndexChanged="cklstBuildingSelectedIndexChangd" AutoPostBack="true" />
                                            </asp:Panel>     
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
                                <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="udpPnlDefault" runat="server">
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
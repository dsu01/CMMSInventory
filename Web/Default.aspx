<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Title="CMMS Inventory Main Page" %>


<asp:Content ID="ContentDefault" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
<asp:UpdatePanel runat="server" ID="udpPnlDefault">
   <Triggers>
                <asp:PostBackTrigger ControlID="btnExportToExcel" />
                <asp:PostBackTrigger ControlID="btnExportToPDF" />
             </Triggers> 
       <ContentTemplate> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="100%" valign="top">
                        <table width="100%" cellspacing="0" cellpadding="0" bgcolor="#eeeeee">
                            <tr>
                                <td class="redheading">Inventory Advanced Search</td>
                            </tr>           
                             <tr>
                                <td class="footer">* Select one or more criteria, then click the "Search Inventory" button to generate a list of equipment.
                                </td>
                             </tr> 
                             <tr>
                                <td width="100%" align="center">
                                <table class="QueryDataTable" cellpadding="3" cellspacing="0">
                                    <tr bgcolor="">                                             
                                             <td class="leftLabel">Type:</td>
                                            <td align="left">                                            
                                              <asp:DropDownList ID="drplstGroup" runat="server" Width="100%" SkinID="QueryTableDropList" DataTextField="Description" AppendDataBoundItems="true">
                                                <asp:ListItem Value="">(All)</asp:ListItem> 
                                                <asp:ListItem Text="Electrical" Value="Electrical"></asp:ListItem>
                                                <asp:ListItem Text="Mechanical" Value="Mechanical"></asp:ListItem>
                                                </asp:DropDownList>
                                               
                                                </td>
                                             <td class="leftLabel" width="15%">Building: </td>
                                                <td align="left" width="35%">                                              
                                                <asp:DropDownList ID="drplstBuilding" runat="server" Width="100%" DataTextField="Building" DataValueField="Building" SkinID="QueryTableDropList" AppendDataBoundItems="true">
                                                <asp:ListItem Value="">(All)</asp:ListItem> 
                                                  </asp:DropDownList>
                                                <ajaxToolkit:ListSearchExtender ID="ListSearchExtender1" runat="server"
                                                    TargetControlID="drplstBuilding" PromptCssClass="ListSearchExtenderPrompt">
                                                </ajaxToolkit:ListSearchExtender>    
						                    </td>
                                    </tr>
                                    <tr>
                                         <td class="leftLabel" width="15%">System:</td>
                                              <td align="left" width="35%">
                                                <asp:DropDownList ID="drplstSystem" runat="server" DataTextField="SystemTitle" DataValueField="SystemTitle" SkinID="QueryTableDropList" AppendDataBoundItems="true">
			                                        <asp:ListItem Value="">(All)</asp:ListItem>                          
                                                </asp:DropDownList>
                                            </td>
                                           <td class="leftLabel">Facility#:</td>
                                            <td align="left"><asp:TextBox ID="txtFacilityNum" runat="server" SkinID="MaxTextBox"></asp:TextBox> 
                                             <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                                TargetControlID="txtFacilityNum" 
                                                WatermarkText="e.g. 03475 or T00005" 
                                                WatermarkCssClass="watermarked" /> 
                                            </td>    
                                     </tr> 
						             <tr>   
						                    <td class="leftLabel">NIH Work Request#:</td>
						                    <td align="left"><asp:TextBox ID="txtWRNum" runat="server" SkinID="MaxTextBox"></asp:TextBox>
						                    
                                              <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE2" runat="server" 
                                                TargetControlID="txtWRNum" 
                                                WatermarkText="e.g. HQC70354" 
                                                WatermarkCssClass="watermarked" /> 
                                            </td>
                                            <td class="leftLabel">Facility# assigned?</td>
                                            <td align="left" class="text7">
                                                <asp:RadioButtonList ID="radioSelect" runat="server" RepeatDirection="Horizontal">
						                        <asp:ListItem Text="Un-Assigned" Value="1" Selected="True" />
						                        <asp:ListItem Text="Assigned" Value="2" />
						                        <asp:ListItem Text="All" Value="3" />
						                     </asp:RadioButtonList>
						                    </td>
    						           </tr>
    						           <tr>    
						                    <td colspan="4" align="center" class="text7">						                     
						                     <asp:Button runat="server" ID="btnSearch" CssClass="submitGreen" Text="Search Inventory" UseSubmitBehavior="false" OnClick="btnSearch_Click">
                                            </asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnReset" CssClass="submitRed" Text="Reset Criteria" UseSubmitBehavior="false" OnClick="btnReset_Click">
                                            </asp:Button>
                                              &nbsp;&nbsp;&nbsp;&nbsp;
						                    </td>    						                
						              </tr>	
                                </table>
                                <hr size="2" style="color:Green" />
                                <table width="100%">
                                    <tr class="text7">
                                        <td align="right">
                                         <asp:Button ID="btnExportToExcel" CssClass="btnExportToExcel" runat="Server" Text="Export To Excel"  OnClick="btnExportToExcel_OnClick" UseSubmitBehavior="False" CausesValidation="false" />
                                            <asp:Button ID="btnExportToPDF" CssClass="btnExportToPDF" runat="Server" Text="Export To PDF" OnClick="btnExportToPDF_OnClick" UseSubmitBehavior="False" CausesValidation="false" />
                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%">
                                           
                                    <%--    <asp:GridView id="gvInventory" DataSourceID="odsInventory" DataKeyNames="ID" SkinID="95widthGV" Runat="Server">
                                                <Columns> 
                                
                                     <asp:TemplateField HeaderText="Facility#" ItemStyle-Width="100"> 
                                           
                                            <ItemTemplate> 
                                               <a href='Equipment/EquipmentDet.aspx?ParentFacilitySysID=<%# Eval("ID") %>'>
                                                <img src='Image/icon_viewupdate.gif' alt='View/Edit' border='0' /><%# Eval("Facility#")%></a>
                                            </ItemTemplate> 								
                                        </asp:TemplateField>   
                                      <asp:BoundField HeaderText = "Facility ID" DataField="FacilityID" />
                                         <asp:BoundField HeaderText = "Facility Function" DataField="FacilityFunction" />
                                         
                                         <asp:BoundField HeaderText = "Facility System" DataField="FacilitySystem" />
                                         <asp:BoundField HeaderText = "Building" DataField="Building" />
                                         <asp:BoundField HeaderText = "Location" DataField="location" />
                                         <asp:BoundField HeaderText = "# of Equipments" DataField="TotalEquipments" ItemStyle-Width="120" />
                               
                                  </Columns> 
                            </asp:GridView>
                            --%>
                      
                             <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" OnSorting="ListView1_OnSorting" DataSourceID="odsInventory" OnItemDataBound="ListView1_ItemDataBound"> 
                                  <LayoutTemplate> 
                                        <table border="1" width="100%" cellpadding="1" cellspacing="1" style="font-size:smaller; text-align:left"> 
                                            <tr style="background-color:#cccccc">   
                                               <th align="left"><asp:LinkButton ID="lnkFacility" runat="server" 
                                                    CommandName="Sort" CommandArgument="Facility#">Facility#</asp:LinkButton></th> 
                                                 <th align="left"><asp:LinkButton ID="lnkName" runat="server" 
                                                        CommandName="Sort" CommandArgument="FacilityID">Facility ID</asp:LinkButton></th> 
                                                 <th align="left"><asp:LinkButton ID="LinkButton1" runat="server" 
                                                    CommandName="Sort" CommandArgument="FacilityFuction">Facility Function</asp:LinkButton></th> 
                                                 <th align="left"><asp:LinkButton ID="LinkButton2" runat="server" 
                                                        CommandName="Sort" CommandArgument="FacilitySystem">Facility System</asp:LinkButton></th> 
                                                 <th align="left"><asp:LinkButton ID="LinkButton3" runat="server" 
                                                    CommandName="Sort" CommandArgument="Building">Building</asp:LinkButton></th> 
                                                 <th align="left"><asp:LinkButton ID="LinkButton4" runat="server" 
                                                        CommandName="Sort" CommandArgument="Location">Location</asp:LinkButton></th> 
                                                 <th align="left"><asp:LinkButton ID="LinkButton5" runat="server" 
                                                        CommandName="Sort" CommandArgument="TotalEquipments"># of Equipments</asp:LinkButton></th> 
                                                 <th id="colAction" runat="server">Action</th>
                                            </tr> 
                                            <tr id="itemPlaceholder" runat="server"></tr> 
                                        </table> 
                                         <asp:DataPager runat="server" ID="DataPager" PageSize="20"> 
                                          <Fields> 
                                            <asp:TemplatePagerField> 
                                              <PagerTemplate> 
                                                &nbsp; 
                                                <asp:TextBox ID="CurrentRowTextBox" runat="server" SkinID="ShortTextBox" 
                                                     AutoPostBack="true" 
                                                     Text="<%# Container.StartRowIndex + 1%>" 
                                                     Columns="1" 
                                                     style="text-align:right" 
                                                     OnTextChanged="CurrentRowTextBox_OnTextChanged" /> 
                                                <font size="2">to
                                                <asp:Label ID="PageSizeLabel" runat="server" Font-Bold="true"
                                                     Text="<%# Container.StartRowIndex + Container.PageSize > Container.TotalRowCount ? Container.TotalRowCount : Container.StartRowIndex + Container.PageSize %>" /> 
                                                of
                                                <asp:Label ID="TotalRowsLabel" runat="server" Font-Bold="true"
                                                     Text="<%# Container.TotalRowCount %>" />  </font>
                                              </PagerTemplate> 
                                            </asp:TemplatePagerField> 
                                            <asp:NextPreviousPagerField ButtonCssClass="text7"
                                                 ShowFirstPageButton="true" ShowLastPageButton="true" 
                                                 FirstPageText="|<< " LastPageText=" >>|" 
                                                 NextPageText=" > " PreviousPageText=" < " /> 
                                          </Fields> 
                                        </asp:DataPager> 
                                    </LayoutTemplate> 
                                      <ItemTemplate> 
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <asp:HyperLink ID="hlFacNum" runat="Server" Text='<%# Eval("Facility#") %>'  />  
                                              
                                               <asp:Label runat="server" Visible="false" ID="lblHidFacilityGrp" Text='<%#Eval("FacilityGroup")%>'></asp:Label>
                                               <asp:Label runat="server" Visible="false" ID="lblHidFacilityID" Text='<%#Eval("ID")%>'></asp:Label>
                                           </td> 
                                           <td width="10%"><asp:Label runat="server" ID="lblFacID"><%#Eval("FacilityID")%></asp:Label></td>   
                                           <td width="20%"><asp:Label runat="server" ID="lblFacFunction"><%#Eval("FacilityFunction")%></asp:Label></td> 
                                           <td width="20%"><asp:Label runat="server" ID="lblFacSystem"><%#Eval("FacilitySystem")%></asp:Label></td> 
                                           <td width="10%"><asp:Label runat="server" ID="lblBuilding"><%#Eval("Building")%></asp:Label></td>  
                                           <td width="15%"><asp:Label runat="server" ID="lblLocation"><%#Eval("location")%></asp:Label></td> 
                                           <td width="10%"><asp:Label runat="server" ID="lblTotalEquipments"><%#Eval("TotalEquipments")%></asp:Label></td>  
                                           <td>
                                            <asp:Hyperlink id="hlAction" runat="server" Text='Action'                                    
                                                    NavigateUrl='<%# String.Format("Admin/AdminAction.aspx?FacId={0}", Eval("ID")) %>'>
                                                </asp:Hyperlink>
                                           </td>
                                          </tr> 
                                    </ItemTemplate> 
                                                                            
                                    <AlternatingItemTemplate> 
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <asp:HyperLink ID="hlFacNum" runat="Server" Text='<%# Eval("Facility#") %>'  />  
                                              
                                               <asp:Label runat="server" Visible="false" ID="lblHidFacilityGrp" Text='<%#Eval("FacilityGroup")%>'></asp:Label>
                                               <asp:Label runat="server" Visible="false" ID="lblHidFacilityID" Text='<%#Eval("ID")%>'></asp:Label>
                                           </td> 
                                           <td><asp:Label runat="server" ID="lblFacID"><%#Eval("FacilityID")%></asp:Label></td>   
                                           <td><asp:Label runat="server" ID="lblFacFunction"><%#Eval("FacilityFunction")%></asp:Label></td> 
                                           <td><asp:Label runat="server" ID="lblFacSystem"><%#Eval("FacilitySystem")%></asp:Label></td> 
                                           <td><asp:Label runat="server" ID="lblBuilding"><%#Eval("Building")%></asp:Label></td>  
                                           <td><asp:Label runat="server" ID="lblLocation"><%#Eval("location")%></asp:Label></td> 
                                           <td><asp:Label runat="server" ID="lblTotalEquipments"><%#Eval("TotalEquipments")%></asp:Label></td>  
                                            <td>
                                            <asp:Hyperlink id="hlAction" runat="server" Text='Action'                                    
                                                    NavigateUrl='<%# String.Format("Admin/AdminAction.aspx?FacId={0}", Eval("ID")) %>'>
                                                </asp:Hyperlink>
                                           </td>
                                          </tr> 
                                    </AlternatingItemTemplate> 
                                    </asp:ListView> 

                            
                             <asp:ObjectDataSource ID="odsInventory" runat="server" SelectMethod="GetFacilityList"
                                                TypeName="NIH.CMMS.Inventory.BPL.Facility.facility_logic">
                                 
                                    <SelectParameters>
                                            
                                           <asp:ControlParameter Type="String"
                                            Name="system"
                                            ControlID="drplstSystem" PropertyName="SelectedValue" />                       
                                           <asp:ControlParameter Type="String"
                                            Name="building"
                                            ControlID="drplstBuilding" PropertyName="SelectedValue" />   
                                            <asp:ControlParameter Type="String"
                                            Name="group"
                                            ControlID="drplstGroup" PropertyName="SelectedValue" />  
                                             <asp:ControlParameter Type="String"
                                            Name="facNo"
                                            ControlID="txtFacilityNum" />   
                                             <asp:ControlParameter Type="String"
                                            Name="wrnum"
                                            ControlID="txtWRNum" />
                                              <asp:ControlParameter Type="String"
                                            Name="status"
                                            ControlID="radioSelect" PropertyName="SelectedValue" />   
                                             
                                       </SelectParameters>
                              </asp:ObjectDataSource>
                              
                              	<%--<asp:gridview id="gvEquips" Visible="false" runat="server" AutoGenerateColumns="false"	DataSourceID="odsInventory">
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
				</asp:gridview>--%>
                                        </td>
                                    </tr>
                                </table>
                                
                                </td>
                            </tr>
                           
                             <tr>
                                <td colspan="4" align="center" class="text7">  
                                <asp:UpdateProgress ID="progress1" AssociatedUpdatePanelID="udpPnlDefault"  runat="server">
                                   <ProgressTemplate>
                                     <img src="Image/indicator.gif" alt="Please wait..." />&nbsp;Please wait...
                                      

                                   </ProgressTemplate>
                                </asp:UpdateProgress>  
                                </td>
                              </tr>
                             
                         </table> 
                         
                     </td> 
            
                </tr>
       
        
       
       
                  
       
            </table>
    </ContentTemplate> 
    </asp:UpdatePanel> 
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true"  CodeFile="Default2.aspx.cs" Inherits="Default2" Title="CMMS Inventory Main Page" %>


<asp:Content ID="ContentDefault" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
<asp:UpdatePanel runat="server" ID="udpPnlDefault">
   <Triggers>
                <asp:PostBackTrigger ControlID="btnExportToExcel" />
                <asp:PostBackTrigger ControlID="btnExportToPDF" />
             </Triggers> 
       <ContentTemplate> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="215">
                         <asp:Panel runat="server" id="TreeViewPanel">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                  <ContentTemplate> 
                         <asp:TreeView ID="TreeView1" SkinID="SearchTreeView" runat="server" ShowCheckBoxes="Leaf" Height="300px"
                             Width="200px" style="overflow: auto" ExpandDepth="1">
                              <Nodes>
                                <asp:TreeNode Text="Search">
                                  <asp:TreeNode Text="Type">
                                      <asp:TreeNode Text="Electrical" NavigateUrl="http://www.msn.com"/>
                                      <asp:TreeNode Text="Mechanical" NavigateUrl="http://www.msnbc.msn.com"/>
                                 </asp:TreeNode>
                                     <asp:TreeNode Text="Facility assigned">
                                      <asp:TreeNode Text="Un-Assigned" NavigateUrl="http://www.msn.com"/>
                                      <asp:TreeNode Text="Assigned" NavigateUrl="http://www.msnbc.msn.com"/>
                                       
                                 </asp:TreeNode>
                                  <asp:TreeNode Text="System">  
                                      <asp:TreeNode Text="Air Dryer" NavigateUrl="http://www.microsoft.com"/>
                                      <asp:TreeNode Text="Control Panel" NavigateUrl="http://www.asp.net"/>
                                       <asp:TreeNode Text="Air Dryer" NavigateUrl="http://www.microsoft.com"/>
                                      <asp:TreeNode Text="Control Panel" NavigateUrl="http://www.asp.net"/> <asp:TreeNode Text="Air Dryer" NavigateUrl="http://www.microsoft.com"/>
                                      <asp:TreeNode Text="Control Panel" NavigateUrl="http://www.asp.net"/>
                                       <asp:TreeNode Text="Air Dryer" NavigateUrl="http://www.microsoft.com"/>
                                      <asp:TreeNode Text="Control Panel" NavigateUrl="http://www.asp.net"/>
                                       <asp:TreeNode Text="Air Dryer" NavigateUrl="http://www.microsoft.com"/>
                                      <asp:TreeNode Text="Control Panel" NavigateUrl="http://www.asp.net"/>
                                     
                                    
                                    </asp:TreeNode>
                                  <asp:TreeNode Text="Building">  
                                      <asp:TreeNode Text="12" NavigateUrl="http://shopping.msn.com"/>
                                      <asp:TreeNode Text="13" NavigateUrl="http://autos.msn.com"/>
                                       <asp:TreeNode Text="12" NavigateUrl="http://shopping.msn.com"/>
                                      <asp:TreeNode Text="13" NavigateUrl="http://autos.msn.com"/> <asp:TreeNode Text="12" NavigateUrl="http://shopping.msn.com"/>
                                      <asp:TreeNode Text="13" NavigateUrl="http://autos.msn.com"/>
                                       <asp:TreeNode Text="12" NavigateUrl="http://shopping.msn.com"/>
                                      <asp:TreeNode Text="13" NavigateUrl="http://autos.msn.com"/>
                                       <asp:TreeNode Text="12" NavigateUrl="http://shopping.msn.com"/>
                                      <asp:TreeNode Text="13" NavigateUrl="http://autos.msn.com"/>
                                      
                                    </asp:TreeNode>
                               
                               
                             
                               </asp:TreeNode>
                              </Nodes>
                            </asp:TreeView>
                                        </ContentTemplate> 
                                </asp:UpdatePanel> 
                        </asp:Panel>
                    </td>
                    <td valign="top">
                        <table width="100%" cellspacing="0" cellpadding="0" bgcolor="#eeeeee">
                          
                             <tr>
                                <td width="100%" align="center">
                                <table class="QueryDataTable" cellpadding="3" cellspacing="0">
                                      <tr>
                                       
                                        <td class="leftLabel">NIH Work Request#:</td>
						                    <td align="left"><asp:TextBox ID="txtWRNum" runat="server" SkinID="MaxTextBox"></asp:TextBox>
                                              <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE2" runat="server" 
                                                TargetControlID="txtWRNum" 
                                                WatermarkText="e.g. HQC70354" 
                                                WatermarkCssClass="watermarked" /> 
                                            </td>
                                           <td class="leftLabel">Facility#:</td>
                                            <td align="left"><asp:TextBox ID="txtFacilityNum" runat="server" SkinID="MaxTextBox"></asp:TextBox> 
                                             <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                                TargetControlID="txtFacilityNum" 
                                                WatermarkText="e.g. 03475 or T00005" 
                                                WatermarkCssClass="watermarked" /> 
                                            </td>    
                                    
    						            
						                    <td class="text7">						                     
						                     <asp:Button runat="server" ID="btnSearch" CssClass="submitGreen" Text="Quick Search" UseSubmitBehavior="false" >
                                            </asp:Button>
						                    </td>    						                
						              </tr>	
                                </table>
                                <br/>
                                <table width="100%">
                                    <tr class="text7">
                                        <td align="right">
                                         <asp:Button ID="btnExportToExcel" CssClass="btnExportToExcel" runat="Server" Text="Export To Excel"  UseSubmitBehavior="False" CausesValidation="false" />
                                            <asp:Button ID="btnExportToPDF" CssClass="btnExportToPDF" runat="Server" Text="Export To PDF" UseSubmitBehavior="False" CausesValidation="false" />
                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%">
                        
                            <table border="1" width="100%" cellpadding="1" cellspacing="1" style="font-size:smaller; text-align:left"> 
                                            <tr style="background-color:#cccccc">   
                                               <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_lnkFacility" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$lnkFacility','')">Facility#</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_lnkName" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$lnkName','')">Facility ID</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton1" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton1','')">Facility Function</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton2" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton2','')">Facility System</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton3" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton3','')">Building</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton4" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton4','')">Location</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton5" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton5','')"># of Equipments</a></th> 
                                                 <th id="ctl00_ContentPlaceHolderMain_ListView1_colAction">Action</th>
	
                                            </tr> 
                                             
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=9">T00009</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblFacID">asdasd069055125212asd</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblFacFunction">dasdasdasd069055125212</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblFacSystem">Air Handling Unit</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblLocation">sadasda</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblTotalEquipments">19</span></td>  
                                           <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_hlAction" href="Admin/AdminAction.aspx?FacId=9">Action</a>
                                           </td>
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=10">T00010</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblFacID">addada</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblFacFunction">Test function</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblFacSystem">Air Handling Unit</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblLocation">dasd</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblTotalEquipments">5</span></td>  
                                            <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_hlAction" href="Admin/AdminAction.aspx?FacId=10">Action</a>
                                           </td>
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=12">T00012</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblFacID">Test equip id</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblFacFunction">Test function</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblFacSystem">Control Panel</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblLocation">Test Location</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblTotalEquipments">0</span></td>  
                                           <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_hlAction" href="Admin/AdminAction.aspx?FacId=12">Action</a>
                                           </td>
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=13">T00013</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblFacID">yyyy</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblFacFunction">Test function sfsdf sfsdf sfsdfsdf</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblFacSystem">Control Panel</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblLocation">Test Location</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblTotalEquipments">0</span></td>  
                                            <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_hlAction" href="Admin/AdminAction.aspx?FacId=13">Action</a>
                                           </td>
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=14">T00014</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblFacID">Test FacilityID if not</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblFacFunction">Test function</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblFacSystem">Emergency Light</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblLocation">Test Location</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblTotalEquipments">0</span></td>  
                                           <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_hlAction" href="Admin/AdminAction.aspx?FacId=14">Action</a>
                                           </td>
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=16">T00016</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblFacID">dfsf</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblFacFunction">fsf</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblFacSystem">Air Dryer</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblLocation">sdfs</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblTotalEquipments">0</span></td>  
                                            <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_hlAction" href="Admin/AdminAction.aspx?FacId=16">Action</a>
                                           </td>
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=17">T00017</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblFacID">sdfsdf</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblFacFunction">dfsdf</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblFacSystem">Air Dryer</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblLocation">dfsd</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblTotalEquipments">0</span></td>  
                                           <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_hlAction" href="Admin/AdminAction.aspx?FacId=17">Action</a>
                                           </td>
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=18">T00018</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblFacID">sdfsdf</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblFacFunction">sdds</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblFacSystem">Air Dryer</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblLocation">sdfsd</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblTotalEquipments">0</span></td>  
                                            <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_hlAction" href="Admin/AdminAction.aspx?FacId=18">Action</a>
                                           </td>
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=19">T00019</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblFacID">sfsfsdf</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblFacFunction">sfsdfsdf</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblFacSystem">Control Panel</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblLocation">sfdsfsdf</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblTotalEquipments">0</span></td>  
                                           <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_hlAction" href="Admin/AdminAction.aspx?FacId=19">Action</a>
                                           </td>
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=6">T00ff</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblFacID">Test</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblFacFunction">Test function</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblFacSystem">Air Dryer</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblLocation">Test Location</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblTotalEquipments">10</span></td>  
                                            <td>
                                            <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_hlAction" href="Admin/AdminAction.aspx?FacId=6">Action</a>
                                           </td>
                                          </tr> 
                                     
                                        </table> 

                            
                           
                              
                        
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

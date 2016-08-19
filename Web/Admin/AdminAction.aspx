<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="AdminAction.aspx.cs" Inherits="Admin_AdminAction" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<table cellspacing="0" cellpadding="5" width="100%" border="0">
    <tr>
        <td colspan="4" align="center" class="redheading">Facility <asp:Label ID="lbFacNum" runat="server"></asp:Label> Information<br /><br /></td>
    </tr>
    <tr>
        <td width="25%" class="leftLabel" align="right">Facility#:</td>
        <td width="25%" class="text7">
        <asp:TextBox ID="txtFacNum" runat="server" MaxLength="50"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rqvFacNum" runat="server" ControlToValidate="txtFacNum" Display="Dynamic" ErrorMessage="Facility Number is required"></asp:RequiredFieldValidator>
        </td>
        <td width="25%" class="leftLabel">System:</td>
        <td width="25%"><asp:DropDownList ID="drplstSystem" runat="server" SkinID="midDropDown" DataTextField="SystemTitle" DataValueField="SystemTitle" AppendDataBoundItems="true">
	    <asp:ListItem Value="">--</asp:ListItem>                          
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rqSystem" runat="server" ControlToValidate="drplstSystem" Display="Dynamic" ErrorMessage="System is required" InitialValue=""></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
       <td class="leftLabel">Facility ID:</td>
        <td class="text7">
        <asp:TextBox ID="txtFacilityID" runat="server" MaxLength="50"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rqvFacID" runat="server" ControlToValidate="txtFacilityID" Display="Dynamic" ErrorMessage="Facility ID is required"></asp:RequiredFieldValidator>
        </td>
         <td class="leftLabel">Function:</td>
        <td><asp:TextBox ID="txtFunction" runat="server" MaxLength="50"  class="text7"></asp:TextBox>
        </td>
    </tr>
       <tr>     
        <td class="leftLabel">Building:</td>
        <td><asp:DropDownList ID="drplstBuilding" runat="server" SkinID="noCssDropDown" DataTextField="Building" DataValueField="Building" AppendDataBoundItems="true">
	    <asp:ListItem Value="">--</asp:ListItem>                          
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rqBuilding" runat="server" ControlToValidate="drplstBuilding" Display="Dynamic" ErrorMessage="Building is required" InitialValue=""></asp:RequiredFieldValidator>
        </td>
        <td class="leftLabel">Floor:</td>
        <td class="text7"><asp:TextBox ID="txtFloor" MaxLength="10" runat="server"></asp:TextBox></td>
   </tr>
   <tr>
        <td class="leftLabel">Location:</td>
        <td class="text7"><asp:TextBox ID="txtLocation" MaxLength="50" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" ErrorMessage="Location is required"></asp:RequiredFieldValidator>
        </td>
        <td class="leftLabel">Work Request#:</td>
        <td class="text7"><asp:TextBox ID="txtWRNum" MaxLength="50" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td class="leftLabel">Status:</td>
        <td>
        <asp:DropDownList ID="drplstStatus" runat="server" SkinID="noCssDropDown" DataTextField="Status" DataValueField="Status" AppendDataBoundItems="true">
	         <asp:ListItem Value="">--</asp:ListItem>                                
        </asp:DropDownList>
         <asp:RequiredFieldValidator ID="rqvStatus" runat="server" ControlToValidate="drplstStatus" Display="Dynamic" ErrorMessage="Status is required" InitialValue=""></asp:RequiredFieldValidator>
        </td>
        <td colspan="2" class="leftLabel">AAALAC<asp:CheckBox ID="ckAAALAC" runat="server" />
        &nbsp;&nbsp;&nbsp;BSL<asp:CheckBox ID="ckBSL" runat="server" />&nbsp;&nbsp;&nbsp;TJC<asp:CheckBox ID="ckTJC" runat="server" /></td>
    </tr>
     <tr>
        <td class="leftLabel">Comments:</td>
        <td colspan="3" class="text7">
        <asp:TextBox ID="txtComments" MaxLength="255" runat="server" TextMode="MultiLine" Rows="3" Columns="55"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="center" class="text7">
         <asp:HiddenField ID="hidFacSystemID" runat="server" Value="-1" />   
         <asp:Button runat="server" ID="btnSave" CssClass="submitGreen" Text="Save Change" OnClientClick="return confirm('Are you sure that you want to save the change?');" OnClick="btnFinish_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="submitRed" CssClass="submitRed" Text="Reset" />
        <br /></td>        
    </tr>
   
  </table>
</asp:Content>


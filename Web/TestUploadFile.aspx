<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestUploadFile.aspx.cs" Inherits="TestUploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
            <hr />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="File Name" />
            </Columns>
         </asp:GridView>

    </div>
    </form>
</body>
</html>



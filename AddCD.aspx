<%@ Page Title="Add New CD" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddCD.aspx.cs" Inherits="BCDManager.AddCD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <asp:SqlDataSource ID="sdsCDs" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\BCDManager.accdb;Persist Security Info=True" InsertCommand="INSERT INTO [CDs] ([Title], [Artist], [PYear], [Duration]) VALUES (?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [CDs]">
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Artist" Type="String" />
            <asp:Parameter Name="PYear" Type="Int32" />
            <asp:Parameter Name="Duration" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblInfo" runat="server" Text="" CssClass="text-info"></asp:Label>
    <div class="card">
        <div class="card-body">
            <div class="form-group">
                <label>Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" required="true" EnableViewState="False"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Artist</label>
                <asp:TextBox ID="txtArtist" runat="server" CssClass="form-control" required="true" EnableViewState="False"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Publish Year</label>
                <asp:TextBox ID="txtPYear" runat="server" CssClass="form-control" TextMode="Number" required="true" EnableViewState="False"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Duration</label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" TextMode="Number" required="true" EnableViewState="False"></asp:TextBox>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" />
        </div>
    </div>
</asp:Content>

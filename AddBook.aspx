<%@ Page Title="Add New Book" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="BCDManager.AddBook" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:SqlDataSource ID="sdsBooks" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\BCDManager.accdb;Persist Security Info=True" InsertCommand="INSERT INTO [Books] ([Title], [Author], [Publisher], [PageNumber], [CoverImage]) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [Books]">
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Publisher" Type="String" />
            <asp:Parameter Name="PageNumber" Type="Int32" />
            <asp:Parameter Name="CoverImage" Type="String" />
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
                    <label>Author</label>
                    <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" required="true" EnableViewState="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Publisher</label>
                    <asp:TextBox ID="txtPublisher" runat="server" CssClass="form-control" required="true" EnableViewState="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Page Number</label>
                    <asp:TextBox ID="txtPageNumber" runat="server" CssClass="form-control" TextMode="Number" required="true" EnableViewState="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Cover Image</label>
                    <div class="table-responsive">
                        <asp:RadioButtonList ID="radioListCover" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                    </div>
                </div>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" />
            </div>
        </div>
</asp:Content>


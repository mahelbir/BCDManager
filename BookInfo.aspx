<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookInfo.aspx.cs" Inherits="BCDManager.BookInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <asp:GridView ID="gridBookInfo" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="sdsBookInfo">
        <Columns>
            <asp:ImageField DataImageUrlField="CoverImage" DataImageUrlFormatString="/images/{0}">
                <ControlStyle CssClass="img-fluid" Width="200px" />
            </asp:ImageField>
            <asp:BoundField DataField="BookID" HeaderText="Book No" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:BoundField DataField="PageNumber" HeaderText="Page Number" SortExpression="PageNumber" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsBookInfo" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\BCDManager.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [Books] WHERE ([BookID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="BookID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

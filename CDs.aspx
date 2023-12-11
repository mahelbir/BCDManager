<%@ Page Title="List of All CDs" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CDs.aspx.cs" Inherits="BCDManager.CDs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CDID" DataSourceID="CDsTable" PageSize="5" AllowPaging="True" AllowSorting="True">
    <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="CDID" DataNavigateUrlFormatString="CDInfo.aspx?id={0}" DataTextField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
        <asp:BoundField DataField="PYear" HeaderText="Year" SortExpression="PYear" />
        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="CDsTable" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\BCDManager.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [CDs]"></asp:SqlDataSource>
    
</asp:Content>

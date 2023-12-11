<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CDInfo.aspx.cs" Inherits="BCDManager.CDInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <asp:GridView ID="gridCDInfo" runat="server" AutoGenerateColumns="False" DataKeyNames="CDID" DataSourceID="sdsCDInfo">
        <Columns>
            <asp:BoundField DataField="CDID" HeaderText="CD No" InsertVisible="False" ReadOnly="True" SortExpression="CDID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="PYear" HeaderText="Year" SortExpression="PYear" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsCDInfo" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\BCDManager.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [CDs] WHERE ([CDID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="CDID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

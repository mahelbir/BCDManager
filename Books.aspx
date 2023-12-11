<%@ Page Title="List of All Books" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BCDManager.Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="BooksTable" PageSize="5">
        <Columns>
            <asp:ImageField DataAlternateTextField="Title" DataImageUrlField="CoverImage" DataImageUrlFormatString="/images/{0}" ControlStyle-CssClass="img-fluid" ControlStyle-Width="100">
            </asp:ImageField>
            <asp:HyperLinkField DataNavigateUrlFields="BookID" DataNavigateUrlFormatString="BookInfo.aspx?id={0}" DataTextField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:BoundField DataField="PageNumber" HeaderText="Page Number" SortExpression="PageNumber" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="BooksTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [CoverImage], [Title], [Author], [Publisher], [PageNumber], [BookID] FROM [Books]"></asp:SqlDataSource>
&nbsp;
</asp:Content>

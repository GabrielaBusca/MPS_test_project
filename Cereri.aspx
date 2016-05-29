<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cereri.aspx.cs" Inherits="Cereri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetProfile.nume, AspNetProfile.avatar, AspNetProfile.username, AspNetPrieteni.data FROM AspNetPrieteni INNER JOIN AspNetProfile ON AspNetPrieteni.friend1 = AspNetProfile.user_id"></asp:SqlDataSource>
    <h2>Cereri de prietenie fără răspuns</h2>
    <ul class="list-group">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <li class="list-group-item">
        Trimisă de <%# Eval("nume") %> pe <%# Eval("data") %>. Vezi <a href="profile?user=<%#Eval("username") %>">profilul</a> și răspunde cererii.
        </li>
    </ItemTemplate>
    </asp:Repeater>
    </ul>
    </asp:Content>


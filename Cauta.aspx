<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cauta.aspx.cs" Inherits="Cauta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <h2>Rezultatele căutării pentru <%: Request.Params["q"] %></h2>
<asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" runat="server"></asp:SqlDataSource>
   <table class='table table-striped firstpage'><tbody>
  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
      <FooterTemplate>
          <div runat="server" visible="<%# Repeater1.Items.Count == 0%>"><br /><h4 style="margin-left: 10px">Nu s-a găsit niciun rezultat!</h4></div>
      </FooterTemplate>
<ItemTemplate>
<tr style="vertical-align: middle">
<td style="width: 50px"><div style="clear: both">
<img src="images/<%# Eval("avatar") %>" style="width: 40px; margin-right: 10px;" alt="Avatar" />
<td><article>
    <a href="VeziAnunt?id=<%#Eval("id")%>"><%#Eval("titlu")%></a> adăugat de <a href="profile?user=<%#Eval("username") %>"><%#Eval("username") %></a> pe <%#Eval("data")%> în <%#Eval("denumire") %>

</article></td>

</tr></ItemTemplate>
  </asp:Repeater>
  </tbody></table>
</asp:Content>


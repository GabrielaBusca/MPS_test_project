<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AnunturileMele.aspx.cs" Inherits="AnunturileMele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Anunțurile mele</h2>
<asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" runat="server"></asp:SqlDataSource>
<table class='table firstpage'><tbody>
  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
      
<ItemTemplate>
<tr style="vertical-align: middle">
<td style="width: 50px"><div style="clear: both">
<img src="images/<%# Eval("avatar") %>" style="width: 40px; margin-right: 10px;" alt="Avatar" />
<td><article>
    <a href="VeziAnunt?id=<%#Eval("id")%>"><%#Eval("titlu")%></a> adăugat de <a href="profile?user=<%#Eval("username") %>"><%#Eval("username") %></a> pe <%#Eval("data")%> în <%#Eval("denumire") %>
</article></td>
</tr></ItemTemplate>
        <FooterTemplate>
        </tbody></table>
   <div runat="server" visible="<%# Repeater1.Items.Count == 0%>"><h4 style="margin-left: 10px">Nu ai niciun anunț publicat!</h4></div>

    <table><tbody>
        </FooterTemplate>
  </asp:Repeater>
  </tbody></table>
   <div style="overflow: hidden; text-align: center">
        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
            <ItemTemplate>
                    <asp:LinkButton ID="btnPage" 
        style= <%# ((Container.DataItem.ToString()).Equals((PageNumber+1).ToString())) ?
"padding:8px; margin:2px; color: black; font:tahoma; font-weight: 500;" : 
"padding:8px; margin:2px; font:tahoma; font-weight: 500;" %> 
    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
        runat="server"><%# Container.DataItem %>
                    </asp:LinkButton>
                
           </ItemTemplate>
        </asp:Repeater>
   </div>

</asp:Content>


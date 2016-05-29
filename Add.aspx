<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <h2>Adaugă anunț</h2>
    <br />
    <div class="form">
        <div class="form-group row" runat="server">
        <asp:Label ID="title" runat="server" CssClass="col-xs-2 control-label" Text="Titlu*"></asp:Label>
        <div class="col-xs-10"><asp:TextBox ID="titlu" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox></div>
        </div>    <span style="color: red; font-weight: bold"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Câmp obligatoriu" ControlToValidate="titlu" Display="Dynamic"></asp:RequiredFieldValidator></span>
        
        <div class="form-group row" runat="server"><asp:Label ID="desc" CssClass="col-xs-2 control-label" runat="server" Text="Descriere*"></asp:Label>
        <div class="col-xs-10"><asp:TextBox ID="descriere" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox></div>
        </div>
        
            <span style="color: red; font-weight: bold"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Câmp obligatoriu" ControlToValidate="descriere" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <div class="form-group row" runat="server">
        <asp:Label ID="cat" runat="server" CssClass="col-xs-2 control-label" Text="Catagorie"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetCategorii]"></asp:SqlDataSource>
            <div class="col-xs-10"><asp:DropDownList ID="categ" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="denumire" DataValueField="Id"></asp:DropDownList>
              
              </div></div>
        <div class="form-group row" runat="server">
        <asp:Label ID="viz" runat="server" CssClass="col-xs-2 control-label" Text="Vizibilitate"></asp:Label>
        <div class="col-xs-10"><asp:DropDownList ID="vizib" CssClass="form-control" runat="server" >
            <asp:ListItem value="0" selected="True">Public</asp:ListItem>
            <asp:ListItem value="1">Prieteni</asp:ListItem>
            <asp:ListItem value="2">Privat</asp:ListItem>
                               </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetCategorii]"></asp:SqlDataSource>
              </div></div>
        
       
    <div class="form-group row" runat="server">
        <asp:Label ID="dataexp" runat="server" CssClass="col-xs-2 control-label" Text="Dată expirare"></asp:Label>
      <div class="col-xs-10">  <asp:TextBox ID="data" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
          </div></div>
        <span style="color: red; font-weight: bold"> <asp:CompareValidator ID="CompareValidator3" runat="server" 
                        ControlToValidate="data" ErrorMessage="Data de expirare nu poate fi în trecut" 
                        Operator="GreaterThanEqual" Type="Date" Display="Dynamic">
</asp:CompareValidator></span>
   <%--  <div class="form-group row" runat="server">
        <asp:Label ID="max" runat="server" CssClass="col-xs-2 control-label" Text="Numar maxim"></asp:Label>
       <div class="col-xs-10"> <asp:TextBox ID="max1" CssClass="form-control numar" runat="server"></asp:TextBox>
          </div></div>--%>
 <div class="form-group row">
  <div class="col-xs-2">  <asp:Button ID="Adauga" runat="server" Text="Trimite" CssClass="btn btn-default" OnClick="Adauga_Click" /></div>
        </div>
        <div class="col-offset-xs-10" style="visibility: hidden">Trimite</div>
    </div>
</asp:Content>


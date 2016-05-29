<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CautareAvansata.aspx.cs" Inherits="CautareAvansata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>.lista label {
    font-weight: normal;
    display: inline-block;
    padding-right: 10px;
    padding-left: 2px;
}
    </style>
  <!--  - cautare dupa un termen exact / care contine
    - in titlu / descriere / autor
    - dintr-o categorie
    - intr-un interval !-->
     <h2>Căutare avansată</h2>
    <br />
    <div class="form">
        <div class="form-group row" runat="server">
        <asp:Label ID="title" runat="server" CssClass="col-xs-2 control-label" Text="Termenii căutați"></asp:Label>
        <div class="col-xs-10"><asp:TextBox ID="titlu" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Câmp obligatoriu" ControlToValidate="titlu" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group row" runat="server">
        <asp:Label ID="Label2" runat="server" CssClass="col-xs-2 control-label" Text="Caută după"></asp:Label>
        <div class="col-xs-10">
            <asp:RadioButtonList ID="RadioButtonList2" CssClass="lista" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" TabIndex="50" CellSpacing="50"><asp:ListItem Text=" titlu" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text=" descriere" Value="2"></asp:ListItem><asp:ListItem Text=" autor" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        </div>
        <div class="form-group row" runat="server">
        <asp:Label ID="Label1" runat="server" CssClass="col-xs-2 control-label" Text="Rezultate"></asp:Label>
        <div class="col-xs-10">
            <asp:RadioButtonList ID="RadioButtonList1" CssClass="lista" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" TabIndex="50" CellSpacing="50"><asp:ListItem Text=" care conțin termenii" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text=" exacte" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        </div>
        
        <div class="form-group row" runat="server">
        <asp:Label ID="cat" runat="server" CssClass="col-xs-2 control-label" Text="Catagorie"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetCategorii]"></asp:SqlDataSource>
            <div class="col-xs-10"><asp:DropDownList ID="categ" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="denumire" DataValueField="Id" AppendDataBoundItems="True"></asp:DropDownList>
              
              </div></div>
        
       
    <div class="form-group row" runat="server">
        <asp:Label ID="dataexp" runat="server" CssClass="col-xs-2 control-label" Text="Publicat"></asp:Label>
      <div class="col-xs-10">  
            <asp:RadioButtonList ID="RadioButtonList3" CssClass="lista" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" TabIndex="50" CellSpacing="50"><asp:ListItem Text=" exact pe" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text=" înainte de" Value="2"></asp:ListItem><asp:ListItem Text=" după" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
          <asp:TextBox ID="data" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
          </div></div>
   <%--  <div class="form-group row" runat="server">
        <asp:Label ID="max" runat="server" CssClass="col-xs-2 control-label" Text="Numar maxim"></asp:Label>
       <div class="col-xs-10"> <asp:TextBox ID="max1" CssClass="form-control numar" runat="server"></asp:TextBox>
          </div></div>--%>
 <div class="form-group row">
  <div class="col-xs-2">  <asp:Button ID="Caută" runat="server" Text="Trimite" CssClass="btn btn-default" OnClick="Adauga_Click"/></div>
        </div>
        <div class="col-offset-xs-10" style="visibility: hidden">Trimite</div>
    </div>
</asp:Content>


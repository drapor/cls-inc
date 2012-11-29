<<<<<<< HEAD
﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="rapport.aspx.vb" Inherits="Page_Admin_rapport" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" Runat="Server">
    <asp:Label ID="lblTitrePage" runat="server" Text="Rapports" Font-Size="24px" Font-Bold="true" />
    <br />
    <br />
    <br />
    <asp:Label ID="lblType" runat="server" Text="Choisir le type de rapport:"></asp:Label>
    <asp:DropDownList ID="dropDownType" runat="server" Width="250px" SkinID="ddlBlue" AutoPostBack="True">
        <asp:ListItem Value="0" Text="Membre" Selected="True"></asp:ListItem>
        <asp:ListItem Value="1" Text="Employé"></asp:ListItem>
        <asp:ListItem Value="2" Text="Animateur"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <div id="contentStart"> 
    <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewMembre" runat="server">
    <asp:GridView ID="listeMembre" runat="server" DataSourceID="dsMembre" DataKeyNames="idMembre"
        AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde" AlternatingRowStyle-ForeColor="#FFFFFF"
        CssClass="gridView">
        <Columns>
            <asp:BoundField HeaderText="Prénom" DataField="prenomMembre" />
            <asp:BoundField HeaderText="Nom" DataField="nomMembre" />
            <asp:BoundField HeaderText="Courriel" DataField="courriel" />
            <asp:BoundField HeaderText="Adresse" DataField="adresse" />
            <asp:BoundField HeaderText="Ville" DataField="ville" />
            <asp:BoundField HeaderText="Téléphone" DataField="telephoneMembre" />
        </Columns>
    </asp:GridView>
    </asp:View>
    <asp:View ID="viewEmploye" runat="server">
    <asp:GridView ID="listeEmploye" runat="server" DataSourceID="dsEmploye" DataKeyNames="idMembre"
        AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde" AlternatingRowStyle-ForeColor="#FFFFFF"
        CssClass="gridView">
        <Columns>
            <asp:BoundField HeaderText="Prénom" DataField="prenomMembre" />
            <asp:BoundField HeaderText="Nom" DataField="nomMembre" />
            <asp:BoundField HeaderText="Courriel" DataField="courriel" />
            <asp:BoundField HeaderText="Adresse" DataField="adresse" />
            <asp:BoundField HeaderText="Ville" DataField="ville" />
            <asp:BoundField HeaderText="Téléphone" DataField="telephoneMembre" />
        </Columns>
    </asp:GridView>
    </asp:View>
    <asp:View ID="viewAnimateur" runat="server">
    <asp:GridView ID="listeAnimateur" runat="server" DataSourceID="dsAnimateur" DataKeyNames="idMembre"
        AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde" AlternatingRowStyle-ForeColor="#FFFFFF"
        CssClass="gridView">
        <Columns>
            <asp:BoundField HeaderText="Prénom" DataField="prenomMembre" />
            <asp:BoundField HeaderText="Nom" DataField="nomMembre" />
            <asp:BoundField HeaderText="Courriel" DataField="courriel" />
            <asp:BoundField HeaderText="Adresse" DataField="adresse" />
            <asp:BoundField HeaderText="Ville" DataField="ville" />
            <asp:BoundField HeaderText="Téléphone" DataField="telephoneMembre" />
        </Columns>
    </asp:GridView>
    </asp:View>
    </asp:MultiView>
    </div>
    <br />
    <a href="javascript:PrintThisPage();"  >Printer Friendly Version</a> 
    <%--<asp:Button ID="Button1" runat="server" Text="Imprimer ce rapport" PostBackUrl="javascript:PrintThisPage();"/>--%>

    <script language="javascript">

//        function PrintThisPage() {
//            var sOption = "toolbar=yes,location=no,directories=yes,menubar=yes,";
//            sOption += "scrollbars=yes,width=750,height=600,left=100,top=25";

//            var winprint = window.open("print.aspx", "Print", sOption);

//            winprint.focus();
//        }

    function PrintThisPage() 
{ 
   var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
       sOption+="scrollbars=yes,width=750,height=600,left=100,top=25"; 

   var sWinHTML = document.getElementById('contentStart').innerHTML; 
   
   var winprint=window.open("","",sOption); 
       winprint.document.open(); 
       winprint.document.write('<html><LINK href=/eggheadcafe.css rel=Stylesheet><body>'); 
       winprint.document.write(sWinHTML);          
       winprint.document.write('</body></html>'); 
       winprint.document.close(); 
       winprint.focus(); 
}
</script>

    <asp:EntityDataSource ID="dsMembre" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.familleID"
        where="it.RoleJeu_idRole = 3 OR it.RoleJeu_idRole = 4 OR it.RoleJeu_idRole = 5">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsAnimateur" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.nomMembre"
        where="it.RoleJeu_idRole = 6">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsEmploye" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.nomMembre"
        where="it.RoleJeu_idRole = 2">
    </asp:EntityDataSource>

</asp:Content>

=======
﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="rapport.aspx.vb" Inherits="Page_Admin_rapport" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" Runat="Server">
    <asp:Label ID="lblTitrePage" runat="server" Text="Rapports" Font-Size="24px" Font-Bold="true" />
    <br />
    <br />
    <br />

</asp:Content>

>>>>>>> 64ec71e1f69872a6ad41842e2afe5c4f1c3657f0

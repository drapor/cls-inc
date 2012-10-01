<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="member_family.aspx.vb" Inherits="Page_Client_client_membre_famille" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerContenuClient">


<div class="titleClient">
Bonjour, <asp:Label ID="lblNomUtilisateur" runat="server" Text="Fanny Coté"></asp:Label>
</div>

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
    <div class="textMenuRight"><asp:Label ID="lblModifier" runat="server" Text="Éditer" ></asp:Label></div>
</div>
</div>  


<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblHistoriqueAbonnement" runat="server" Text="Historique des abonnements"></asp:Label>
</div>
</div>  




</div>

</asp:Content>


<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_client.aspx.vb" Inherits="Page_Client_home_client" Theme="Original"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuClient">


<div class="titleClient">
Bonjour, <asp:Label ID="lblNomUtilisateur" runat="server" Text="Roger Coté"></asp:Label>
</div>

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
    <div class="textMenuRight"><asp:Label ID="lblModifier" runat="server" Text="Modifier" ></asp:Label></div>
</div>
</div>  

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblCourrielMDP" runat="server" Text="Courriel et mot de passe"></asp:Label>
</div>
</div>  

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblMembreFamille" runat="server" Text="Membre(s) de la famille"></asp:Label>
    <div class="textMenuRight"><asp:Label ID="lblAjouter" runat="server" Text="Ajouter" ></asp:Label></div>
</div>
</div>  

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblHistoriqueAbonnement" runat="server" Text="Historique des abonnements"></asp:Label>
</div>
</div>  




</div>
</asp:Content>


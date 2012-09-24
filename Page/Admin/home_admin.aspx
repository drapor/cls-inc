<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_admin.aspx.vb" Inherits="Page_Admin_home_admin" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin contenuHeight">


<div class="titleAdmin">
    <asp:LinkButton ID="lnkAccueilAdmin" runat="server" CssClass="titleAdmin" PostBackUrl="~/Page/Admin/home_admin.aspx">Accueil Admin</asp:LinkButton>
</div>

<div class="menuSectionAdmin">
    <asp:Label ID="lblCours" runat="server" Text="Cours"></asp:Label>
</div>  

<div class="menuSectionAdmin">
    <asp:Label ID="lblGroupe" runat="server" Text="Groupe"></asp:Label>
</div>  

<div class="menuSectionAdmin">
    <asp:Label ID="lblTarifs" runat="server" Text="Tarifs"></asp:Label>
</div>  

<div class="contenuAdmin">
    <asp:LinkButton ID="lnkAjouterCours" runat="server">Ajouter un cours</asp:LinkButton><br />
    <asp:LinkButton ID="lnkModifierCours" runat="server">Modifier un cours</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerCours" runat="server">Supprimer un cours</asp:LinkButton><br/>
</div>

<div class="contenuAdmin">
    <asp:LinkButton ID="lnkAjouterGroupe" runat="server">Ajouter un groupe</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkModifierGroupe" runat="server">Modifier un groupe</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerGroupe" runat="server">Supprimer un groupe</asp:LinkButton><br/>
</div>

<div class="contenuAdmin">
    <asp:LinkButton ID="lblTarif" runat="server">Modifier les tarifs</asp:LinkButton><br/>
</div>

<div class="menuSectionAdmin">
    <asp:Label ID="lblEmploye" runat="server" Text="Employé"></asp:Label>
</div>  

<div class="menuSectionAdmin">
    <asp:Label ID="lblHoraire" runat="server" Text="Horaire"></asp:Label>
</div>  


<div class="menuSectionAdmin">
    <asp:Label ID="lblPermission" runat="server" Text="Permission"></asp:Label>
</div>

<div class="contenuAdmin">
    <asp:LinkButton ID="lnkAjouterEmploye" runat="server" PostBackUrl="~/Page/Admin/home_admin_employe_add.aspx">Ajouter employé</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkModifierEmploye" runat="server">Modifier employé</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerEmploye" runat="server">Supprimer employé</asp:LinkButton><br/>
</div>


<div class="contenuAdmin">
    <asp:LinkButton ID="lnkAjouterHoraire" runat="server">Ajouter un horaire</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkModifierHoraire" runat="server">Modifier horaire</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerHoraire" runat="server">Supprimer horaire</asp:LinkButton><br/>
</div>


<div class="contenuAdmin">
    <asp:LinkButton ID="lnkModifierPermission" runat="server" PostBackUrl="~/Page/Admin/home_admin_permission.aspx">Modifier les permissions</asp:LinkButton><br/>
</div>

</div>
</asp:Content>


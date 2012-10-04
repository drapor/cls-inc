<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_employe_delete.aspx.vb" Inherits="Page_Admin_admin_employe_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
<h3>Supprimer des employés</h3>
</div>

<div class="contenuClient">

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="listeEmploye" runat="server" Text="Liste des employés"></asp:Label>
</div>
</div>  

    <asp:ListView ID="lvEmploye" runat="server" DataSourceID="dsEmploye" DataKeyNames="idEmploye,idMembre">
        <LayoutTemplate>
            <div class="infoClient">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="clientInfoGauche supprimerBoutonEmploye">
                <div class="partiGauche supprimerBoutonEmploye">
                <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("MembresJeu.prenomMembre ") %>'></asp:Label>
                <asp:Label ID="lblNomEmploye" runat="server" Text='<%# Eval("MembresJeu.nomMembre ") %>'></asp:Label>
                </div>
                
                <div class="partiDroite supprimerBoutonEmploye">
                    <asp:Button ID="btnSupprimer"  runat="server" CommandName="Delete" Text="Supprimer" CssClass="btn btn-primary btn-danger"/>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>

</div>
</div>

<%--    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Employe" EnableFlattening="False"
    EnableDelete="false" EnableInsert="false" EnableUpdate="false" orderBy="it.idEmploye" 
    where="(@EmployeID = it.idEmploye)"
    Select="it.idEmploye, it.idMembre,it.MembresJeu.nomMembre,it.MembresJeu.prenomMembre,(it.MembresJeu.[prenomMembre]+' '+it.MembresJeu.[nomMembre]) as FullName, it.MembresJeu.adresse, it.MembresJeu.ville, it.MembresJeu.dateNaissance, it.MembresJeu.telephoneMembre, it.MembresJeu.codePostal, it.MembresJeu.courriel, it.MembresJeu.motPasse, it.MembresJeu.dateInscription" >
    </asp:EntityDataSource>--%>

    <asp:EntityDataSource ID="dsEmploye" runat="server"
    ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" 
    EntitySetName="MembresJeu_Employe" 
    EnableFlattening="False"
    EnableDelete="true" 
    EnableInsert="true" 
    EnableUpdate="true" 
    orderBy="it.idEmploye" 
    Include="MembresJeu">
    </asp:EntityDataSource>


</asp:Content>


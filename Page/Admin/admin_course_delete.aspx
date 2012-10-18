<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_course_delete.aspx.vb" Inherits="Page_Admin_admin_course_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
<h3>Supprimer des cours</h3>
</div>

<div class="contenuClient">

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="listeCours" runat="server" Text="Liste des cours"></asp:Label>
</div>
</div>  

    <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
        <LayoutTemplate>
            <div class="infoClient">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="clientInfoGauche supprimerBoutonEmploye">
                <div class="partiGauche supprimerBoutonEmploye">
                <asp:Label ID="lblNomCours" runat="server" Text='<%# Eval("nomCours") %>'></asp:Label>
                </div>
                
                <div class="partiDroite supprimerBoutonEmploye">
                    <asp:Button ID="btnSupprimer"  runat="server" CommandName="Delete" Text="Supprimer" CssClass="btn btn-primary btn-danger" OnClientClick="return confirm('Etes-vous certain?');"/>
                </div>
            </div>

        </ItemTemplate>
    </asp:ListView>
    <div class="boutonAdminRetourDelete">
                    <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx" Text="Retour" CssClass="btn btn-primary"/>
    </div>
</div>
</div>

    <asp:EntityDataSource ID="dsCours" runat="server"
    ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer"
    EntitySetName="CoursJeu"
    EnableFlattening="false"
    EnableDelete="true" EnableInsert="false" 
    EnableUpdate="true"
    EntityTypeFilter="CoursJeu"
    OrderBy="it.nomCours">
    </asp:EntityDataSource> 


</asp:Content>


<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_teacher_delete.aspx.vb" Inherits="Page_Admin_admin_employe_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
<h3>Supprimer des animateurs</h3>
</div>

<div class="contenuClient">

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="listeAnimateur" runat="server" Text="Liste des animateurs"></asp:Label>
</div>
</div>  

    <asp:ListView ID="lvAnimateur" runat="server" DataSourceID="dsAnimateur" DataKeyNames="idMembre">
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

    <asp:EntityDataSource ID="dsAnimateur" runat="server"
    ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer"
    EntitySetName="MembresJeu_Animateur"
    EnableFlattening="false"
    EnableDelete="true" EnableInsert="false" 
    Include="MembresJeu"
    EnableUpdate="true">
    </asp:EntityDataSource> 


</asp:Content>


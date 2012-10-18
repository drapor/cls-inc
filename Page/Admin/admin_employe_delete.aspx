﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_employe_delete.aspx.vb" Inherits="Page_Admin_admin_employe_delete" Theme="Original"%>

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

    <asp:ListView ID="lvEmploye" runat="server" DataSourceID="dsEmploye" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="infoClient">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="clientInfoGauche supprimerBoutonEmploye">
                <div class="partiGauche supprimerBoutonEmploye">
                <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("prenomMembre ") %>'></asp:Label>
                <asp:Label ID="lblNomEmploye" runat="server" Text='<%# Eval("nomMembre ") %>'></asp:Label>
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

    <asp:EntityDataSource ID="dsEmploye" runat="server"
    ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer"
    EntitySetName="MembresJeu"
    EnableFlattening="false"
    EnableDelete="true" EnableInsert="false" 
    EnableUpdate="true"
    EntityTypeFilter="MembresJeu"
    Where="(it.RoleJeu_idRole = 1 OR it.RoleJeu_idRole = 2)"
    OrderBy="it.prenomMembre">
    </asp:EntityDataSource> 


</asp:Content>


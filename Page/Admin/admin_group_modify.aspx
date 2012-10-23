﻿<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_group_modify.aspx.vb" Inherits="Page_Admin_admin_group_modify" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Modifier un groupe</h3>
<br />
</div>

<div class="contenuStandard">
    <div class="partiGauche">
        <div class="formatZone">
            <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours:"></asp:Label>
        </div>
        <br />
        <div class="formatZone">
            <asp:Label ID="lblNomGroupe" runat="server" Text="Nom du groupe:"></asp:Label>
        </div>
        <br />
    </div>

    <div class="partiDroite">
        <div class="formatZone">
            <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
        </div>
        <br />
        <div class="formatZone">
            <asp:DropDownList ID="ddlNomGroupe" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsGroupeSelection" DataTextField="NomGroupe" DataValueField="idGroupe" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
        </div>
        <br />
    </div>


    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsGroupe" DataKeyNames="idGroupe">
        <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>

        <ItemTemplate>
        <div class="groupeBouton">    
            <div class="partiGauche">
                <div class="formatZone">
                    <asp:Label ID="lblNouveauNomGroupe" runat="server" Text="Nouveau nom:"></asp:Label>
                </div>
                <br />
                <div class="formatZone">
                    <asp:Label ID="lblNbsMax" runat="server" Text="Nombre maximal:"></asp:Label>
                </div>
            </div>

            <div class="partiDroite">
                <div class="formatZone">
                    <asp:TextBox ID="txtNomGroupe" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query" Text='<%# Bind("nomGroupe") %>'></asp:TextBox>
                </div>
                <br />
                <div class="formatZone">
                    <asp:TextBox ID="txtNbsMax" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("nbMax") %>'  MaxLength="3" Width="25px"></asp:TextBox>
                </div>
            </div>
            <div class="groupeBouton">
                <div class="boutonGroupeRetour">
                    <asp:Button ID="btnRetour" runat="server" commandName="Cancel" Text="Retour" CssClass="btn btn-primary" Width="120px" />
                </div>
                <div class="boutonGroupeAjout">
                    <asp:Button ID="btnUpdate" runat="server" commandName="Update" Text="Confirmer" CssClass="btn btn-primary" Width="120px" />
                </div> 
            </div>  
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
</div>

<asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="False" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours) AND (@groupeID = it.idGroupe)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCours" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupe" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsGroupeSelection" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCours" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>

</asp:Content>
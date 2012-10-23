﻿<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_group_delete.aspx.vb" Inherits="Page_Admin_admin_group_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Supprimer un groupe</h3>
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
            <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="True" MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
        </div>
        <br />
        <div class="formatZone">
            <asp:DropDownList ID="ddlNomGroupe" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsGroupeSelection" DataTextField="NomGroupe" DataValueField="idGroupe" appendDataBoundItems="True"  MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
        </div>
    </div>


    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsGroupe" DataKeyNames="idGroupe">
        <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />     
        </LayoutTemplate>

        <ItemTemplate>
        <div class="groupeBouton">     
             <div class="boutonGroupeRetour">
                <asp:Button ID="btnDelete" runat="server" commandName="Delete" Text="Supprimer" CssClass="btn btn-primary" Width="120px" />
            </div>
        </div>
        </ItemTemplate>
    </asp:ListView>
</div>
</div>

<asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
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

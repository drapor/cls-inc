﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="description.aspx.vb" Inherits="Page_Autre_description" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerContenuAdmin">

<div class="enteteCategory">
<div class="enteteTexteBlock">
    <h3><asp:Label ID="lblNomCours" runat="server" Text=""></asp:Label></h3>
</div>
<div class="enteteBanner">
    <asp:Image ID="imgCategory" runat="server" />
</div>
</div>

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblInfoSurLeCours" runat="server" Text="Informations sur le cours"></asp:Label>
</div>
</div>
<br />
<br />
    <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
        <LayoutTemplate>  
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>
        <ItemTemplate>
        <div class="blockInfos">
            <asp:Label ID="lblSessionText" SkinID="lblInfos" runat="server" Text="Session: "></asp:Label><br />
            <asp:Label ID="lblPeriodeDeCoursText" SkinID="lblInfos" runat="server" Text="Période de cours: "></asp:Label>
            <asp:Label ID="lblPeriodeDeCours" runat="server" Text='<%# "Du " +((CType(Eval("dateDebutCours"),DateTime)).ToString("D"))+ " au "+((CType(Eval("dateFinCours"),DateTime)).ToString("D"))%>'></asp:Label><br />
            <asp:Label ID="lblPeriodeInscriptionText" SkinID="lblInfos" runat="server" Text="Période d'inscription: "></asp:Label>
            <asp:Label ID="lblPeriodeInscription" runat="server" Text='<%# "Du " +((CType(Eval("dateDebutInscription"),DateTime)).ToString("D"))+ " au "+((CType(Eval("dateFinInscription"),DateTime)).ToString("D"))%>'></asp:Label><br />
            <asp:Label ID="lblCoursPrerequis" SkinID="lblInfos" runat="server" Text="Cours prérequis: "></asp:Label>
            <asp:Label ID="lblPrerequis" Text='<%# Eval("prerequis") %>' runat="server"></asp:Label><br />
            <asp:Label ID="lblGroupeAgeTexte" SkinID="lblInfos"  runat="server" Text="Groupe d'âge: "></asp:Label>
            <asp:Label ID="lblGroupeAge" Text='<%# Eval("groupeAge") %>' runat="server"></asp:Label><br />
            <asp:Label ID="lblAnimateurTexte" SkinID="lblInfos" runat="server" Text="Animateur: "></asp:Label>
            <asp:Label ID="lblPrenomAnimateur" runat="server" Text='<%# Eval("MembresJeu_Animateur.MembresJeu.prenomMembre ") %>'></asp:Label>
            <asp:Label ID="lblNomAnimateur" runat="server" Text='<%# Eval("MembresJeu_Animateur.MembresJeu.nomMembre") %>'></asp:Label><br />
            <asp:Label ID="lblDescription" Text='<%# Eval("description") %>' runat="server"></asp:Label>
        </div>
        <asp:HiddenField ID="hiddenNomCours" Value='<%# Eval("nomCours") %>' runat="server" />

        <div class="section">
            <div class="sectionTitre">
            <asp:Label ID="lblDescriptionCouts" runat="server" Text="Description des coûts"></asp:Label>
            </div>
        </div>

        <div class="blockCout">
        <div class="blockTarif">
        <asp:Label ID="lblTarifAdulteTexte" SkinID="lblInfos" runat="server" Text="Tarif Adulte: "></asp:Label>
        <asp:Label ID="lblTarifAdulte" runat="server" Text='<%# Eval("tarifAdulte") %>'></asp:Label><br />
        </div>
        <div class="blockTarif">
        <asp:Label ID="lblTarifEnfantTexte" SkinID="lblInfos" runat="server" Text="Tarif Enfant: "></asp:Label>
        <asp:Label ID="lblTarifEnfant" runat="server" Text='<%# Eval("tarifEnfant") %>'></asp:Label>
        </div>
        <div class="blockBoutonInscription">
        <asp:Button ID="btnJeMinscris" runat="server" Text="Je m'inscris !" CssClass="btn btn-primary" />  
        </div> 
        </div>            
        </ItemTemplate>
    </asp:ListView>

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblHoraire" runat="server" Text="Horaires et places disponibles"></asp:Label>
</div>
</div>
      <asp:Button ID="btnRetour" runat="server"  Text="Retour" CssClass="btn btn-primary btnPadding" OnClick="retourCategorie" />
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True"
    Include="MembresJeu_Animateur, MembresJeu_Animateur.MembresJeu"
    where="(it.idCours = @cours)">
    <WhereParameters>
        <asp:Parameter Name="cours" DbType="Int16" DefaultValue="Nothing"  />
    </WhereParameters>
    </asp:EntityDataSource>
</div>

</asp:Content>


<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeFile="admin_schedule_delete.aspx.vb" Inherits="Page_Admin_admin_schedule_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Supprimer un horaire</h3>
<br />
</div>

<div class="contenuStandard">

        <div class="interieurGauche">
            <div class="formatZone">
                <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours:"></asp:Label>
            </div>
            <br />
            <div class="formatZone">
                <asp:Label ID="lblNomGroupe" runat="server" Text="Nom du groupe:"></asp:Label>
            </div>
            <br />
        </div>

        <div class="interieurDroit">
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
            </div>
            <br />
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomGroupe" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsGroupe" DataTextField="NomGroupe" DataValueField="idGroupe" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
            </div>
            <br />
        </div>
        
    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire">
        <LayoutTemplate>
            <div style="width:900px; float:left;">
                <div class="titreJourSemaine">
                    <asp:Label ID="lblTitreJourSemaine" runat="server" Text="Jour de la semaine:"></asp:Label>
                </div>
                <div class="titreHeureDebut">
                    <asp:Label ID="lblTitreDebut" runat="server" Text="Heure de début:"></asp:Label>
                </div>
                <div class="titreHeureFin">
                    <asp:Label ID="lblTitreFin" runat="server" Text="Heure de fin:"></asp:Label>
                </div>
            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
            <div class="groupeBouton">
                <div class="boutonGroupeRetour" style="margin-bottom:20px;">
                    <asp:Button ID="btnRetour" runat="server" Text="Retour page admin" CssClass="btn btn-primary" Width="150px" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
                </div>
            </div>  
        </LayoutTemplate>
        <ItemTemplate>  
                 <div class="titreJourSemaine">
                     <asp:Label ID="lblJourSemaine" runat="server" Text="Label"></asp:Label>
                 </div>                 
        </ItemTemplate>
    </asp:ListView>
</div>
</div>

    <asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCours" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.nomCours">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idHoraire">
    </asp:EntityDataSource>

</asp:Content>
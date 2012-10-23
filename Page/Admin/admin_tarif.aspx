<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_tarif.aspx.vb" Inherits="Page_Admin_admin_group_modify" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Modifier les tarifs</h3>
<br />
</div>
    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsTarif" DataKeyNames="idTarif">
        <LayoutTemplate>
        <div class="infoCours">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </div>
        </LayoutTemplate>
        <InsertItemTemplate>
        </InsertItemTemplate>
        <ItemTemplate>
        <div class="section">
            <div class="sectionTitre">
            <asp:Label ID="lblTarifNouveauMembre" runat="server" Text="Tarif nouveau membre"></asp:Label>
            </div>
        </div>
            <asp:Label ID="lblVeuillezEntreTarifNouveauMembre" runat="server" Text="Veuillez entrer le tarif d'un nouveau membre"></asp:Label><br />
            <asp:TextBox ID="txtTarifNouveauMembre" SkinID="txtBoxYellowPerso" Width="40px" runat="server" CssClass="search-query" Text='<%# Bind("idTarif") %>'></asp:TextBox>
        <div class="section">
            <div class="sectionTitre">
            <asp:Label ID="lblRabaisEnfant" runat="server" Text="Rabais enfants"></asp:Label>
            </div>
        </div>
        <div class="ligneRabaisEnfant">
         <asp:Label ID="lblTarifChaqueEnfant" runat="server" Text="Veuillez entrer les rabais (%) attribué pour chaque enfants abonné"></asp:Label>
         </div>
         <div class="ligneRabaisEnfant">
            <asp:Label ID="lbl1erEnfant" runat="server" Text="1er Enfant: "></asp:Label>
            <asp:TextBox ID="txtRabais1erEnfant" SkinID="txtBoxYellowPerso" runat="server" Width="30px" CssClass="search-query" Text='<%# Bind("rabais1Enfant") %>'></asp:TextBox><br />
         </div> 
         <div class="ligneRabaisEnfant">
            <asp:Label ID="lbl2eEnfant" runat="server" Text="2e Enfant:  "></asp:Label>
            <asp:TextBox ID="txtRabais2eEnfant" SkinID="txtBoxYellowPerso" runat="server" Width="30px" CssClass="search-query" Text='<%# Bind("rabais2Enfant") %>'></asp:TextBox><br />
        </div> 
        <div class="ligneRabaisEnfant">
            <asp:Label ID="lbl3eEnfant" runat="server" Text="3e Enfant:  "></asp:Label>
            <asp:TextBox ID="txtRabais3eEnfant" SkinID="txtBoxYellowPerso" runat="server" Width="30px" CssClass="search-query" Text='<%# Bind("rabais3Enfant") %>'></asp:TextBox><br />
        </div> 
        <div class="ligneRabaisEnfant">
                    <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx" Text="Retour" CssClass="btn btn-primary" Width="120px" />
                    <asp:Button ID="btnUpdate" runat="server" commandName="Update" Text="Confirmer" CssClass="btn btn-primary" Width="120px" />
                    </div>
        </ItemTemplate>
    </asp:ListView>
</div>

<asp:EntityDataSource ID="dsTarif" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="TarifsJeu" EnableFlattening="False"
    EnableDelete="False" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>


</asp:Content>
